import 'package:flutter/material.dart';
import 'package:learning/src/common_widget/button_image.dart';
import 'package:learning/src/responsive.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SessionHeader extends StatelessWidget {
  const SessionHeader({
    Key? key,
    this.title,
    this.backButton,
    this.percent,
  }) : super(key: key);

  final String? title;
  final double? percent;

  final GestureTapCallback? backButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          color: const Color.fromARGB(255, 175, 159, 71),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                ButtonImage(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 40,
                    onTap: () {},
                    buttonText: title ?? '...',
                    buttonImage: 'assets/images/titlenoleaf.png'),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: 42, left: MediaQuery.of(context).size.width * 0.15),
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width * 0.7,
            //animation: true,
            lineHeight: Responsive.isMobile(context) ? 8 : 12,
            animationDuration: 1000,
            percent: percent ?? 0,
            animateFromLastPercent: true,
            center: Text(
              "",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Responsive.isMobile(context) ? 16 : 15),
            ),
            barRadius: const Radius.circular(14),
            progressColor: Colors.yellow,
            backgroundColor: Colors.white,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.only(left: 12, top: 6),
            child: Row(children: [
              GestureDetector(
                onTap: backButton,
                child: Image.asset(
                  "assets/images/back.png",
                  width: 36,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              // InkWell(
              //   onTap: () => Navigator.pop(context),
              //   child: Image.asset(
              //     "assets/images/home.png",
              //     width: 36,
              //   ),
              // )
            ]),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(right: 12, top: 6),
          child: Align(
            alignment: Alignment.topRight,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              InkWell(
                onTap: () {},
                child: const SizedBox(
                    height: 36,
                    width: 36,
                    // margin: const EdgeInsets.only(bottom: 12, left: 20),
                    // decoration: shadowDecoration(Colors.white),

                    child: null
                    //  Center(
                    //     child: Image.asset(
                    //   'assets/images/ic_menu.png',
                    // )),
                    ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

class SessionHeaderWithoutProgress extends StatelessWidget {
  const SessionHeaderWithoutProgress({
    Key? key,
    this.title,
    this.backButton,
  }) : super(key: key);

  final String? title;

  final GestureTapCallback? backButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          color: const Color.fromARGB(255, 175, 159, 71),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                ButtonImage(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 40,
                    onTap: () {},
                    buttonText: title ?? '...',
                    buttonImage: 'assets/images/titlenoleaf.png'),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.only(left: 12, top: 6),
            child: Row(children: [
              GestureDetector(
                onTap: backButton,
                child: Image.asset(
                  "assets/images/back.png",
                  width: 36,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              // InkWell(
              //   onTap: () => Navigator.pop(context),
              //   child: Image.asset(
              //     "assets/images/home.png",
              //     width: 36,
              //   ),
              // )
            ]),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(right: 12, top: 6),
          child: Align(
            alignment: Alignment.topRight,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              InkWell(
                onTap: () {},
                child: const SizedBox(
                    height: 36,
                    width: 36,
                    // margin: const EdgeInsets.only(bottom: 12, left: 20),
                    // decoration: shadowDecoration(Colors.white),

                    child: null
                    //  Center(
                    //     child: Image.asset(
                    //   'assets/images/ic_menu.png',
                    // )),
                    ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
