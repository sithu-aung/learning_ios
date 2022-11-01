import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/data/data/chap_string.dart';
import 'package:learning/src/common_widget/button_image.dart';
import 'package:learning/src/common_widget/page_pusher_button.dart';
import 'package:learning/src/common_widget/small_circle_container.dart';
import 'package:learning/src/interactive/congratulation_dialog.dart';
import 'package:learning/src/interactive/quizz_page1.dart';
import 'package:learning/src/interactive/quizz_page2.dart';
import 'package:learning/src/interactive/quizz_repo/quizz_page2_list.dart';
import 'package:learning/src/learning_page/chapters/chapter_page.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_header.dart';
import 'package:learning/src/main_map/presentation/farmer_map.dart';
import 'package:learning/tool_widgets.dart';

class QuizzPage3 extends ConsumerStatefulWidget {
  const QuizzPage3({super.key});

  @override
  ConsumerState<QuizzPage3> createState() => _QuizzPage3State();
}

class _QuizzPage3State extends ConsumerState<QuizzPage3> {
  bool button = false;
  bool nextPage = false;
  bool answerCorrect = false;
  final multiselect = quizlist2
      .map(
        (e) => MultiSelectCard(
          value: e.multiSelect,
          label: e.multiSelect,
          textStyles: const MultiSelectItemTextStyles(
              textStyle: TextStyle(color: Colors.white)),
          margin: const EdgeInsets.symmetric(
            horizontal: 60,
            vertical: 12,
          ),
        ),
      )
      .toList();
  dynamic selected = '';

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);
    return MediaQuery(
      data: mqData,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 225, 255, 147),
        body: SafeArea(
          child: Stack(
            children: [
              BackgroundPage(
                backImage: "assets/images/agre_back.jpg",
              ),
              const SessionHeader(
                title: '၁.၁။ မြေဆီလွှာဆိုသည်မာ အဘယ်နည်း',
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerLeft,
                      decoration: shadowDecorationWithBorderColor(
                          const Color.fromARGB(200, 113, 101, 45),
                          const Color.fromARGB(200, 113, 101, 45),
                          12),
                      margin: const EdgeInsets.symmetric(horizontal: 60),
                      width: double.infinity,
                      height: 80,
                      child: const Text(
                        'အချိန်သည် မြေဆီလွှာဖြစ်ပေါ်လာရခြင်းအပေါ် လွှမ်းမိုးမှုရှိသည်။',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Wrap(
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      children: [
                        MultiSelectContainer(
                          singleSelectedItem: true,
                          controller: MultiSelectController(),
                          itemsDecoration: MultiSelectDecorations(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 120, 126, 184),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            disabledDecoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            selectedDecoration: BoxDecoration(
                                color: answerCorrect
                                    ? Colors.green
                                    : const Color.fromARGB(255, 45, 50, 112),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                          ),
                          maxSelectableCount: 1,
                          items: multiselect,
                          onChange: ((selectedItems, selectedItem) {
                            setState(() {
                              selected = selectedItem;
                              button = true;
                            });
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    ButtonImage(
                        width: 150,
                        height: 50,
                        onTap: () {
                          if (selected == "") {
                            final snackBar = SnackBar(
                              content: const Text(
                                  'အဖြေ ရွေးချယ်ပေးရန် လိုအပ်ပါသည်။'),
                              action: SnackBarAction(
                                label: 'ပိတ်မည်',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            if (selected == "မှန်") {
                              setState(() {
                                 answerCorrect = true;
                              });
                              _showSuccessAlertDialog();
                            } else {
                              _showFailAlertDialog();
                            }
                          }
                        },
                        buttonText: 'အဖြေစစ်မယ်',
                        buttonImage: 'assets/images/button_green_round.png'),
                    // Stack(
                    //   children: [
                    //     GestureDetector(
                    //       behavior: HitTestBehavior.translucent,
                    //       onTap: () {
                    //         if (selected == "") {
                    //           final snackBar = SnackBar(
                    //             content: const Text(
                    //                 'အဖြေ ရွေးချယ်ပေးရန် လိုအပ်ပါသည်။'),
                    //             action: SnackBarAction(
                    //               label: 'ပိတ်မည်',
                    //               onPressed: () {
                    //                 // Some code to undo the change.
                    //               },
                    //             ),
                    //           );
                    //           ScaffoldMessenger.of(context)
                    //               .showSnackBar(snackBar);
                    //         } else {
                    //           if (selected == "မှန်") {
                    //             setState(() {
                    //               answerCorrect = true;
                    //             });
                    //             _showSuccessAlertDialog();
                    //           } else {
                    //             _showFailAlertDialog();
                    //           }
                    //         }
                    //       },
                    //       child: Image.asset(
                    //         "assets/images/check_answer.png",
                    //         width: 150,
                    //       ),
                    //     ),
                    //     GestureDetector(
                    //       behavior: HitTestBehavior.translucent,
                    //       onTap: () {
                    //         if (selected == "") {
                    //           final snackBar = SnackBar(
                    //             content: const Text(
                    //                 'အဖြေ ရွေးချယ်ပေးရန် လိုအပ်ပါသည်။'),
                    //             action: SnackBarAction(
                    //               label: 'ပိတ်မည်',
                    //               onPressed: () {
                    //                 // Some code to undo the change.
                    //               },
                    //             ),
                    //           );
                    //           ScaffoldMessenger.of(context)
                    //               .showSnackBar(snackBar);
                    //         } else {
                    //           if (selected == "မှန်") {
                    //             setState(() {
                    //               answerCorrect = true;
                    //             });
                    //             _showSuccessAlertDialog();
                    //           } else {
                    //             _showFailAlertDialog();
                    //           }
                    //         }
                    //       },
                    //       child: Container(
                    //         alignment: Alignment.center,
                    //         width: 150,
                    //         height: 50,
                    //         child: const Text(
                    //           'အဖြေစစ်မယ်',
                    //           style:
                    //               TextStyle(color: Colors.black, fontSize: 16),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: QuizCircleIndex(),
              ),
              PagePusherButton(
                forward: false,
                onTap: () {
                  ref.read(quizzIndexProvider.notifier).state = 1;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const QuizzPage2())));
                },
              ),
              PagePusherButton(
                forward: true,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => CongrulationDialog(
                          firstText: '၁.၁.၁။ မြေဆီလွှာဆိုတာ ဘာလဲ။',
                          secondText:
                              '၁.၁.၂။  မြေဆီလွှာကို ဖြစ်ပေါ်စေတဲ့ အကြောင်းအရာများ \nသို့သွားမည်',
                          nextOnTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChapterPage(
                                  step: 2,
                                  title: subjects[0][0][2],
                                  nextTitle: subjects[0][0][3],
                                  moduleIndex: 0,
                                  chapterIndex: 0,
                                  pageIndex: 2,
                                  force: false,
                                  fromModule: false,
                                ),
                              ),
                            );
                          },
                          homeOnTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                     FarmerMapScreen(fromModule: false,)),
                            );
                          }));

                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const QuizzPage3(),
                  //     ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showSuccessAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          //title: const Text('Cancel booking'),
          contentPadding: EdgeInsets.zero,
          content: Container(
              height: MediaQuery.of(context).size.height * 0.73,
              color: Colors.green,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: ButtonImage(
                        width: 50,
                        height: 50,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        buttonText: '',
                        buttonImage: 'assets/images/close.png'),
                  ),
                  Image.asset(
                    "assets/images/check_green.png",
                    width: 110,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'သင့်အဖြေ မှန်ပါတယ် ',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              )),
        );
      },
    );
  }

  Future<void> _showFailAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          //title: const Text('Cancel booking'),
          contentPadding: EdgeInsets.zero,
          content: Container(
              height: MediaQuery.of(context).size.height * 0.73,
              color: Colors.red,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: ButtonImage(
                        width: 50,
                        height: 50,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        buttonText: '',
                        buttonImage: 'assets/images/close.png'),
                  ),
                  Image.asset(
                    "assets/images/close.png",
                    width: 90,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'သင့်အဖြေ မှားနေပါတယ် ',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              )),
        );
      },
    );
  }
}
