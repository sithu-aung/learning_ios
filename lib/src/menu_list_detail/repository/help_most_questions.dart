import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/src/auth/controller/auth_controller.dart';
import 'package:learning/src/menu_list_detail/model/most_question_response.dart';
import 'package:learning/src/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MostQuestions {
  Future<MostQuestionResponse> mostQuestions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    var response = await http.get(
        Uri.parse('https://wwf.360ed.com/api/get-faq'),
        headers: kHeaders(token));
    log(response.statusCode.toString());
    log(response.body);
    if (response.statusCode == 200) {
      return MostQuestionResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception(jsonDecode(response.body)['message']);
  }
}

final mostQuestionProvider = Provider<MostQuestions>((ref) {
  return MostQuestions();
});

final mostQuestionControllerProvider = FutureProvider((ref) async {
  ref.watch(myTokenProvider);
  return ref.read(mostQuestionProvider).mostQuestions();
});
