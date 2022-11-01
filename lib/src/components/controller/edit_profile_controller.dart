import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/src/app.dart';
import 'package:learning/src/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EditProfileController extends StateNotifier<AsyncValue<void>> {
  EditProfileController() : super(const AsyncValue.data(null));

  editProfile({
    required String dob,
    required String state,
    required String email,
    required String phone,
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    var response = await http.post(
      Uri.parse('https://wwf.360ed.com/api/setting'),
      headers: kHeaders(token),
      body: jsonEncode(
        {
          'password': newPassword,
          'password_confirmation': confirmPassword,
          'email': email,
          'dob': dob,
          'state': state,
        },
      ),
    );
    log(response.statusCode.toString());
    log(response.body);
    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: const Text('Success'),
        action: SnackBarAction(
          label: '',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
        content: const Text('Something went wrong'),
        action: SnackBarAction(
          label: '',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
    }
  }
}

final editProfileProvider =
    StateNotifierProvider<EditProfileController, AsyncValue<void>>((ref) {
  return EditProfileController();
});
