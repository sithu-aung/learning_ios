import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:learning/src/main_map/repository/map_repo.dart';
import 'package:learning/src/notification/repository/noti_repo.dart';
import 'package:learning/src/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FriendRespondController extends StateNotifier<AsyncValue<void>> {
  FriendRespondController(this.ref) : super(const AsyncData(null));
  final Ref ref;
  Future<void> respond({required String socialId, required bool accept}) async {
    state = const AsyncLoading();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    final response = await http.post(
      Uri.parse('https://wwf.360ed.com/api/respond-request'),
      headers: kHeaders(token),
      body: jsonEncode(
        {
          "social_id": socialId,
          "action": accept ? "accepted" : 'rejected',
        },
      ),
    );
    final result = jsonDecode(response.body);
    if (result['code'] == 200) {
      ref.invalidate(getNotiListProvider);
      ref.invalidate(getUserListProvider);
      ref.read(userListSearchList).clear();
      state = const AsyncData(null);
    } else {
      state = AsyncError('Error', StackTrace.current);
    }
  }

  Future<void> addFriend({required String userName}) async {
    state = const AsyncLoading();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    final response = await http.post(
      Uri.parse('https://wwf.360ed.com/api/add-friend'),
      headers: kHeaders(token),
      body: jsonEncode({
        "username": userName,
      }),
    );

    final result = jsonDecode(response.body);
    if (result['code'] == 200) {
      ref.invalidate(getNotiListProvider);
      state = const AsyncData(null);
    } else {
      state = AsyncError('Error', StackTrace.current);
    }
  }
}

final friendRespondControllerProvider =
    StateNotifierProvider<FriendRespondController, AsyncValue<void>>((ref) {
  return FriendRespondController(ref);
});
