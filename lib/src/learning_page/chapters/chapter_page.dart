import 'dart:convert';
import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learning/data/data/chap_string.dart';
import 'package:learning/data/data/module3_string.dart';
import 'package:learning/data/data/module5_string.dart';
import 'package:learning/src/audio_controller/audio_controller.dart';

import 'package:just_audio/just_audio.dart' as justAudio;
import 'package:learning/src/interactive/congratulation_dialog.dart';
import 'package:learning/src/interactive/soil_column_page.dart';
import 'package:learning/src/learning_page/chapters/jsonparser.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_header.dart';
import 'package:learning/src/learning_page/learning_page_styles/learning_page_1_landscape.dart';
import 'package:learning/src/learning_page/learning_page_styles/learning_page_2_portrait.dart';
import 'package:learning/src/learning_page/learning_page_styles/learning_page_3_video.dart';
import 'package:learning/src/learning_page/learning_page_styles/learning_page_4_text_only.dart';
import 'package:learning/src/learning_page/learning_page_styles/learning_page_5_image_only.dart';
import 'package:learning/src/learning_page/module_entry.dart';
import 'package:learning/src/main_map/presentation/farmer_map.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class ChapterPage extends StatefulWidget {
  int step;

  String title;
  String nextTitle;
  int moduleIndex;
  int chapterIndex;
  int pageIndex;
  bool force;
  bool fromModule;

  ChapterPage(
      {Key? key,
      required this.step,
      required this.title,
      required this.nextTitle,
      required this.moduleIndex,
      required this.chapterIndex,
      required this.pageIndex,
      required this.force,
      required this.fromModule})
      : super(key: key);

  @override
  State<ChapterPage> createState() => _ChapterPage_State();
}

class _ChapterPage_State extends State<ChapterPage> {
  bool textpopUpVisible = false;
  bool imagepopUpVisible = false;
  bool startPlay = false;
  late Stream<DurationState> _durationState;
  final player = justAudio.AudioPlayer();
  String? dirPath;
  String? dirPath3;
  String? dirPath5;
  ScrollController scrollController = ScrollController();

  List<List<List<int>>> pages = [
    [
      [3, 2, 6, 1],
      [3, 2, 4, 2],
      [5, 5, 5],
      [4, 2, 9],
      [2, 6],
      [3, 3]
    ],
    [],
    [
      [5, 2, 6, 1],
      [3, 4, 4, 2],
      [5, 5],
      [4, 2],
      [5],
      [4, 11],
      [7, 4, 2],
      [1, 1, 1, 1, 4],
    ],
    [],
    [
      [1, 2, 1],
      [1, 3],
      [1, 2],
      [1],
      [3, 4],
      [0, 0, 1],
      [2, 1, 11],
      [1, 2]
    ],
  ];
  final videoPlayerController = VideoPlayerController.asset('assets/soil.mp4');
  ChewieController? chewieController;

