import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learning/data/response/auth_response.dart';
import 'package:learning/src/auth/presentation/common/pwd_change_email_reusable_scaffold.dart';
import 'package:learning/src/auth/presentation/forget_password_by_mail/forgot_pwd_with_email.dart';
import 'package:learning/src/auth/presentation/forgot_password_by_question/forgot_pwd_with_question.dart';
import 'package:learning/src/common_widget/button_image.dart';
import 'package:learning/src/main_map/presentation/farmer_map.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPasswordTypeScreen extends StatefulWidget {
  static const routeName = '/forgot_password_type';
  const ForgotPasswordTypeScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordTypeScreen> createState() =>
      _ForgotPasswordTypeScreenState();
}

class _ForgotPasswordTypeScreenState extends State<ForgotPasswordTypeScreen> {
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);
    return PwdChangeEmailScaffold(
      title: 'လျှို့၀ှက်နံပါတ်ပြောင်းမယ်',
      topPadding: 75,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ButtonImage(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 50,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordWithEmail(),
                        ),
                      );
                    },
                    buttonText: 'အီးမေးလ်နဲ့ ပြောင်းမယ်။',
                    buttonImage: 'assets/images/button_orange.png'),
                const SizedBox(height: 20),
                ButtonImage(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 50,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPwdWithQuestion(),
                        ),
                      );
                    },
                    buttonText: 'မေးခွန်းဖြေပြီး ပြောင်းမယ်။',
                    buttonImage: 'assets/images/button_yellow.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  register(
      BuildContext context,
      String name,
      String password,
      String passwordConfirm,
      String email,
      String phone,
      String dob,
      String state,
      String userType,
      String fireToken,
      String profession) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      'content-type': 'application/json',
    };

    log('https://wwf.360ed.com/api/login');
    final response =
        await http.post(Uri.parse('https://wwf.360ed.com/api/login'),
            headers: headers,
            body: jsonEncode(<String, String>{
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
    }));
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
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
        context,
        MaterialPageRoute(
            builder: (context) => FarmerMapScreen(
                  fromModule: false,
                )),
      );
    }
  }
}
