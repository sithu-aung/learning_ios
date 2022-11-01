import 'dart:convert';
import 'dart:developer';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:learning/data/data/chap_string.dart';
import 'package:learning/data/request/user_score_request.dart';
import 'package:learning/src/components/book_list.dart';
import 'package:learning/src/components/menu_list.dart';
import 'package:learning/src/components/profile_page.dart';
import 'package:learning/src/components/video_list.dart';
import 'package:learning/src/learning_page/module_entry.dart';
import 'package:learning/src/main_map/presentation/common/common_download_dialog3.dart';
import 'package:learning/src/main_map/presentation/common/friend_list.dart';
import 'package:learning/src/main_map/presentation/common/navigator_title_widget.dart';
import 'package:learning/src/main_map/presentation/farmer_map.dart';
import 'package:learning/src/main_map/presentation/main_map1_widget/mm1_chapter1_dialog.dart';
import 'package:learning/src/main_map/presentation/rubber_map.dart';
import 'package:learning/src/util/constants.dart';
import 'package:learning/tool_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OrganizationMapScreen extends StatefulWidget {
  static const routeName = '/main_map2';
  const OrganizationMapScreen({Key? key}) : super(key: key);

  @override
  State<OrganizationMapScreen> createState() => _OrganizationMapScreenState();
}

class _OrganizationMapScreenState extends State<OrganizationMapScreen> {
  bool folded = true;
  bool mm1ChapterDialog = false;
  String? userName;

  List<String> chapList = [];
  int moduleIndex = 0;
  int chapterIndex = 0;
  String chapTitle = "";
  double module1Score = 0;
  String? scoreString;

  @override
  void initState() {
    super.initState();
    _setName();
  }

