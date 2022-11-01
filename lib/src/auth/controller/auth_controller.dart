import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:learning/data/response/auth_response.dart';
import 'package:learning/src/app.dart';
import 'package:learning/src/auth/presentation/login.dart';
import 'package:learning/src/auth/presentation/password_change.dart';
import 'package:learning/src/common_widget/common_error_dialog.dart';
import 'package:learning/src/common_widget/error_dialog.dart';
import 'package:learning/src/main_map/presentation/farmer_map.dart';
import 'package:learning/src/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> _monthList = [
  //in short terms
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

enum ForgetPasswordType { question, email }

class AuthController extends StateNotifier<AsyncValue<void>> {
  AuthController() : super(const AsyncData(null));

  String _covertMonthToNumber(String month) {
    for (var i in _monthList) {
      if (i == month) {
        return _monthList.indexOf(i).toString().length == 1
            ? '0$_monthList.indexOf(i)'
            : '$_monthList.indexOf(i)';
      }
    }
    return '';
  }

  Future<void> forgetPassword({
    required ForgetPasswordType type,
    String? email,
    String? userName,
    String? year,
    String? month,
    String? date,
  }) async {
    state = const AsyncLoading();
    final body = type == ForgetPasswordType.email
        ? {
            'type': 'email',
            'email': email,
          }
        : {
            'type': 'question',
            'user_name': userName,
            'dob': '$year-${_covertMonthToNumber(month ?? '')}-$date'
          };

    final response = await http.post(
      Uri.parse(
        'https://wwf.360ed.com/api/forget-password',
      ),
      headers: kHeadersPlain(),
      body: jsonEncode(body),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      state = const AsyncData(null);
      if (type == ForgetPasswordType.email) {
        if (result['code'] == 200) {
          Navigator.push(
            navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
          ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
              const SnackBar(content: Text('Code has been sent to email.')));
        } else {
          showDialog(
              context: navigatorKey.currentContext!,
              builder: (context) => const CommonErrorDialog());
        }
      } else {
        if (result['code'] == 200) {
          Navigator.push(
            navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (context) => const PasswordChange(),
            ),
          );
        } else {
          showDialog(
              context: navigatorKey.currentContext!,
              builder: (context) => const QuestionErrorDialog());
        }
      }
    } else {
      state = AsyncError('Server Error', StackTrace.current);
    }
  }

  Future<void> updatePassword(
      {required String password, required String confirmPassword}) async {
    state = const AsyncLoading();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;
    final response = await http.post(
      Uri.parse('https://wwf.360ed.com/api/update-password'),
      headers: kHeaders(token),
      body: jsonEncode(
        {
          "token": token,
          "password": password,
          "password_confirmation": confirmPassword,
        },
      ),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      if (result['code'] == 200) {
        state = const AsyncData(null);
        Navigator.push(
          navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
            const SnackBar(content: Text('Password changed successfully')));
      } else {
        showDialog(
            context: navigatorKey.currentContext!,
            builder: (context) => const CommonErrorDialog());
      }
    }
  }

  Future<void> register({
    required String name,
    required String password,
    required String passwordConfirm,
    required String email,
    required String phone,
    required String dob,
    required String state,
    required String userType,
    required String profession,
    required String fireToken,
  }) async {
    this.state = const AsyncLoading();
    final response =
        await http.post(Uri.parse('https://wwf.360ed.com/api/register'),
            headers: kHeadersPlain(),
            body: jsonEncode(<String, String>{
              'user_name': name,
              'password': password,
              'password_confirmation': passwordConfirm,
              'email': email,
              'phone': phone,
              'dob': dob,
              'state': state,
              'user_type': userType,
              'profession': profession,
              'device_token': fireToken
            }));
    log(jsonEncode(<String, String>{
      'username': name,
      'password': password,
      'password_confirmation': passwordConfirm,
      'email': email,
      'phone': phone,
      'dob': dob,
      'state': state,
      'user_type': userType,
      'profession': profession,
      'device_token': fireToken
    }));
    log('${response.statusCode}status code');
    log(response.body);
    final result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      if (result['code'] == 200) {
        this.state = const AsyncData(null);
        AuthResponse data = AuthResponse.fromJson(jsonDecode(response.body));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", data.apiToken.toString());
        if (data.user != null) {
          if (data.user!.userName != null) {
            prefs.setString("name", data.user!.userName!.toString());
          }
          if (data.user!.age != null) {
            prefs.setString("age", data.user!.age!.toString());
          }
          if (data.user!.phone != null) {
            prefs.setString("phone", data.user!.phone!.toString());
          }
          if (data.user!.email != null) {
            prefs.setString("email", data.user!.email!.toString());
          }
          if (data.user!.profession != null) {
            prefs.setString("profession", data.user!.profession!.toString());
          }
          if (data.user!.userType != null) {
            prefs.setString("user_type", data.user!.userType!.toString());
          }
          if (data.user!.state != null) {
            prefs.setString("state", data.user!.state!.toString());
          }
          if (data.user!.dob != null) {
            prefs.setString("dob", data.user!.dob!.toString());
          }
          if (data.user!.sId != null) {
            prefs.setString("s_id", data.user!.sId!.toString());
          }
          if (data.user!.createdAt != null) {
            prefs.setString("created_at", data.user!.createdAt!.toString());
          }
          if (data.user!.updatedAt != null) {
            prefs.setString("updated_at", data.user!.updatedAt!.toString());
          }
          if (data.user!.lastLogin != null) {
            prefs.setString("v", data.user!.lastLogin!.toString());
          }
          if (data.user!.isEmailVerified != null) {
            prefs.setString(
                "is_email_verified", data.user!.isEmailVerified!.toString());
          }
        }

        Navigator.push(
          navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) =>  FarmerMapScreen(fromModule: false,)),
        );
      } else {
        showDialog(
            context: navigatorKey.currentContext!,
            builder: (context) => ErrorDialog(message: result['message']));
      }
    }
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>(
  (_) => AuthController(),
);

final myTokenProvider = StateProvider((_) => '');
