import 'dart:developer';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/src/main_map/controller/friend_respond_controller.dart';
import 'package:learning/src/main_map/presentation/friend_map/friend_farmer_map.dart';
import 'package:learning/src/main_map/repository/map_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FriendListDrawer extends ConsumerStatefulWidget {
  const FriendListDrawer({super.key});

  @override
  ConsumerState<FriendListDrawer> createState() => _FriendListDrawerState();
}

class _FriendListDrawerState extends ConsumerState<FriendListDrawer> {
  @override
  void initState() {
    super.initState();
    _feedData();
    initial();
  }

  String user_type = "";

  initial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user_type = prefs.getString("user_type") ?? 'farmer';
    log(user_type);
  }

  void _feedData() async {
    final data = await ref.read(getUserListProvider.future);
    ref.read(userListParentProvider).addAll(data.data!.data!);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(top: 5),
            width: 130,
            child: Center(
              child: TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {
                  ref.read(userListSearchQuery.notifier).state = value;
                },
                decoration: InputDecoration.collapsed(
                  filled: true,
                  fillColor: Colors.brown,
                  border: InputBorder.none.copyWith(),
                  hintText: ' ရှာဖွေမယ်။',
                  hintStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  // suffixIcon: Icon(
                  //   Icons.search,
                  //   color: Colors.green,
                  //   size: 16,
                  // ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(user_type != 'farmer' ? 'လယ်သမားများ' : 'သင်တန်းနည်းပြများ',
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            width: 130,
            height: MediaQuery.of(context).size.height * 0.4,
            child: ref.watch(getUserListProvider).when(
                data: (data) {
                  final list = ref.watch(userListSearchList);
                  return ListView.builder(
                    itemBuilder: (context, index) => Container(
                      margin:
                          const EdgeInsets.only(bottom: 5, right: 4, top: 8),
                      child: _FriendListItem(
                        userName: list[index].userName ?? '',
                        status: list[index].status!,
                        userId: list[index].sId!,
                        userType: user_type,
                        addFriend: () async {
                          await ref
                              .read(friendRespondControllerProvider.notifier)
                              .addFriend(userName: list[index].userName!);
                        },
                      ),
                    ),
                    itemCount: list.length,
                  );
                },
                error: (e, st) => Text(
                      '$e',
                      style: const TextStyle(color: Colors.red),
                    ),
                loading: () =>
                    const Center(child: CircularProgressIndicator())),
          ),
        ],
      ),
    );
  }
}

class _FriendListItem extends StatefulWidget {
  const _FriendListItem({
    required this.userName,
    required this.status,
    required this.addFriend,
    required this.userId,
    required this.userType,
  });
  final String userName;
  final String status;
  final String userType;
  final Function addFriend;
  final String userId;
  @override
  State<_FriendListItem> createState() => _FriendListItemState();
}

class _FriendListItemState extends State<_FriendListItem> {
  bool isLoading = false;
  bool added = false;

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      duration: const Duration(
        milliseconds: 400,
      ),
      onPressed: () async {
        if (widget.status == 'friend') {
          if (widget.userType != "farmer") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FriendFarmerMapScreen(
                        userId: widget.userId,
                        userName: widget.userName,
                      )),
            );
          }
        } else if (widget.status == 'can_request' && !isLoading) {
          setState(() {
            isLoading = true;
          });
          await widget.addFriend();
          setState(() {
            isLoading = false;
            added = true;
          });
        }
      },
      child: Row(
        children: [
          Text(
            widget.userName.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          added
              ? Image.asset("assets/images/avator")
              : Column(
                  children: [
                    if (widget.status == 'friend')
                      Image.asset(
                        "assets/images/avator.png",
                        width: 20,
                      )
                    else if (widget.status == 'can_request')
                      isLoading
                          ? const SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                              ),
                            )
                          : Image.asset(
                              "assets/images/add_user.png",
                              width: 20,
                            )
                    else if (widget.status == 'requested')
                      Image.asset(
                        "assets/images/add_friend.png",
                        width: 20,
                      )
                  ],
                ),
        ],
      ),
    );
  }
}