  void _setName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('name')!;
    });
    // prefs.getString('module1') != null ? module1 = true : module1 = false;
    // prefs.getString('module2') != null ? module2 = true : module2 = false;
    // prefs.getString('module3') != null ? module3 = true : module3 = false;
    // prefs.getString('module4') != null ? module4 = true : module4 = false;
    // prefs.getString('module5') != null ? module5 = true : module5 = false;

    // //prefs.remove("userscore");
    // if (prefs.getString("userscore") != null) {
    //   scoreString = prefs.getString("userscore") ?? "";
    //   setState(() {
    //     scores = JsonArrayConversion.convertJson3(
    //         jsonDecode(scoreString!).cast<dynamic>());
    //   });

    //   // log("Saved Module Score $scores");
    // } else {
    //   //log("Old Module Score $scores");
    // }
    // Future.delayed(const Duration(seconds: 3), () {
    //   setState(() {});
    //   synchronizeUserData();
    // });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    titleSubject(
                        "လယ်သမားအဖွဲ့အစည်းများ ဖွဲ့စည်းခြင်းနဲ့ \nအားကောင်းစေခြင်း",
                        400,
                        210),

                    otherTitleSubject(
                      "ရေရှည်တည်တံ့တဲ့ သဘာဝရာဘာ",
                      1344,
                      74,
                      3,
                    ),

                    otherTitleSubject(
                        "စိုက်ပျိုးဂေဟစနစ်ဆိုင်ရာ အလေ့အထများ", 490, 70, 2),

                    Positioned(
                      left: 534,
                      top: 370,
                      child: Image.asset(
                        "assets/images/avator_boy2.png",
                        width: 50,
                      ),
                    ),

                    moduleText(
                      2,
                      "Module 3",
                      "module3",
                      false,
                      "",
                      152,
                      60,
                      224,
                      280,
                      "",
                      0,
                      0,
                      90,
                      7,
                    ),

                    // Positioned(
                    //   left: 264,
                    //   top: 330,
                    //   child: Image.asset(
                    //     "assets/images/v3.png",
                    //     height: 96,
                    //   ),
                    // ),
                    // moduleText(
                    //     0,
                    //     "Module 1",
                    //     "module1",
                    //     false,
                    //     "၁။ သီးနှံပင်နှင့် \n စိုက်ပျိုးမည့်မျိုးပြားများ \n  ရွေးချယ်မှု",
                    //     138,
                    //     80,
                    //     124,
                    //     250,
                    //     "assets/images/target1.png",
                    //     40,
                    //     0.5,
                    //     80,
                    //     1),
                  ],
                ),
              ),
            ),

            //Stable
            Positioned(
              left: 20,
              top: 8,
              child: BouncingWidget(
                duration: const Duration(milliseconds: 400),
                scaleFactor: 1.5,
                onPressed: () async {
                  log("Hey");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePageScreen()),
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
            ),
            const FriendList(),
            NavigatorTitleWidget(
              leftText: 'စိုက်ပျိုးဂေဟ\n   စနစ်ဆိုင်ရာ \n      အလေ့အထများ',
              middleText:
                  'လယ်သမားအဖွဲ့အစည်းများ\nဖွဲ့စည်းခြင်းနဲ့ \nအားကောင်းစေခြင်း',
              rightText:
                  '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tရေရှည် \n\t\t\t\t\t        တည်တံ့တဲ့ \n\t\t\t\t\t\tသဘာဝရာဘာ',
              leftAction: () async {
                await Future.delayed(const Duration(milliseconds: 800), () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FarmerMapScreen(fromModule: false)));
                });
              },
              rightAction: () async {
                await Future.delayed(const Duration(milliseconds: 800), () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RubberMapScreen()));
                });
              },
            ),
            // Container(
            //   margin: EdgeInsets.only(
            //       top: 0, left: MediaQuery.of(context).size.width * 0.324),
            //   padding: const EdgeInsets.only(top: 0),
            //   width: MediaQuery.of(context).size.width * 0.08,
            //   child: Padding(
            //     padding: const EdgeInsets.only(right: 20),
            //     child: Image.asset(
            //       "assets/images/left_back.png",
            //     ),
            //   ),
            // ),

            // BouncingWidget(
            //   duration: const Duration(milliseconds: 400),
            //   scaleFactor: 1.5,
            //   onPressed: () async {
            //     Future.delayed(const Duration(milliseconds: 800), () {
            //       Navigator.pushReplacement(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => FarmerMapScreen(fromModule: false)));
            //     });
            //   },
            //   child: Container(
            //     margin: EdgeInsets.only(
            //         top: 0, left: MediaQuery.of(context).size.width * 0.331),
            //     width: MediaQuery.of(context).size.width * 0.11,
            //     height: 104,
            //     child: Stack(
            //       children: [
            //         Image.asset(
            //           "assets/images/mb1.png",
            //         ),
            //         const Padding(
            //           padding: EdgeInsets.only(top: 22, left: 12),
            //           child: Text(
            //             "စိုက်ပျိုးဂေဟ\n   စနစ်ဆိုင်ရာ \n      အလေ့အထများ",
            //             textAlign: TextAlign.left,
            //             style: TextStyle(
            //                 color: Colors.white, height: 1.7, fontSize: 8),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            // Container(
            //   margin: EdgeInsets.only(
            //       left: MediaQuery.of(context).size.width * 0.587),
            //   padding: const EdgeInsets.only(top: 0),
            //   width: MediaQuery.of(context).size.width * 0.06,
            //   child: Image.asset(
            //     "assets/images/right_back.png",
            //   ),
            // ),
            // BouncingWidget(
            //   duration: const Duration(milliseconds: 400),
            //   scaleFactor: 1.5,
            //   onPressed: () async {
            //     Future.delayed(const Duration(milliseconds: 800), () {
            //       Navigator.pushReplacement(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const RubberMapScreen()));
            //     });
            //   },
            //   child: Container(
            //     margin: EdgeInsets.only(
            //         left: MediaQuery.of(context).size.width * 0.53),
            //     padding: const EdgeInsets.only(top: 0),
            //     width: MediaQuery.of(context).size.width * 0.11,
            //     height: 104,
            //     child: Stack(
            //       children: [
            //         Image.asset(
            //           "assets/images/mb3.png",
            //         ),
            //         const Padding(
            //           padding: EdgeInsets.only(top: 22, left: 18),
            //           child: Text(
            //             "              ရေရှည် \n        တည်တံ့တဲ့ \nသဘာဝရာဘာ",
            //             textAlign: TextAlign.left,
            //             style: TextStyle(
            //                 color: Colors.white, height: 1.7, fontSize: 8),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.only(
            //       top: 30, left: MediaQuery.of(context).size.width * 0.42),
            //   padding: const EdgeInsets.only(top: 24),
            //   width: MediaQuery.of(context).size.width * 0.13,
            //   height: 86,
            //   child: Stack(
            //     children: [
            //       Image.asset(
            //         "assets/images/mb2.png",
            //         width: MediaQuery.of(context).size.width * 0.4,
            //       ),
            //       SizedBox(
            //         width: MediaQuery.of(context).size.width * 0.13,
            //         // padding: const EdgeInsets.only(top: 20, left: 20),
            //         child: const Center(
            //           child: Text(
            //             "လယ်သမားအဖွဲ့အစည်းများ ဖွဲ့စည်းခြင်းနဲ့ \nအားကောင်းစေခြင်း",
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //                 color: Colors.white, height: 1.3, fontSize: 8),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Positioned(
            //   left: MediaQuery.of(context).size.width * 0.38,
            //   top: 0,
            //   child: Image.asset(
            //     "assets/images/center_title.png",
            //     width: MediaQuery.of(context).size.width * 0.213,
            //   ),
            // ),
            // Container(
            //     margin: EdgeInsets.only(
            //         left: MediaQuery.of(context).size.width * 0.41),
            //     padding: const EdgeInsets.only(top: 12),
            //     width: MediaQuery.of(context).size.width * 0.15,
            //     height: 50,
            //     child: Image.asset("assets/images/logo_txt.png")),
            // Positioned(
            //   left: MediaQuery.of(context).size.width * 0.82,
            //   top: 8,
            //   child: BouncingWidget(
            //     duration: const Duration(milliseconds: 400),
            //     scaleFactor: 1.5,
            //     onPressed: () async {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const NotificationPage()));
            //     },
            //     child: Image.asset(
            //       "assets/images/ic_noti.png",
            //       width: 56,
            //     ),
            //   ),
            // ),
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
      ),
    );
  }

  Widget otherTitleSubject(String text, double left, double top, int subject) {
    return Positioned(
      left: left,
      top: top,
      child: AnimatedContainer(
        height: 76,
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: BouncingWidget(
          duration: const Duration(milliseconds: 400),
          scaleFactor: 1.5,
          onPressed: () async {
            if (subject == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FarmerMapScreen(fromModule: false)),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RubberMapScreen()),
              );
            }
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/title_leaf.png",
                    height: 56,
                    width: 240,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 56,
                    width: 240,
                    child: Center(
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
                  ),
                ],
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget chapterText(bool open, int modulePosition, int chapterPostion,
      String text, double width, double height, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: open
          ? GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () async {
                if (open) {
                  setState(() {
                    mm1ChapterDialog = true;
                    chapTitle = text.replaceAll("\n", "");
                    chapList = subjects[modulePosition][chapterPostion];
                    moduleIndex = modulePosition;
                    chapterIndex = chapterPostion;
                  });
                  await showDialog(
                      context: context,
                      builder: (context) => MM1Chapter1Dialog(
                            moduleIndex: moduleIndex,
                            chanpterIndex: chapterIndex,
                            title: chapTitle,
                            chapList: chapList,
                            onTap: () {
                              setState(() {
                                mm1ChapterDialog = false;
                              });
                              Navigator.pop(context);
                            },
                            closeOnTap: () {
                              setState(() {
                                mm1ChapterDialog = false;
                              });
                              Navigator.pop(context);
                            },
                          ));
                  setState(() {
                    mm1ChapterDialog = false;
                  });
                }
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
            )
          : const SizedBox.shrink(),
    );
  }

  Widget moduleText(
    int modulePosition,
    String moduleDisplayName,
    String moduleName,
    bool open,
    String text,
    double width,
    double height,
    double left,
    double top,
    String image,
    double size,
    double percent,
    double percentWidth,
    int moduleNumber,
  ) {
    log(modulePosition.toString());
    double moduleScoreAvg = 0;
    // log("Score List $scoreAvg");
    // for (int j = 0; j < scoreAvg[modulePosition].length; j++) {
    //   moduleScoreAvg += scoreAvg[modulePosition][j];
    // }
    // if (scoreAvg[modulePosition].isNotEmpty) {
    //   moduleScoreAvg = moduleScoreAvg / scoreAvg[modulePosition].length;
    // }
    // // log("Average Module Score $moduleScoreAvg");
    // if (modulePosition == 0) {
    //   module1Score = moduleScoreAvg;
    // }

    // if (modulePosition == 2) {
    //   module3Score = moduleScoreAvg;
    // }

    // if (modulePosition == 4) {
    //   module5Score = moduleScoreAvg;
    // }

    return Positioned(
      left: left,
      top: top,
      child: modulePosition == 3 ||
              moduleNumber == 6 ||
              moduleNumber == 7 ||
              moduleNumber == 2
          ? Container(
              decoration: BoxDecoration(
                // color: Color(0xFF0099EE),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(4, 8),
                    blurRadius: 20,
                    spreadRadius: 2,
                  )
                ],
              ),
              margin: EdgeInsets.only(
                  left: moduleNumber == 6 ? 80 : 30,
                  top: moduleNumber == 6 ? 40 : 0),
              // width: 120,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/coming_soon.png",
                  width: 90,
                ),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    if (open) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ModuleEntryScreen(
                                    moduleNumber: moduleNumber,
                                    scores: const [],
                                  )));
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 12),
                    alignment: Alignment.centerLeft,
                    decoration: shadowDecorationWithBorderColor(
                        const Color.fromARGB(100, 255, 255, 255),
                        Colors.yellow,
                        20),
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    width: width,
                    height: height,
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Visibility(
                  visible: size != 0 && open,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: BouncingWidget(
                      duration: const Duration(milliseconds: 400),
                      scaleFactor: 1.5,
                      onPressed: () async {},
                      child: Image.asset(
                        image,
                        height: size,
                      ),
                    ),
                  ),
                ),
                open
                    ? Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: LinearPercentIndicator(
                          width: percentWidth,
                          animation: true,
                          lineHeight: 8,
                          animationDuration: 1000,
                          percent: moduleScoreAvg,
                          center: const Text(
                            "",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          barRadius: const Radius.circular(14),
                          progressColor: Colors.yellow,
                          backgroundColor: Colors.white,
                        ),
                      )
                    : SizedBox(
                        width: 60,
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: BouncingWidget(
                                duration: const Duration(milliseconds: 400),
                                scaleFactor: 1.5,
                                onPressed: () async {
                                  await showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) => DownloadDialog3(
                                            moduleName: moduleName,
                                            moduleDisplayName:
                                                moduleDisplayName,
                                          ));
                                  _setName();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    // color: Color(0xFF0099EE),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        offset: const Offset(4, 8),
                                        blurRadius: 20,
                                        spreadRadius: 2,
                                      )
                                    ],
                                  ),
                                  child: Image.asset(
                                      "assets/images/download.png",
                                      height: 32),
                                ),
                              )),
                        ),
                      ),
              ],
            ),
    );
  }

  Widget moduleButton(
      bool open, String image, double size, double left, double top) {
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
            if (open) {
              Future.delayed(const Duration(milliseconds: 800), () {
                setState(() {
                  mm1ChapterDialog = !mm1ChapterDialog;
                });
              });
            }
          },
          child: Image.asset(
            image,
            height: size,
          ),
        ),
      ),
    );
  }

  Widget chapterButton(
      bool open,
      String image,
      double size,
      double left,
      double top,
      double percent,
      int modulePosition,
      int chapterPostion,
      String text) {
    double avgPercent = 0;
    // if (open) {
    //   log(modulePosition.toString());
    //   for (int i = 0; i < scores[modulePosition][chapterPostion].length; i++) {
    //     avgPercent += scores[modulePosition][chapterPostion][i];
    //   }
    //   if (scores[modulePosition][chapterPostion].isNotEmpty) {
    //     avgPercent = avgPercent / scores[modulePosition][chapterPostion].length;
    //   }
    // }

    // setState(() {
    //   scoreAvg[modulePosition][chapterPostion] = avgPercent;
    // });
    // log("Average Percent of $text is $avgPercent");

    return Positioned(
      left: left,
      top: top,
      child: AnimatedContainer(
        height: size + 8,
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: BouncingWidget(
          duration: const Duration(milliseconds: 400),
          scaleFactor: 1.5,
          onPressed: () async {
            if (open) {
              setState(() {
                mm1ChapterDialog = true;
                chapTitle = text.replaceAll("\n", "");
                chapList = subjects[modulePosition][chapterPostion];
                moduleIndex = modulePosition;
                chapterIndex = chapterPostion;
              });
              await showDialog(
                  context: context,
                  builder: (context) => MM1Chapter1Dialog(
                        moduleIndex: moduleIndex,
                        chanpterIndex: chapterIndex,
                        title: chapTitle,
                        chapList: chapList,
                        onTap: () {
                          setState(() {
                            mm1ChapterDialog = false;
                          });
                          Navigator.pop(context);
                        },
                        closeOnTap: () {
                          setState(() {
                            mm1ChapterDialog = false;
                          });
                        },
                      ));
              setState(() {
                mm1ChapterDialog = false;
              });
            }
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    image,
                    height: size,
                  ),
                  !open
                      ? SizedBox(
                          height: size,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Image.asset(
                                "assets/images/key_lock.png",
                                color: Colors.yellow,
                                width: 22,
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: size,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: LinearPercentIndicator(
                              width: 80,
                              animation: true,
                              lineHeight: 7,
                              animationDuration: 1000,
                              percent: avgPercent,
                              center: const Text(
                                "",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              barRadius: const Radius.circular(14),
                              progressColor: Colors.yellow,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget moduleIcon(
    bool open,
    String image,
    double size,
    double left,
    double top,
    int moduleNumber,
  ) {
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ModuleEntryScreen(
                            moduleNumber: moduleNumber,
                            scores: const [],
                          )));
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
        height: 84,
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: BouncingWidget(
          duration: const Duration(milliseconds: 400),
          scaleFactor: 1.5,
          onPressed: () async {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => LessonProgress(
            //       scores: const [],
            //     ),
            //   ),
            // );
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/title_leaf.png",
                    height: 56,
                    width: 240,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 56,
                    width: 240,
                    child: Center(
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
                  ),
                ],
              ),
              const SizedBox(height: 4),
              SizedBox(
                height: 12,
                width: 200,
                child: LinearPercentIndicator(
                  percent: .0,
                  lineHeight: 12,
                  progressColor: const Color.fromARGB(255, 173, 201, 38),
                  backgroundColor: const Color.fromARGB(255, 167, 114, 74),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  synchronizeUserData() async {
    //post method to synchronize user data with API
    int totalScore = 0;
    List<Subjects> subjects = [];
    subjects.add(Subjects(
        subjectName: "Farmer 1",
        totalSubjectScore: module1Score,
        modules: scoreString));
    log("Score String: $scoreString");
    RequestData requestData =
        RequestData(totalScore: totalScore, subjects: subjects);
    if (scoreString != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      final response = await http.post(
        Uri.parse('https://wwf.360ed.com/api/sync-user-score'),
        headers: kHeaders(token),
        body: jsonEncode(
          {
            "progress_data": requestData,
          },
        ),
      );
      final result = jsonDecode(response.body);
      log(response.body);
      if (result['code'] == 200) {
      } else {}
    }
  }
}
