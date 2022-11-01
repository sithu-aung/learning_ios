import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learning/src/main_map/presentation/common/friend_list_drawer.dart';
import 'dart:math' as math;

class FriendList extends StatefulWidget {
  const FriendList({super.key});

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  bool folded = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: folded ? -150 : 0,
          top: 90,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/wooden_social.png",
                width: 175,
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * 0.7,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 12),
                child: Image.asset(
                  "assets/images/paper_back.png",
                  width: 150,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.65,
                ),
              ),
              if (!folded)
                const Positioned(
                  top: 5,
                  left: 5,
                  child: FriendListDrawer(),
                ),
            ],
          ),
        ),
        Positioned(
          left: folded ? 8 : 158,
          top: MediaQuery.of(context).size.height * 0.4,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                folded = !folded;
              });
            },
            child: Container(
              height: 120,
              width: 30,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/triangle.png'),
                ),
              ),
              child: folded
                  ? Image.asset(
                      'assets/images/friend_drawer.png',
                    )
                  : Transform.rotate(
                      angle: math.pi,
                      child: Image.asset(
                        'assets/images/friend_drawer.png',
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
