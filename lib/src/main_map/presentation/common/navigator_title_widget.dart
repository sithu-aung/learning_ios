import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class NavigatorTitleWidget extends StatelessWidget {
  const NavigatorTitleWidget(
      {super.key,
      required this.leftText,
      required this.middleText,
      required this.rightText,
      required this.leftAction,
      required this.rightAction});
  final String leftText;
  final String middleText;
  final String rightText;
  final Function leftAction;
  final Function rightAction;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: MediaQuery.of(context).size.width * 0.39,
          top: -10,
          child: Transform.scale(
            scale: 1.6,
            child: Image.asset(
              "assets/images/center_title.png",
              width: MediaQuery.of(context).size.width * 0.21,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        BouncingWidget(
          duration: const Duration(milliseconds: 400),
          scaleFactor: 0.8,
          onPressed: () async {
            leftAction();
          },
          child: Container(
            margin: EdgeInsets.only(
                top: 0, left: MediaQuery.of(context).size.width * 0.324),
            width: MediaQuery.of(context).size.width * 0.21,
            height: 104,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/mb1.png",
                  fit: BoxFit.fill,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 12),
                  child: Text(
                    leftText,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.white, height: 1.7, fontSize: 7),
                  ),
                ),
              ],
            ),
          ),
        ),
        BouncingWidget(
          duration: const Duration(milliseconds: 400),
          scaleFactor: 0.8,
          onPressed: () async {
            rightAction();
          },
          child: Container(
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.54),
            padding: const EdgeInsets.only(top: 0),
            width: MediaQuery.of(context).size.width * 0.18,
            height: 104,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/mb3.png",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 22),
                  child: Text(
                    rightText,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.white, height: 1.7, fontSize: 7),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 0, left: MediaQuery.of(context).size.width * 0.315),
          padding: const EdgeInsets.only(top: 0),
          width: MediaQuery.of(context).size.width * 0.08,
          height: 20,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/left_back.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.61),
          padding: const EdgeInsets.only(top: 0),
          width: MediaQuery.of(context).size.width * .06,
          child: Image.asset(
            "assets/images/right_back.png",
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 36, left: MediaQuery.of(context).size.width * 0.42),
          padding: const EdgeInsets.only(top: 22),
          width: MediaQuery.of(context).size.width * 0.15,
          height: 86,
          child: Transform.rotate(
            angle: math.pi / 180 * -1,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/mb2.png",
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  // padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Center(
                    child: Text(
                      middleText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white, height: 1.3, fontSize: 7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.41),
            padding: const EdgeInsets.only(top: 12),
            width: MediaQuery.of(context).size.width * 0.16,
            height: 50,
            child: Image.asset("assets/images/logo_txt.png")),
      ],
    );
  }
}
