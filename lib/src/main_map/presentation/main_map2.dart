import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/components/book_list.dart';
import 'package:learning/src/components/menu_list.dart';
import 'package:learning/src/components/video_list.dart';
import 'package:learning/src/main_map/presentation/common/friend_list.dart';
import 'package:learning/src/main_map/presentation/farmer_map.dart';
import 'package:learning/src/main_map/presentation/main_map3.dart';
import 'package:learning/tool_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMapSecondOldScreen extends StatefulWidget {
  const MainMapSecondOldScreen({Key? key}) : super(key: key);

  @override
  State<MainMapSecondOldScreen> createState() => _MainMapSecondOldScreenState();
}

class _MainMapSecondOldScreenState extends State<MainMapSecondOldScreen> {
  bool folded = true;

  String userName = "";

  @override
  void initState() {
    super.initState();
    initial();
  }

  initial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString("name") ?? "-";
    });
  }

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);

    return MediaQuery(
        data: mqDataNew,
        child: Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/village.jpg",
                        width: 1600,
                      ),
                    ],
                  ),
                ),
              ),

              //Stable
              //Stable
              Positioned(
                left: 20,
                top: 8,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/wooden_small.png",
                      width: MediaQuery.of(context).size.width * 0.23,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/frame1.png",
                            width: 24,
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
                                userName,
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

              const FriendList(),
              BouncingWidget(
                duration: const Duration(milliseconds: 400),
                scaleFactor: 1.5,
                onPressed: () async {
                  Future.delayed(const Duration(milliseconds: 800), () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FarmerMapScreen(fromModule: false)));
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(
                      top: 4, left: MediaQuery.of(context).size.width * 0.27),
                  decoration: shadowDecorationWithBorderColor(
                      const Color.fromARGB(255, 45, 99, 48),
                      const Color.fromARGB(255, 45, 99, 48),
                      0),
                  padding: const EdgeInsets.only(top: 12),
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: 60,
                  child: const Text(
                    "စိုက်ပျိုးဂေဟစနစ်ဆိုင်ရာ \nအလေ့အထများ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, height: 1.3, fontSize: 11),
                  ),
                ),
              ),
              BouncingWidget(
                duration: const Duration(milliseconds: 400),
                scaleFactor: 1.5,
                onPressed: () async {
                  Future.delayed(const Duration(milliseconds: 800), () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainMapThirdScreen()));
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(
                      top: 4, left: MediaQuery.of(context).size.width * 0.58),
                  decoration: shadowDecorationWithBorderColor(
                      const Color.fromARGB(255, 45, 99, 48),
                      const Color.fromARGB(255, 45, 99, 48),
                      0),
                  padding: const EdgeInsets.only(top: 12),
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: 60,
                  child: const Text(
                    "Substainable\nNatural Rubber",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, height: 1.3, fontSize: 12),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 32, left: MediaQuery.of(context).size.width * 0.42),
                decoration: shadowDecorationWithBorderColor(
                    const Color(0xffe0e0e0), const Color(0xffe0e0e0), 0),
                padding: const EdgeInsets.only(top: 17),
                width: MediaQuery.of(context).size.width * 0.16,
                height: 70,
                child: const Text(
                  "Developing and\nStrengthening\nFarmer Associations",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.black, height: 1.3, fontSize: 12),
                ),
              ),

              Positioned(
                left: MediaQuery.of(context).size.width * 0.4,
                top: 0,
                child: Image.asset(
                  "assets/images/center_title.png",
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 4, left: MediaQuery.of(context).size.width * 0.43),
                padding: const EdgeInsets.only(top: 12),
                width: MediaQuery.of(context).size.width * 0.15,
                height: 60,
                child: const Text(
                  "WWF App",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white, height: 1.3, fontSize: 16),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.82,
                top: 8,
                child: BouncingWidget(
                  duration: const Duration(milliseconds: 400),
                  scaleFactor: 1.5,
                  onPressed: () async {},
                  child: Image.asset(
                    "assets/images/ic_noti.png",
                    width: 56,
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.9,
                top: 8,
                child: BouncingWidget(
                  duration: const Duration(milliseconds: 400),
                  scaleFactor: 1.5,
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuListScreen()));
                  },
                  child: Image.asset(
                    "assets/images/buttons_menu.png",
                    width: 56,
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.82,
                top: MediaQuery.of(context).size.height * 0.83,
                child: BouncingWidget(
                  duration: const Duration(milliseconds: 400),
                  scaleFactor: 1.5,
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const BookListByModuleScreen()));
                  },
                  child: Image.asset(
                    "assets/images/ic_book.png",
                    width: 56,
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.9,
                top: MediaQuery.of(context).size.height * 0.83,
                child: BouncingWidget(
                  duration: const Duration(milliseconds: 400),
                  scaleFactor: 1.5,
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const VideoListByModuleScreen()));
                  },
                  child: Image.asset(
                    "assets/images/ic_media.png",
                    width: 56,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget keyLock(double width, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: Image.asset(
        "assets/images/key_lock.png",
        color: Colors.yellow,
        width: width,
      ),
    );
  }

  Widget percentIndicator(
      double percent, double width, double height, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: LinearPercentIndicator(
        width: width,
        animation: true,
        lineHeight: height,
        animationDuration: 1000,
        percent: percent,
        center: const Text(
          "",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        barRadius: const Radius.circular(14),
        progressColor: Colors.yellow,
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget chapterText(
      String text, double width, double height, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const LearningPage1()));
        },
        child: Container(
          padding: const EdgeInsets.only(left: 12),
          alignment: Alignment.centerLeft,
          decoration: shadowDecorationWithBorderColor(
              const Color.fromARGB(100, 255, 255, 255),
              const Color.fromARGB(100, 255, 255, 255),
              20),
          margin: const EdgeInsets.symmetric(horizontal: 60),
          width: width,
          height: height,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 10),
          ),
        ),
      ),
    );
  }

  Widget subjectText(
      String text, double width, double height, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const LearningPage1()));
        },
        child: Container(
          padding: const EdgeInsets.only(left: 12),
          alignment: Alignment.centerLeft,
          decoration: shadowDecorationWithBorderColor(
              const Color.fromARGB(100, 255, 255, 255), Colors.yellow, 20),
          margin: const EdgeInsets.symmetric(horizontal: 60),
          width: width,
          height: height,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget chapterButton(String image, double size, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: AnimatedContainer(
        height: size,
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: BouncingWidget(
          duration: const Duration(milliseconds: 400),
          scaleFactor: 1.5,
          onPressed: () async {
            Future.delayed(const Duration(milliseconds: 800), () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const LearningPage1()));
            });
          },
          child: Image.asset(
            image,
            height: size,
          ),
        ),
      ),
    );
  }

  Widget subjectIcon(String image, double size, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: AnimatedContainer(
        height: size,
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: BouncingWidget(
          duration: const Duration(milliseconds: 400),
          scaleFactor: 1.5,
          onPressed: () async {
            Future.delayed(const Duration(milliseconds: 800), () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const LearningPage1()));
            });
          },
          child: Image.asset(
            image,
            height: size,
          ),
        ),
      ),
    );
  }

  Widget titleSubject(String text, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: AnimatedContainer(
        height: 56,
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: BouncingWidget(
          duration: const Duration(milliseconds: 400),
          scaleFactor: 1.5,
          onPressed: () async {},
          child: Stack(
            children: [
              Image.asset(
                "assets/images/title_leaf.png",
                height: 56,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 54, top: 14),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      height: 1.2,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
