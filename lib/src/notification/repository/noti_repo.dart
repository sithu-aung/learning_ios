import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/src/auth/controller/auth_controller.dart';
import 'package:learning/src/notification/domain/noti_response.dart';
import 'package:http/http.dart' as http;
import 'package:learning/src/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotiRepo {
  Future<NotiListReponse> getNotiList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    final response = await http.post(
      Uri.parse('https://wwf.360ed.com/api/get-noti-lists'),
      headers: kHeaders(token),
      body: jsonEncode({
        "noti_type": "social",
      }),
    );
    log(response.body);
    if (response.statusCode == 200) {
      return NotiListReponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Server Error');
  }
}

final notiRepoProvider = Provider<NotiRepo>((_) => NotiRepo());

final getNotiListProvider = FutureProvider<NotiListReponse>((ref) async {
  ref.watch(myTokenProvider);
  return ref.watch(notiRepoProvider).getNotiList();
});
