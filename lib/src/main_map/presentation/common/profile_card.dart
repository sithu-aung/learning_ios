import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/components/profile_page.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.userName,
  });
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      top: 8,
      child: BouncingWidget(
        duration: const Duration(milliseconds: 400),
        scaleFactor: 1.5,
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfilePageScreen()),
          );
        },
        child: Stack(
          children: [
            Image.asset(
              "assets/images/wooden_small.png",
              width: MediaQuery.of(context).size.width * 0.23,
              height: 64,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        "assets/images/frame1.png",
                        width: 40,
                      ),
                      Image.asset(
                        'assets/images/avator_boy2.png',
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        userName ?? '...',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/ic_trophy.png",
                            width: 18,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Image.asset(
                            "assets/images/ic_trophy.png",
                            width: 18,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Image.asset(
                            "assets/images/ic_trophy.png",
                            width: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
