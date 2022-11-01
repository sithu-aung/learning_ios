import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/src/auth/controller/auth_controller.dart';
import 'package:learning/src/main_map/domain/user_list_response.dart' as d;
import 'package:http/http.dart' as http;
import 'package:learning/src/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapRepo {
  Future<d.UserListResponse> getUserList() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;
    final response = await http.post(
      Uri.parse(
        'https://wwf.360ed.com/api/get-friend-list',
      ),
      headers: kHeaders(token),
      body: jsonEncode({"status": "all"}),
    );
    log(response.body);
    if (response.statusCode == 200) {
      return d.UserListResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Error');
  }
}

final mapRepoProvider = Provider<MapRepo>((ref) {
  return MapRepo();
});

final getUserListProvider = FutureProvider<d.UserListResponse>((ref) async {
  ref.watch(myTokenProvider);
  return ref.watch(mapRepoProvider).getUserList();
});

final userListParentProvider = StateProvider<List<d.Data>>((ref) {
  ref.watch(myTokenProvider);
  return [];
});

final userListSearchQuery = StateProvider<String>((ref) {
  ref.watch(myTokenProvider);
  return '';
});

final userListSearchList = StateProvider<List<d.Data>>((ref) {
  ref.watch(myTokenProvider);
  final list = ref.watch(userListParentProvider);
  return list
      .where((element) =>
          element.userName!.contains(ref.watch(userListSearchQuery)))
      .toList();
});