  String? scoreString;
  List<List<List<double>>> scores = [
    [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0],
      [0, 0, 0],
      [0, 0],
      [0, 0]
    ],
    [],
    [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0],
      [0, 0],
      [0],
      [0, 0],
      // [0, 0, 0],
      // [0, 0, 0, 0, 0]
    ],
    [],
    [
      [0, 0, 0],
      [0, 0],
      [0, 0],
      [0],
      [0, 0],
      [0, 0, 0],
      [0, 0, 0],
      [0, 0],
    ],
  ];

  String learning4txt =
      "မြေကြီးရဲ့ အခြား ရုပ်ဂုဏ်သတ္တိတွေကတော့ - \n(၁) အလေးချိန်နဲ့ သိပ်သည်းဆ  \n(၂) မြေကြီးတွင် နေရာလပ်များ/ လေရှူပေါက်များ ပါဝင်မှု \n(၃) မြေကြီးရဲ့ စိမ့်ဝင်နိုင်မှု \n(၄) မြေကြီးရဲ့ အပူချိန်နဲ့ \n(၅) မြေကြီးရဲ့ ပုံစံပြောင်းနိုင်မှု၊ အဖိအသိပ်ခံနိုင်မှုနဲ့ တိုက်စားခံနိုင်မှု တို့ဖြစ်ပါတယ်။";

  String textList =
      "မြေဆီလွှာကို ဖြစ်ပေါ်စေတဲ့ အကြောင်းအရင်း (၅)ခုမှာ - \n(က)  ရာသီဥတု၊\n(ခ)   သက်ရှိအကြောင်းအရာများ၊\n(ဂ)   မြေမျက်နှာသွင်ပြင်၊ \n(ဃ)  မိခင်အစိုင်အခဲ၊ \n(င)    အချိန်။";

  @override
  void initState() {
    log("Module ${widget.moduleIndex}");
    log("Chapter ${widget.chapterIndex}");
    log("Page ${widget.pageIndex}");
    log("Step ${widget.step}");
    initial();
    super.initState();
    _durationState = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
        player.positionStream,
        player.playbackEventStream,
        (position, playbackEvent) => DurationState(
              progress: position,
              buffered: playbackEvent.bufferedPosition,
              total: playbackEvent.duration,
            ));
    start();
  }

  void start() async {
    await videoPlayerController.initialize();
    setState(() {
      chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          aspectRatio: videoPlayerController.value.aspectRatio,
          autoPlay: false,
          looping: false,
          allowFullScreen: true,
          deviceOrientationsAfterFullScreen: [
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
    });
  }

  initial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      dirPath = prefs.getString('module1');
      dirPath3 = prefs.getString('module3');
      dirPath5 = prefs.getString('module5');
      //prefs.remove("userscore");
      if (prefs.getString("userscore") != null) {
        scoreString = prefs.getString("userscore") ?? "";
        setState(() {
          scores = JsonArrayConversion.convertJson3(
              jsonDecode(scoreString!).cast<dynamic>());
        });

        // log("Saved Module Score $scores");
      } else {
        //log("Old Module Score $scores");
      }
    });

    // retrieve jsonColors to List<List<List<int>>> colors
  }

  @override
  void dispose() {
    player.dispose();
    chewieController!.pause();
    videoPlayerController.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);

    return WillPopScope(
      onWillPop: onWillPop,
      child: MediaQuery(
        data: mqDataNew,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 225, 255, 147),
          body: Stack(
            children: [
              BackgroundPage(
                backImage: "assets/images/agre_back.jpg",
              ),
              SessionHeader(
                title: widget.title,
                percent: calculatePercent(),
                backButton: () {
                  onWillPop();
                },
              ),
              Visibility(
                visible: widget.step !=
                    (pages[widget.moduleIndex][widget.chapterIndex]
                            [widget.pageIndex] +
                        1),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.only(bottom: 8, right: 8),
                    child: GestureDetector(
                      child: Image.asset(
                        "assets/images/arrow_right.png",
                        width: 20,
                      ),
                      onTap: () {
                        player.stop();
                        chewieController!.pause();
                        videoPlayerController.pause();
                        log('pause here');
                        if (widget.step ==
                            pages[widget.moduleIndex][widget.chapterIndex]
                                [widget.pageIndex]) {
                          log("First - End of Page");
                          log("First - End of Title - ${widget.title}");
                          log("First - End of Next Title - ${widget.nextTitle}");
                          if (widget.title == widget.nextTitle) {
                            log("Log Chapter End");
                            showDialog(
                                context: context,
                                builder: (context) => CongrulationEndDialog(
                                    firstText: widget.title,
                                    homeOnTap: () {
                                      player.stop();
                                      if (widget.fromModule) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ModuleEntryScreen(
                                                      moduleNumber: 1,
                                                      scores: scores,
                                                    )));
                                      } else {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FarmerMapScreen(
                                                    fromModule:
                                                        widget.fromModule,
                                                  )),
                                        );
                                      }
                                    }));
                          } else {
                            String nextTitle = "";
                            log("Log Course End");
                            if (widget.moduleIndex == 0 &&
                                widget.chapterIndex == 2 &&
                                widget.chapterIndex == 0) {
                              nextTitle =
                                  "၁.၃.၂။ မြေဆီလွှာရဲ့ ဓာတ်ပြုမှုများ (pH)";
                            } else if (widget.moduleIndex == 0 &&
                                widget.chapterIndex == 2 &&
                                widget.chapterIndex == 1) {
                              nextTitle =
                                  "၁.၃.၃။ အပင်အာဟာရဓာတ်တွေအတွက် မြေဆီလွှာရှိ အော်ဂဲနစ်မဟုတ်တဲ့ ပစ္စည်းများ";
                            }
                            showDialog(
                                context: context,
                                builder: (context) => CongrulationDialog(
                                    firstText: widget.title,
                                    secondText: widget.nextTitle,
                                    nextOnTap: () {
                                      player.stop();
                                      chewieController!.pause();
                                      videoPlayerController.pause();
                                      if (subjects[widget.moduleIndex].length ==
                                          widget.chapterIndex + 1) {
                                        nextTitle = "end";
                                        log("Added next");
                                      } else {
                                        nextTitle = subjects[widget.moduleIndex]
                                                [widget.chapterIndex]
                                            [widget.pageIndex + 1];
                                      }

                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (context) => ChapterPage(
                                              step: 1,
                                              title: widget.nextTitle,
                                              nextTitle: nextTitle,
                                              moduleIndex: widget.moduleIndex,
                                              chapterIndex: widget.chapterIndex,
                                              pageIndex: widget.pageIndex + 1,
                                              force: true,
                                              fromModule: widget.fromModule,
                                            ),
                                          ),
                                          (Route<dynamic> route) => false);
                                    },
                                    homeOnTap: () {
                                      player.stop();
                                      if (widget.fromModule) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ModuleEntryScreen(
                                                      moduleNumber: 1,
                                                      scores: scores,
                                                    )));
                                      } else {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FarmerMapScreen(
                                                    fromModule:
                                                        widget.fromModule,
                                                  )),
                                        );
                                      }
                                    }));
                          }
                        } else {
                          String nextTitle = "";
                          if ((subjects[widget.moduleIndex][widget.chapterIndex]
                                      .length) ==
                                  (widget.chapterIndex + 1) &&
                              (widget.moduleIndex != 0 &&
                                  widget.chapterIndex != 2 &&
                                  widget.pageIndex != 0) &&
                              (widget.moduleIndex != 0 &&
                                  widget.chapterIndex != 2 &&
                                  widget.pageIndex != 1)) {
                            nextTitle = "end";
                          } else {
                            var check = subjects[widget.moduleIndex]
                                    [widget.chapterIndex]
                                .length;
                            var check2 = widget.pageIndex + 1;
                            log("next double check");
                            if (check == check2) {
                              nextTitle = "end";
                            } else {
                              nextTitle = subjects[widget.moduleIndex]
                                  [widget.chapterIndex][widget.pageIndex + 1];
                            }
                          }
                          player.stop();
                          chewieController!.pause();
                          videoPlayerController.pause();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterPage(
                                chapterIndex: widget.chapterIndex,
                                moduleIndex: widget.moduleIndex,
                                pageIndex: widget.pageIndex,
                                title: widget.title,
                                nextTitle: nextTitle,
                                step: widget.step + 1,
                                force: false,
                                fromModule: widget.fromModule,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: widget.step != 1,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.only(bottom: 8, right: 8),
                    child: GestureDetector(
                      child: Image.asset(
                        "assets/images/arrow_left.png",
                        width: 20,
                      ),
                      onTap: () async {
                        await player.stop();
                        chewieController!.pause();
                        videoPlayerController.pause();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChapterPage(
                              chapterIndex: widget.chapterIndex,
                              moduleIndex: widget.moduleIndex,
                              pageIndex: widget.pageIndex,
                              title: widget.title,
                              nextTitle: widget.nextTitle,
                              step: widget.step - 1,
                              force: false,
                              fromModule: widget.fromModule,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              dirPath != null ? chapterByModule() : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    if (widget.force) {
      log(widget.force.toString());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FarmerMapScreen(
            fromModule: widget.fromModule,
          ),
        ),
      );
      return Future.value(false);
    } else {
      Navigator.pop(context);
      return Future.value(false);
    }
  }

  double calculatePercent() {
    // calculatePercent of Finished pages on Pages array with moduleIndex, chapterIndex, pageIndex
    int totalPage =
        pages[widget.moduleIndex][widget.chapterIndex][widget.pageIndex];
    int finishedPage = widget.step;
    double percent = (finishedPage / totalPage) * 100;
    saveScroe(percent / 100);
    return percent / 100 <= 1 ? (percent / 100) : 0;
  }

  saveScroe(double percent) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (scores[widget.moduleIndex][widget.chapterIndex][widget.pageIndex] <
        percent) {
      setState(() {
        scores[widget.moduleIndex][widget.chapterIndex][widget.pageIndex] =
            percent;
      });
      String saveScores = jsonEncode(scores);
      prefs.setString("userscore", saveScores);
      // log("Update Module Score $saveScores");
    }
  }

  Widget chapterByModule() {
    if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 0 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? chewieController != null
              ? LearningPage3Video(
                  chewieController: chewieController!,
                  videoPlayerController: videoPlayerController,
                  hearderTitle: 'widget.title',
                  videoUrl: 'assets/soil.mp4',
                )
              : Container()
          : widget.step == 2
              ? LearningPage4TextOnly(
                  player: player,
                  backButton: () {},
                  voiceUrl: '${dirPath!}/A1S1.1.1.2.mp3',
                  popUpText:
                      'မြေကြီးကို ရုပ်ဂုဏ်သတ္တိ၊ ဓာတ်ဂုဏ်သတ္တိနဲ့ ဇီဝဆိုင်ရာဂုဏ်သတ္တိဆိုပြီး ခွဲခြားသတ်မှတ်နိုင်ပါတယ်။ ',
                  imageChoose: "${dirPath!}/A1P1.1.1.2.png",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '${dirPath!}/A1S1.1.1.3.mp3',
                      popUpText: learningTxt[0],
                      imageChoose: "${dirPath!}/A1P1.1.1.2.png",
                    )
                  : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 0 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${dirPath!}/A1S1.1.2.1.mp3',
              popUpText: learningTxt[1],
              imageChoose: "${dirPath!}/A1P1.1.2.1.png",
            )
          : widget.step == 2
              ? SoilColumnPage(
                  hearderTitle:
                      "၁.၁.၂။  မြေဆီလွှာကို ဖြစ်ပေါ်စေတဲ့ အကြောင်းအရာများ",
                  arrowLeftOnTap: () {},
                  arrowRightOnTap: () {},
                  titleOne: 'ရာသီဥတု',
                  titleTwo: 'သက်ရှိအကြောင်းအရာများ',
                  titleThree: 'မြေမျက်နှာသွင်ပြင်',
                  titleFour: 'မိခင်အစိုင်အခဲ။',
                  titleFive: 'အချိန်',
                  titleImageOne: 'assets/images/m1.png',
                  titleImageTwo: 'assets/images/m2.png',
                  titleImageThree: 'assets/images/m3.png',
                  titleImageFour: 'assets/images/m4.png',
                  titleImageFive: 'assets/images/m5.png',
                  imageOne: 'assets/images/s1.png',
                  textOne:
                      '(က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။ (က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။ (က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။',
                  imageTwo: 'assets/images/s2.png',
                  textTwo:
                      '(ခ) သက်ရှိအကြောင်းအရာများ။ အပင်များ၊ တိရစ္ဆာန်များ၊ မှိုများ၊ ဘက်တီးရီးယားများနှင့် အဏုဇီဝသက်ရှိများ ',
                  imageThree: 'assets/images/s3.png',
                  textThree:
                      '(ဂ) မြေမျက်နှာသွင်ပြင်။ တောင်စောင်းအနေအထား၊ ရှုထောင့်၊ ပုံသဏ္ဍာန်',
                  imageFour: 'assets/images/s4.png',
                  textFour:
                      '(ဃ) မိခင်အစိုင်အခဲ။ ကျောက်ဆောင်၊ နုန်းမြေ (alluvium) (လေ သို့မဟုတ် ရေ အနယ်ကျရာမှ ဖြစ်ပေါ်လာသော အရာ)',
                  imageFive: 'assets/images/s5.png',
                  textFive:
                      '(င) အချိန်။ မြေဆီလွှာစတင်ဖြစ်ပေါ်တဲ့ အချိန်ကစပြီး ကြာချိန်',
                  textList: '$dirPath',
                )
              : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 0 &&
        widget.pageIndex == 2) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '${dirPath!}/A1S1.1.3.1.mp3',
              popUpText: learningTxt[8],
              imageChoose: "${dirPath!}/A1P1.1.1.2.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${dirPath!}/A1S1.1.3.2.mp3',
                  popUpText: learningTxt[9],
                  imageChoose: "${dirPath!}/A1P1.1.1.2.png",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '${dirPath!}/A1S1.1.3.3.mp3',
                      popUpText: learningTxt[10],
                      imageChoose: "${dirPath!}/A1P1.1.3.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage2Portrait(
                          player: player,
                          voiceUrl: '${dirPath!}/A1S1.1.3.4.mp3',
                          popUpText: learningTxt[11],
                          imageChoose: "${dirPath!}/A1P1.1.1.2.png",
                        )
                      : widget.step == 5
                          ? LearningPage2Portrait(
                              player: player,
                              voiceUrl: '${dirPath!}/A1S1.1.3.5.mp3',
                              popUpText: learningTxt[12],
                              imageChoose: "${dirPath!}/A1P1.1.3.5.png",
                            )
                          : widget.step == 6
                              ? LearningPage2Portrait(
                                  player: player,
                                  voiceUrl: '${dirPath!}/A1S1.1.3.6.mp3',
                                  popUpText: learningTxt[13],
                                  imageChoose: "${dirPath!}/A1P1.1.3.6.png",
                                )
                              : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 0 &&
        widget.pageIndex == 3) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '${dirPath!}/A1S1.1.4.1.mp3',
              popUpText: learningTxt[14],
              imageChoose: "${dirPath!}/A1P1.1.4.1.png",
            )
          : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 1 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${dirPath!}/A1S1.2.1.1.mp3',
              popUpText: learningTxt[15],
              imageChoose: "${dirPath!}/A1P1.2.1.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '${dirPath!}/A1S1.2.1.2.mp3',
                  popUpText: learningTxt[16],
                  imageChoose: "${dirPath!}/A1P1.2.1.2.png",
                )
              : widget.step == 3
                  ? LearningPage4TextOnly(
                      player: player,
                      backButton: () {},
                      voiceUrl: '${dirPath!}/A1S1.2.1.3.mp3',
                      popUpText: learningTxt[17],
                      imageChoose: "${dirPath!}/A1P1.2.1.2.png",
                    )
                  : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 1 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${dirPath!}/A1S1.2.2.1.mp3',
              popUpText: learningTxt[18],
              imageChoose: "${dirPath!}/A1P1.2.2.1.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${dirPath!}/A1S1.2.2.2.mp3',
                  popUpText: learningTxt[19],
                  imageChoose: "${dirPath!}/A1P1.2.2.2.png",
                )
              : widget.step == 3
                  ? chewieController != null
                      ? LearningPage3Video(
                          chewieController: chewieController!,
                          videoPlayerController: videoPlayerController,
                          hearderTitle: subjects[0][0][0],
                          videoUrl:
                              'https://drive.google.com/file/d/1Iy8nOM1tZeL_sbVJaBmUE2ddBDv3P_jW/view?usp=sharing')
                      : Container()
                  : widget.step == 4
                      ? LearningPage5ImageOnly(
                          hearderTitle: 'hearderTitle',
                          imageChoose: "${dirPath!}/A1P1.2.2.4.png",
                          arrowRightOnTap: () {},
                          arrowLeftOnTap: () {},
                        )
                      : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 1 &&
        widget.pageIndex == 2) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '${dirPath!}/A1S1.2.3.1.mp3',
              popUpText: learningTxt[21],
              imageChoose: "${dirPath!}/A1P1.2.3.1.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${dirPath!}/A1S1.2.3.2.mp3',
                  popUpText: learningTxt[22],
                  imageChoose: "${dirPath!}/A1P1.2.3.1.png",
                )
              : widget.step == 3
                  ? LearningPage4TextOnly(
                      player: player,
                      popUpText: learningTxt[23],
                      imageChoose: "${dirPath!}/A1P1.2.3.1.png",
                      backButton: () {},
                      voiceUrl: '${dirPath!}/A1S1.2.3.3.mp3',
                    )
                  : widget.step == 4
                      ? LearningPage2Portrait(
                          player: player,
                          voiceUrl: '${dirPath!}/A1S1.2.3.4.mp3',
                          popUpText: learningTxt[24],
                          imageChoose: "${dirPath!}/A1P1.2.3.4.png",
                        )
                      : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 1 &&
        widget.pageIndex == 3) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${dirPath!}/A1S1.2.4.1.mp3',
              popUpText: learningTxt[25],
              imageChoose: "${dirPath!}/A1P1.2.4.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '${dirPath!}/A1S1.2.4.2.mp3',
                  popUpText: learningTxt[26],
                  imageChoose: "${dirPath!}/A1P1.2.4.1.png",
                )
              : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 2 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '${dirPath!}/A1S1.3.1.1.mp3',
              popUpText: learningTxt[27],
              imageChoose: "${dirPath!}/A1P1.3.1.1.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${dirPath!}/A1S1.3.1.2.mp3',
                  popUpText: learningTxt[28],
                  imageChoose: "${dirPath!}/A1P1.3.1.2.png",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '${dirPath!}/A1S1.3.1.3.mp3',
                      popUpText: learningTxt[29],
                      imageChoose: "${dirPath!}/A1P1.3.1.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage2Portrait(
                          player: player,
                          voiceUrl: '${dirPath!}/A1S1.3.1.4.mp3',
                          popUpText: learningTxt[30],
                          imageChoose: "${dirPath!}/A1P1.3.1.2.png",
                        )
                      : widget.step == 5
                          ? LearningPage4TextOnly(
                              player: player,
                              backButton: () {},
                              voiceUrl: '${dirPath!}/A1S1.3.1.5.mp3',
                              popUpText: learningTxt[31],
                              imageChoose: "${dirPath!}/A1P1.3.1.2.png",
                            )
                          : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 2 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${dirPath!}/A1S1.3.2.1.mp3',
              popUpText: learningTxt[32],
              imageChoose: "${dirPath!}/A1P1.3.2.1.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${dirPath!}/A1S1.3.2.2.mp3',
                  popUpText: learningTxt[33],
                  imageChoose: "${dirPath!}/A1P1.3.2.2.png",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '${dirPath!}/A1S1.3.2.4.mp3',
                      popUpText: learningTxt[34],
                      imageChoose: "${dirPath!}/A1P1.3.2.4.jpg",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '${dirPath!}/A1S1.3.2.5.mp3',
                          popUpText: learningTxt[35],
                          imageChoose: "${dirPath!}/A1P1.3.2.5.png",
                        )
                      : widget.step == 5
                          ? LearningPage1Landscape(
                              player: player,
                              voiceUrl: '${dirPath!}/A1S1.3.2.6.mp3',
                              popUpText: learningTxt[36],
                              imageChoose: "${dirPath!}/A1P1.3.2.1.png",
                            )
                          : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 2 &&
        widget.pageIndex == 2) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${dirPath!}/A1S1.3.3.1.mp3',
              popUpText: learningTxt[37],
              imageChoose: "${dirPath!}/A1P1.3.3.1.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${dirPath!}/A1S1.3.3.2.mp3',
                  popUpText: learningTxt[38],
                  imageChoose: "${dirPath!}/A1P1.3.1.3.png",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '${dirPath!}/A1S1.3.3.3.mp3',
                      popUpText: learningTxt[39],
                      imageChoose: "${dirPath!}/A1P1.3.3.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '${dirPath!}/A1S1.3.3.8.mp3',
                          popUpText: learningTxt[40],
                          imageChoose: "${dirPath!}/A1P1.3.3.4.jpg",
                        )
                      : widget.step == 5
                          ? LearningPage4TextOnly(
                              player: player,
                              backButton: () {},
                              voiceUrl: '${dirPath!}/A1S1.3.2.5.mp3',
                              popUpText: learningTxt[41],
                              imageChoose: "${dirPath!}/A1P1.3.2.1.png",
                            )
                          : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 3 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${dirPath!}/A1S1.4.1.1.mp3',
              popUpText: learningTxt[42],
              imageChoose: "${dirPath!}/A1P1.4.1.1.jpg",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '${dirPath!}/A1S1.4.1.2.mp3',
                  popUpText: learningTxt[43],
                  imageChoose: "${dirPath!}/A1P1.4.1.2.png",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '${dirPath!}/A1S1.4.1.3.mp3',
                      popUpText: learningTxt[44],
                      imageChoose: "${dirPath!}/A1P1.4.1.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '${dirPath!}/A1S1.4.1.4.mp3',
                          popUpText: learningTxt[45],
                          imageChoose: "${dirPath!}/A1P1.4.1.4.png",
                        )
                      : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 3 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${dirPath!}/A1S1.4.2.1.mp3',
              popUpText: learningTxt[46],
              imageChoose: "${dirPath!}/A1P1.4.2.1.jpg",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '${dirPath!}/A1S1.4.2.2.mp3',
                  popUpText: learningTxt[47],
                  imageChoose: "${dirPath!}/A1P1.4.2.2.png",
                )
              : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 3 &&
        widget.pageIndex == 2) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${dirPath!}/A1S1.4.3.1.mp3',
              popUpText: learningTxt[48],
              imageChoose: "${dirPath!}/A1P1.4.3.1.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${dirPath!}/A1S1.4.3.2.mp3',
                  popUpText: learningTxt[49],
                  imageChoose: "${dirPath!}/A1P1.4.3.2.png",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '${dirPath!}/A1S1.4.3.3.mp3',
                      popUpText: learningTxt[50],
                      imageChoose: "${dirPath!}/A1P1.4.3.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage2Portrait(
                          player: player,
                          voiceUrl: '${dirPath!}/A1S1.4.3.4.mp3',
                          popUpText: learningTxt[51],
                          imageChoose: "${dirPath!}/A1P1.4.3.4.png",
                        )
                      : widget.step == 5
                          ? LearningPage2Portrait(
                              player: player,
                              voiceUrl: '${dirPath!}/A1S1.4.3.5.mp3',
                              popUpText: learningTxt[52],
                              imageChoose: "${dirPath!}/A1P1.4.3.5.png",
                            )
                          : widget.step == 6
                              ? LearningPage1Landscape(
                                  player: player,
                                  voiceUrl: '${dirPath!}/A1S1.4.3.6.mp3',
                                  popUpText: learningTxt[53],
                                  imageChoose: "${dirPath!}/A1P1.4.3.1.png",
                                )
                              : widget.step == 7
                                  ? LearningPage1Landscape(
                                      player: player,
                                      voiceUrl: '${dirPath!}/A1S1.4.3.7.mp3',
                                      popUpText: learningTxt[54],
                                      imageChoose: "${dirPath!}/A1P1.4.3.7.png",
                                    )
                                  : widget.step == 8
                                      ? LearningPage1Landscape(
                                          player: player,
                                          voiceUrl:
                                              '${dirPath!}/A1S1.4.3.8.mp3',
                                          popUpText: learningTxt[55],
                                          imageChoose:
                                              "${dirPath!}/A1P1.4.3.8.png",
                                        )
                                      : widget.step == 9
                                          ? LearningPage2Portrait(
                                              player: player,
                                              voiceUrl:
                                                  '${dirPath!}/A1S1.4.3.9.mp3',
                                              popUpText: learningTxt[56],
                                              imageChoose:
                                                  "${dirPath!}/A1P1.4.3.9.png",
                                            )
                                          : widget.step == 10
                                              ? LearningPage2Portrait(
                                                  player: player,
                                                  voiceUrl:
                                                      '${dirPath!}/A1S1.4.3.10.mp3',
                                                  popUpText: learningTxt[57],
                                                  imageChoose:
                                                      "${dirPath!}/A1P1.4.3.9.png",
                                                )
                                              : widget.step == 11
                                                  ? LearningPage2Portrait(
                                                      player: player,
                                                      voiceUrl:
                                                          '${dirPath!}/A1S1.4.3.11.mp3',
                                                      popUpText:
                                                          learningTxt[58],
                                                      imageChoose:
                                                          "${dirPath!}/A1P1.4.3.11.png",
                                                    )
                                                  : widget.step == 12
                                                      ? LearningPage2Portrait(
                                                          player: player,
                                                          voiceUrl:
                                                              '${dirPath!}/A1S1.4.3.12.mp3',
                                                          popUpText:
                                                              learningTxt[59],
                                                          imageChoose:
                                                              "${dirPath!}/A1P1.4.3.12.png",
                                                        )
                                                      : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 4 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${dirPath!}/A1S1.5.1.1.mp3',
              popUpText: learningTxt[60],
              imageChoose: "${dirPath!}/A1P1.5.1.1.jpg",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${dirPath!}/A1S1.5.1.2.mp3',
                  popUpText: learningTxt[61],
                  imageChoose: "${dirPath!}/A1P1.1.3.6.png",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '${dirPath!}/A1S1.5.1.3.mp3',
                      popUpText: learningTxt[62],
                      imageChoose: "${dirPath!}/A1P1.5.1.3.png",
                    )
                  : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 4 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '${dirPath!}/A1S1.5.2.1.mp3',
              popUpText: learningTxt[63],
              imageChoose: "${dirPath!}/A1P1.4.3.9.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${dirPath!}/A1S1.5.2.2.mp3',
                  popUpText: learningTxt[64],
                  imageChoose: "${dirPath!}/A1P1.5.2.2.png",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '${dirPath!}/A1S1.5.2.3.mp3',
                      popUpText: learningTxt[65],
                      imageChoose: "${dirPath!}/A1P1.5.2.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage2Portrait(
                          player: player,
                          voiceUrl: '${dirPath!}/A1S1.5.2.4.mp3',
                          popUpText: learningTxt[66],
                          imageChoose: "${dirPath!}/A1P1.5.2.4.png",
                        )
                      : widget.step == 5
                          ? LearningPage2Portrait(
                              player: player,
                              voiceUrl: '${dirPath!}/A1S1.5.2.5.mp3',
                              popUpText: learningTxt[67],
                              imageChoose: "${dirPath!}/A1P1.5.2.5.png",
                            )
                          : widget.step == 6
                              ? LearningPage2Portrait(
                                  player: player,
                                  voiceUrl: '${dirPath!}/A1S1.5.2.6.mp3',
                                  popUpText: learningTxt[68],
                                  imageChoose: "${dirPath!}/A1P1.5.2.6.png",
                                )
                              : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 5 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '${dirPath!}/A1S1.6.1.1.mp3',
              popUpText: learningTxt[69],
              imageChoose: "${dirPath!}/A1P1.6.1.1.png",
            )
          : widget.step == 2
              ? LearningPage4TextOnly(
                  player: player,
                  backButton: () {},
                  voiceUrl: '${dirPath!}/A1S1.6.1.2.mp3',
                  popUpText: learningTxt[70],
                  imageChoose: "${dirPath!}/A1P1.6.1.2.png",
                )
              : widget.step == 3
                  ? LearningPage4TextOnly(
                      player: player,
                      backButton: () {},
                      voiceUrl: '${dirPath!}/A1S1.6.1.3.mp3',
                      popUpText: learningTxt[71],
                      imageChoose: "${dirPath!}/A1P1.5.2.3.png",
                    )
                  : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 5 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${dirPath!}/A1S1.6.2.1.mp3',
              popUpText: learningTxt[72],
              imageChoose: "${dirPath!}/A1P1.6.2.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '${dirPath!}/A1S1.6.2.2.mp3',
                  popUpText: learningTxt[73],
                  imageChoose: "${dirPath!}/A1P1.6.2.2.png",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '${dirPath!}/A1S1.6.2.3.mp3',
                      popUpText: learningTxt[74],
                      imageChoose: "${dirPath!}/A1P1.4.3.9.png",
                    )
                  : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 0 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath3/A3S3.1.1.1.mp3',
              popUpText: module3TextList[0],
              imageChoose: "$dirPath3/A3P3.1.1.1.jpg",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '$dirPath3/A3S3.1.1.2.mp3',
                  popUpText: module3TextList[1],
                  imageChoose: "$dirPath3/A3P3.1.1.2.png",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '$dirPath3/A3S3.1.1.3.mp3',
                      popUpText: module3TextList[2],
                      imageChoose: "$dirPath3/A3P3.1.1.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '$dirPath3/A3S3.1.1.4.mp3',
                          popUpText: module3TextList[3],
                          imageChoose: "$dirPath3/A3P3.1.1.4.png",
                        )
                      : widget.step == 5
                          ? LearningPage4TextOnly(
                              player: player,
                              backButton: () {},
                              voiceUrl: '$dirPath3/A3S3.1.1.5.mp3',
                              popUpText: module3TextList[4],
                              imageChoose: "$dirPath3/A3P3.1.1.5.png",
                            )
                          : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 0 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '$dirPath3/A3S3.1.2.1.mp3',
              popUpText: module3TextList[5],
              imageChoose: "$dirPath3/A3P3.1.2.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '$dirPath3/A3S3.1.2.2.mp3',
                  popUpText: module3TextList[6],
                  imageChoose: "$dirPath3/A3P3.1.2.2.png",
                )
              : widget.step == 3
                  ? LearningPage5ImageOnly(
                      hearderTitle: '',
                      arrowLeftOnTap: () {},
                      arrowRightOnTap: () {},
                      imageChoose: "$dirPath3/A3P3.1.2.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage5ImageOnly(
                          hearderTitle: '',
                          arrowLeftOnTap: () {},
                          arrowRightOnTap: () {},
                          imageChoose: "$dirPath3/A3P3.1.2.4.png",
                        )
                      : widget.step == 5
                          ? LearningPage2Portrait(
                              player: player,
                              voiceUrl: '$dirPath3/A3S3.1.2.5.mp3',
                              popUpText: module3TextList[9],
                              imageChoose: "$dirPath3/A3P3.1.2.5.png",
                            )
                          : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 1 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath3/A3S3.2.1.1.mp3',
              popUpText: module3TextList[10],
              imageChoose: "$dirPath3/A3P3.2.1.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '$dirPath3/A3S3.2.1.2.mp3',
                  popUpText: module3TextList[11],
                  imageChoose: "$dirPath3/A3P3.2.1.2.png",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '$dirPath3/A3S3.2.1.3.mp3',
                      popUpText: module3TextList[12],
                      imageChoose: "$dirPath3/A3P3.2.1.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '$dirPath3/A3S3.2.1.4.mp3',
                          popUpText: module3TextList[13],
                          imageChoose: "$dirPath3/A3P3.2.1.4.png",
                        )
                      : widget.step == 5
                          ? LearningPage1Landscape(
                              player: player,
                              voiceUrl: '$dirPath3/A3S3.2.1.5.mp3',
                              popUpText: module3TextList[14],
                              imageChoose: "$dirPath3/A3P3.1.2.5.png",
                            )
                          : widget.step == 6
                              ? LearningPage4TextOnly(
                                  player: player,
                                  backButton: () {},
                                  voiceUrl: '$dirPath3/A3S3.2.1.6.mp3',
                                  popUpText: module3TextList[15],
                                  imageChoose: "",
                                )
                              : widget.step == 7
                                  ? LearningPage1Landscape(
                                      player: player,
                                      voiceUrl: '$dirPath3/A3S3.2.1.7.mp3',
                                      popUpText: module3TextList[16],
                                      imageChoose: "$dirPath3/A3P3.1.2.7.png",
                                    )
                                  : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 1 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath3/A3S3.2.2.1.mp3',
              popUpText: module3TextList[17],
              imageChoose: "$dirPath3/A3P3.2.2.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '$dirPath3/A3S3.2.2.2.mp3',
                  popUpText: module3TextList[18],
                  imageChoose: "$dirPath3/A3P3.2.2.2.png",
                )
              : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 2 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath3/A3S3.3.1.1.mp3',
              popUpText: module3TextList[19],
              //imageChoose: "$dirPath3/A3P3.3.1.1.GIF",
              imageChoose: "$dirPath3/A3P3.4.2.1(GIF).gif",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '$dirPath3/A3S3.3.1.2.mp3',
                  popUpText: module3TextList[20],
                  imageChoose: "$dirPath3/A3P3.3.1.2.GIF",
                )
              : widget.step == 3
                  ? LearningPage4TextOnly(
                      player: player,
                      backButton: () {},
                      voiceUrl: '$dirPath3/A3S3.3.1.3.mp3',
                      popUpText: module3TextList[21],
                      imageChoose: "$dirPath3/A3P3.3.1.3.GIF",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '$dirPath3/A3S3.3.1.4.mp3',
                          popUpText: module3TextList[22],
                          imageChoose: "$dirPath3/A3P3.3.1.4.png",
                        )
                      : widget.step == 5
                          ? LearningPage2Portrait(
                              player: player,
                              voiceUrl: '$dirPath3/A3S3.3.1.5.mp3',
                              popUpText: module3TextList[23],
                              imageChoose: "$dirPath3/A3P3.3.1.5.png",
                            )
                          : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 3 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath3/A3S3.4.1.1.mp3',
              popUpText: module3TextList[24],
              imageChoose: "$dirPath3/A3P3.4.1.1.GIF",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '$dirPath3/A3S3.4.1.2.mp3',
                  popUpText: module3TextList[25],
                  imageChoose: "$dirPath3/A3P3.4.1.2.GIF",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '$dirPath3/A3S3.4.1.3.mp3',
                      popUpText: module3TextList[26],
                      imageChoose: "$dirPath3/A3P3.4.1.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '$dirPath3/A3S3.4.1.4.mp3',
                          popUpText: module3TextList[27],
                          imageChoose: "$dirPath3/A3P3.4.1.4.png",
                        )
                      : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 3 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath3/A3S3.4.2.1.mp3',
              popUpText: module3TextList[28],
              imageChoose: "$dirPath3/A3P3.4.2.1.GIF",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '$dirPath3/A3S3.4.1.1.mp3',
                  popUpText: module3TextList[29],
                  imageChoose: "$dirPath3/A3P3.4.2.3.GIF",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '$dirPath3/A1S1.1.3.2.mp3',
                      popUpText: module3TextList[30],
                      imageChoose: "$dirPath3/A3P3.4.2.5.png",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '$dirPath3/A1S1.1.3.2.mp3',
                          popUpText: module3TextList[31],
                          imageChoose: "$dirPath3/A3P3.4.2.6.GIF",
                        )
                      : widget.step == 5
                          ? LearningPage1Landscape(
                              player: player,
                              voiceUrl: '$dirPath3/A1S1.1.3.2.mp3',
                              popUpText: module3TextList[32],
                              imageChoose: "$dirPath3/A3P3.4.2.6.GIF",
                            )
                          : widget.step == 6
                              ? LearningPage1Landscape(
                                  player: player,
                                  voiceUrl: '$dirPath3/A1S1.1.3.2.mp3',
                                  popUpText: module3TextList[33],
                                  imageChoose: "$dirPath3/A3P3.4.2.9.png",
                                )
                              : widget.step == 7
                                  ? LearningPage1Landscape(
                                      player: player,
                                      voiceUrl: '$dirPath3/A1S1.1.3.2.mp3',
                                      popUpText: module3TextList[34],
                                      imageChoose: "$dirPath3/A3P3.4.2.10.png",
                                    )
                                  : widget.step == 8
                                      ? LearningPage1Landscape(
                                          player: player,
                                          voiceUrl: '$dirPath3/A3S3.4.2.3.mp3',
                                          popUpText: module3TextList[35],
                                          imageChoose:
                                              "$dirPath3/A3P3.4.2.11.png",
                                        )
                                      : widget.step == 9
                                          ? LearningPage4TextOnly(
                                              player: player,
                                              backButton: () {},
                                              voiceUrl:
                                                  '$dirPath3/A3S3.4.2.4.mp3',
                                              popUpText: module3TextList[36],
                                              imageChoose: "",
                                            )
                                          : widget.step == 10
                                              ? LearningPage1Landscape(
                                                  player: player,
                                                  voiceUrl:
                                                      '$dirPath3/A3S3.4.2.5.mp3',
                                                  popUpText:
                                                      module3TextList[37],
                                                  imageChoose:
                                                      "$dirPath3/A3P3.4.2.13.png",
                                                )
                                              : widget.step == 11
                                                  ? LearningPage1Landscape(
                                                      player: player,
                                                      voiceUrl:
                                                          '$dirPath3/A3S3.4.2.6.mp3',
                                                      popUpText:
                                                          module3TextList[38],
                                                      imageChoose:
                                                          "$dirPath3/A3P3.4.2.14.png",
                                                    )
                                                  ///////////          i think miss  widget.step                               ///
                                                  : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 4 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage4TextOnly(
              player: player,
              backButton: () {},
              voiceUrl: '$dirPath3/A3S3.5.1.2.mp3',
              popUpText: module3TextList[39],
              imageChoose: "$dirPath3/A3P3.4.2.1.GIF",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '$dirPath3/A3S3.5.1.3.mp3',
                  popUpText: module3TextList[40],
                  imageChoose: "$dirPath3/A3P3.5.1.3.png",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '$dirPath3/A3S3.5.1.4.mp3',
                      popUpText: module3TextList[41],
                      imageChoose: "$dirPath3/A3P3.5.1.4.png",
                    )
                  : widget.step == 4
                      ? LearningPage4TextOnly(
                          player: player,
                          backButton: () {},
                          voiceUrl: '$dirPath3/A3S3.5.1.5.mp3',
                          popUpText: module3TextList[42],
                          imageChoose: "$dirPath3/A3P3.5.1.3.GIF",
                        )
                      : widget.step == 5
                          ? LearningPage2Portrait(
                              player: player,
                              voiceUrl: '$dirPath3/A3S3.5.1.6.mp3',
                              popUpText: module3TextList[43],
                              imageChoose: "$dirPath3/A3P3.5.1.6.png",
                            )
                          : widget.step == 6
                              ? LearningPage1Landscape(
                                  player: player,
                                  voiceUrl: '$dirPath3/A3S3.5.1.7.mp3',
                                  popUpText: module3TextList[44],
                                  imageChoose: "$dirPath3/A3P3.5.1.7.png",
                                )
                              : widget.step == 7
                                  ? LearningPage2Portrait(
                                      player: player,
                                      voiceUrl: '$dirPath3/A3S3.5.1.9.mp3',
                                      popUpText: module3TextList[45],
                                      imageChoose: "$dirPath3/A3P3.5.1.9.png",
                                    )
                                  : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 4 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '$dirPath3/A3S3.5.2.1.mp3',
              popUpText: module3TextList[46],
              imageChoose: "$dirPath3/A3P3.5.2.1.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '$dirPath3/A3S3.5.2.2.mp3',
                  popUpText: module3TextList[47],
                  imageChoose: "$dirPath3/A3P3.5.2.2.png",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '$dirPath3/A3S3.5.2.3.mp3',
                      popUpText: module3TextList[48],
                      imageChoose: "$dirPath3/A3P3.5.2.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '$dirPath3/A3S3.5.2.4.mp3',
                          popUpText: module3TextList[49],
                          imageChoose: "$dirPath3/A3P3.5.2.4.png",
                        )
                      : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 4 &&
        widget.pageIndex == 2) {
      return widget.step == 1
          ? LearningPage4TextOnly(
              player: player,
              backButton: () {},
              voiceUrl: '$dirPath3/A3S3.5.3.1.mp3',
              popUpText: module3TextList[50],
              imageChoose: "$dirPath3/A3P3.5.2.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '$dirPath3/A3S3.5.3.3.mp3',
                  popUpText: module3TextList[51],
                  imageChoose: "$dirPath3/A3P3.5.3.3.png",
                )
              : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 5 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage4TextOnly(
              player: player,
              backButton: () {},
              voiceUrl: '$dirPath3/A3S3.6.1.1.mp3',
              popUpText: module3TextList[52],
              imageChoose: "$dirPath3/A3P3.5.2.1.png",
            )
          : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 5 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath3/A3S3.6.2.1.mp3',
              popUpText: module3TextList[53],
              imageChoose: "$dirPath3/A3P3.6.2.1.png",
            )
          : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 5 &&
        widget.pageIndex == 2) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '$dirPath3/A3S3.6.3.1.mp3',
              popUpText: module3TextList[54],
              imageChoose: "$dirPath3/A3P3.6.3.1.png",
            )
          : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 5 &&
        widget.pageIndex == 3) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '$dirPath3/A3S3.6.4.1.mp3',
              popUpText: module3TextList[55],
              imageChoose: "$dirPath3/A3P3.6.4.1.png",
            )
          : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 5 &&
        widget.pageIndex == 5) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath3/A3S3.6.6.1.mp3',
              popUpText: module3TextList[56],
              imageChoose: "$dirPath3/A3P3.6.6.1.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '$dirPath3/A3S3.6.6.2.mp3',
                  popUpText: module3TextList[57],
                  imageChoose: "$dirPath3/A3P3.6.6.2.png",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '$dirPath3/A3S3.6.6.3.mp3',
                      popUpText: module3TextList[58],
                      imageChoose: "$dirPath3/A3P3.6.6.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage2Portrait(
                          player: player,
                          voiceUrl: '$dirPath3/A3S3.6.6.4.mp3',
                          popUpText: module3TextList[59],
                          imageChoose: "$dirPath3/A3P3.6.6.4.png",
                        )
                      : Text(
                          "Wrong step + ${widget.step}",
                          style:
                              const TextStyle(fontSize: 24, color: Colors.red),
                        );
    } ///////////         module 5     //////////////
    if (widget.moduleIndex == 4 &&
        widget.chapterIndex == 0 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath5/A5S5.1.1.2.mp3',
              popUpText: module5TextList[0],
              imageChoose: "$dirPath5/A5P5.1.1.2.png",
            )
          : Container();
    } else if (widget.moduleIndex == 4 &&
        widget.chapterIndex == 0 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath5/A5S5.1.2.1.mp3',
              popUpText: module5TextList[1],
              imageChoose: "$dirPath5/A5P5.1.2.1.png",
            )
          : widget.step == 2
              ? LearningPage4TextOnly(
                  player: player,
                  backButton: () {},
                  voiceUrl: '$dirPath5/A5S5.1.2.2.mp3',
                  popUpText: module5TextList[2],
                  imageChoose: "$dirPath5/A5P5.1.2.1.png",
                )
              : Container();
    } else if (widget.moduleIndex == 4 &&
        widget.chapterIndex == 0 &&
        widget.pageIndex == 2) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath5/A5S5.1.3.1.mp3',
              popUpText: module5TextList[3],
              imageChoose: "$dirPath5/A5P5.1.3.1.png",
            )
          : Container();
    } else if (widget.moduleIndex == 4 &&
        widget.chapterIndex == 1 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath5/A5S5.2.1.1.mp3',
              popUpText: module5TextList[4],
              imageChoose: "$dirPath5/A5P5.2.1.1.png",
            )
          : Container();
    } else if (widget.moduleIndex == 4 &&
        widget.chapterIndex == 1 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath5/A5S5.2.2.1.mp3',
              popUpText: module5TextList[5],
              imageChoose: "$dirPath5/A5P5.2.2.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '$dirPath5/A5S5.2.2.2.mp3',
                  popUpText: module5TextList[6],
                  imageChoose: "$dirPath5/A5P5.2.2.2.png",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '$dirPath5/A5S5.2.2.4.mp3',
                      popUpText: module5TextList[7],
                      imageChoose: "$dirPath5/A5P5.2.2.4.png",
                    )
                  : Container();
    } else if (widget.moduleIndex == 4 &&
        widget.chapterIndex == 2 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage4TextOnly(
              player: player,
              backButton: () {},
              voiceUrl: '$dirPath5/A5S5.3.1.2.mp3',
              popUpText: module5TextList[8],
              imageChoose: "$dirPath5/A5P5.2.2.1.png",
            )
          : Container();
    } else if (widget.moduleIndex == 4 &&
        widget.chapterIndex == 2 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath5/A5S5.3.2.1.mp3',
              popUpText: module5TextList[9],
              imageChoose: "$dirPath5/A5P5.3.2.1.GIF",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '$dirPath5/A5S5.3.2.2.mp3',
                  popUpText: module5TextList[10],
                  imageChoose: "$dirPath5/A5P5.3.2.2.png",
                )
              : Container();
    } else if (widget.moduleIndex == 4 &&
        widget.chapterIndex == 3 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath5/A5S5.5.1.1.mp3',
              popUpText: module5TextList[9],
              imageChoose: "$dirPath5/A5P5.3.2.1.GIF",
            )
          : Container();
    } else if (widget.moduleIndex == 4 &&
        widget.chapterIndex == 4 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '$dirPath5/A5S5.5.1.1.mp3',
              popUpText: module5TextList[11],
              imageChoose: "$dirPath5/A5P5.5.1.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '$dirPath5/A5S5.5.1.2.mp3',
                  popUpText: module5TextList[12],
                  imageChoose: "$dirPath5/A5P5.5.1.2.png",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '$dirPath5/A5S5.5.1.3.mp3',
                      popUpText: module5TextList[13],
                      imageChoose: "$dirPath5/A5P5.5.1.3.GIF",
                    )
                  : Container();
    } else if (widget.moduleIndex == 4 &&
        widget.chapterIndex == 4 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '$dirPath5/A5S5.5.2.1.mp3',
              popUpText: module5TextList[14],
              imageChoose: "$dirPath5/A5P5.5.2.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '$dirPath5/A5S5.5.2.2.mp3',
                  popUpText: module5TextList[15],
                  imageChoose: "$dirPath5/A5P5.5.2.2.png",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '$dirPath5/A5S5.5.2.3.mp3',
                      popUpText: module5TextList[16],
                      imageChoose: "$dirPath5/A5P5.5.2.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage2Portrait(
                          player: player,
                          voiceUrl: '$dirPath5/A5S5.5.2.4.mp3',
                          popUpText: module5TextList[17],
                          imageChoose: "$dirPath5/A5P5.5.2.4.png",
                        )
                      : Container();
    } else if (widget.moduleIndex == 4 &&
        widget.chapterIndex == 5 &&
        widget.pageIndex == 2) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '$dirPath5/A5S5.6.3.1.mp3',
              popUpText: module5TextList[18],
              imageChoose: "$dirPath5/A5P5.6.3.1.png",
            )
          : Container();
    } else if (widget.moduleIndex == 4 &&
        widget.chapterIndex == 6 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage4TextOnly(
              player: player,
              backButton: () {},
              voiceUrl: '$dirPath5/A5S5.7.1.1.mp3',
              popUpText: module5TextList[19],
              imageChoose: "$dirPath5/A5P5.6.3.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '$dirPath5/A5S5.7.1.2.mp3',
                  popUpText: module5TextList[20],
                  imageChoose: "$dirPath5/A5P5.7.1.2.png",
                )
              : Container();
    } else if (widget.moduleIndex == 4 &&
        widget.chapterIndex == 6 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath5/A5S5.7.2.1.mp3',
              popUpText: module5TextList[21],
              imageChoose: "$dirPath5/A5P5.7.2.1.png",
            )
          : Container();
    } else if (widget.moduleIndex == 4 &&
        widget.chapterIndex == 6 &&
        widget.pageIndex == 2) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '$dirPath5/A5S5.7.3.1.mp3',
              popUpText: module5TextList[22],
              imageChoose: "$dirPath5/A5P5.7.3.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '$dirPath5/A5S5.7.3.2.mp3',
                  popUpText: module5TextList[23],
                  imageChoose: "$dirPath5/A5P5.7.3.2.png",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '$dirPath5/A5S5.7.3.5.mp3',
                      popUpText: module5TextList[24],
                      imageChoose: "$dirPath5/A5P5.7.3.5.png",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '$dirPath5/A5S5.7.3.7.mp3',
                          popUpText: module5TextList[25],
                          imageChoose: "$dirPath5/A5P5.7.3.7.png",
                        )
                      : widget.step == 5
                          ? LearningPage1Landscape(
                              player: player,
                              voiceUrl: '$dirPath5/A5S5.7.3.8.mp3',
                              popUpText: module5TextList[26],
                              imageChoose: "$dirPath5/A5P5.7.3.8.png",
                            )
                          : widget.step == 6
                              ? LearningPage2Portrait(
                                  player: player,
                                  voiceUrl: '$dirPath5/A5S5.7.3.11.mp3',
                                  popUpText: module5TextList[27],
                                  imageChoose: "$dirPath5/A5P5.7.3.11.png",
                                )
                              : widget.step == 7
                                  ? LearningPage2Portrait(
                                      player: player,
                                      voiceUrl: '$dirPath5/A5S5.7.3.12.mp3',
                                      popUpText: module5TextList[28],
                                      imageChoose: "$dirPath5/A5P5.7.3.12.png",
                                    )
                                  : widget.step == 8
                                      ? LearningPage2Portrait(
                                          player: player,
                                          voiceUrl: '$dirPath5/A5S5.7.3.13.mp3',
                                          popUpText: module5TextList[29],
                                          imageChoose:
                                              "$dirPath5/A5P5.7.3.13.png",
                                        )
                                      : widget.step == 9
                                          ? LearningPage2Portrait(
                                              player: player,
                                              voiceUrl:
                                                  '$dirPath5/A5S5.7.3.14.mp3',
                                              popUpText: module5TextList[30],
                                              imageChoose:
                                                  "$dirPath5/A5P5.7.3.14.png",
                                            )
                                          : widget.step == 10
                                              ? LearningPage4TextOnly(
                                                  player: player,
                                                  backButton: () {},
                                                  voiceUrl:
                                                      '$dirPath5/A5S5.7.3.15.mp3',
                                                  popUpText:
                                                      module5TextList[31],
                                                  imageChoose:
                                                      "$dirPath5/A5P5.7.3.14.png",
                                                )
                                              : widget.step == 11
                                                  ? LearningPage1Landscape(
                                                      player: player,
                                                      voiceUrl:
                                                          '$dirPath5/A5S5.7.3.16.mp3',
                                                      popUpText:
                                                          module5TextList[32],
                                                      imageChoose:
                                                          "$dirPath5/A5P5.7.3.16.png",
                                                    )
                                                  : Container();
    } else if (widget.moduleIndex == 4 &&
        widget.chapterIndex == 7 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath5/A5S5.8.1.1.mp3',
              popUpText: module5TextList[33],
              imageChoose: "$dirPath5/A5P5.7.3.13.png",
            )
          : Container();
    } else if (widget.moduleIndex == 4 &&
        widget.chapterIndex == 7 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '$dirPath5/A5S5.8.2.1.mp3',
              popUpText: module5TextList[34],
              imageChoose: "$dirPath5/A5P5.8.2.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '$dirPath5/A5S5.8.2.2.mp3',
                  popUpText: module5TextList[35],
                  imageChoose: "$dirPath5/A5P5.8.2.2.png",
                )
              : Text(
                  "Wrong step + ${widget.step}",
                  style: const TextStyle(fontSize: 24, color: Colors.red),
                );
    }
    /////////         end module 5 conditon
    else {
      return Text(
        "Wrong step + ${widget.step}",
        style: const TextStyle(fontSize: 24, color: Colors.red),
      );
    }
  }
}
