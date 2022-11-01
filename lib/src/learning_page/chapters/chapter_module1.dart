import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learning/data/data/chap_string.dart';
import 'package:learning/src/interactive/soil_page.dart';
import 'package:learning/src/learning_page/learning_page_styles/learning_page_1_landscape.dart';
import 'package:learning/src/learning_page/learning_page_styles/learning_page_2_portrait.dart';
import 'package:learning/src/learning_page/learning_page_styles/learning_page_3_video.dart';
import 'package:learning/src/learning_page/learning_page_styles/learning_page_4_text_only.dart';
import 'package:learning/src/learning_page/learning_page_styles/learning_page_5_image_only.dart';
import 'package:video_player/video_player.dart';

class ChapterModule1 extends StatefulWidget {
  const ChapterModule1(
      {super.key,
      required this.moduleIndex,
      required this.chapterIndex,
      required this.pageIndex,
      required this.step,
      required this.dirPath});
  final int moduleIndex;
  final int chapterIndex;
  final int pageIndex;
  final int step;
  final String dirPath;

  @override
  State<ChapterModule1> createState() => _ChapterModule1State();
}

class _ChapterModule1State extends State<ChapterModule1> {
  final AudioPlayer player = AudioPlayer();
  final videoPlayerController = VideoPlayerController.asset('assets/soil.mp4');
  late final ChewieController chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
  }

  @override
  Widget build(BuildContext context) {
    if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 0 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage3Video(
              chewieController: chewieController,
              videoPlayerController: videoPlayerController,
              hearderTitle: 'widget.title',
              videoUrl: 'assets/soil.mp4',
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.1.1.3.mp3',
                  popUpText: learningTxt[0],
                  imageChoose: "${widget.dirPath}/A1P1.1.1.2.png",
                )
              : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 0 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.1.2.1.mp3',
              popUpText: learningTxt[1],
              imageChoose: "${widget.dirPath}/A1P1.1.2.1.png",
            )
          : widget.step == 2
              ? SoilPageScreen(
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
                  textList: '',
                )
              : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 0 &&
        widget.pageIndex == 2) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
              popUpText: learningTxt[2],
              imageChoose: "${widget.dirPath}/A1P1.1.1.2.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                  popUpText: learningTxt[3],
                  imageChoose: "${widget.dirPath}/A1P1.1.1.2.png",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '${widget.dirPath}/A1S1.1.3.3.mp3',
                      popUpText: learningTxt[4],
                      imageChoose: "${widget.dirPath}/A1P1.1.3.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage2Portrait(
                          player: player,
                          voiceUrl: '${widget.dirPath}/A1S1.1.3.4.mp3',
                          popUpText: learningTxt[5],
                          imageChoose: "${widget.dirPath}/A1P1.1.3.3.png",
                        )
                      : widget.step == 5
                          ? LearningPage2Portrait(
                              player: player,
                              voiceUrl: '${widget.dirPath}/A1S1.1.3.5.mp3',
                              popUpText: learningTxt[6],
                              imageChoose: "${widget.dirPath}/A1P1.1.3.5.png",
                            )
                          : widget.step == 6
                              ? LearningPage2Portrait(
                                  player: player,
                                  voiceUrl: '${widget.dirPath}/A1S1.1.3.6.mp3',
                                  popUpText: learningTxt[7],
                                  imageChoose:
                                      "${widget.dirPath}/A1P1.1.3.6.png",
                                )
                              : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 0 &&
        widget.pageIndex == 3) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.1.4.1.mp3',
              popUpText: learningTxt[14],
              imageChoose: "${widget.dirPath}/A1P1.1.4.1.png",
            )
          : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 1 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.2.1.1.mp3',
              popUpText: learningTxt[15],
              imageChoose: "${widget.dirPath}/A1P1.2.1.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.2.1.2.mp3',
                  popUpText: learningTxt[16],
                  imageChoose: "${widget.dirPath}/A1P1.2.1.2.png",
                )
              : widget.step == 3
                  ? LearningPage4TextOnly(
                      player: player,
                      backButton: () {},
                      voiceUrl: '${widget.dirPath}/A1S1.2.1.2.mp3',
                      popUpText: learningTxt[17],
                      imageChoose: "${widget.dirPath}/A1P1.2.1.2.png",
                    )
                  : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 1 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.2.2.1.mp3',
              popUpText: learningTxt[18],
              imageChoose: "${widget.dirPath}/A1P1.2.2.1.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.2.2.2.mp3',
                  popUpText: learningTxt[19],
                  imageChoose: "${widget.dirPath}/A1P1.2.2.2.png",
                )
              : widget.step == 3
                  ? LearningPage3Video(
                      chewieController: chewieController,
                      videoPlayerController: videoPlayerController,
                      hearderTitle: subjects[0][0][0],
                      videoUrl:
                          'https://drive.google.com/file/d/1Iy8nOM1tZeL_sbVJaBmUE2ddBDv3P_jW/view?usp=sharing')
                  : widget.step == 4
                      ? LearningPage5ImageOnly(
                          hearderTitle: 'hearderTitle',
                          imageChoose: "${widget.dirPath}/A1P1.2.2.4.png",
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
              voiceUrl: '${widget.dirPath}/A1S1.2.3.1.mp3',
              popUpText: learningTxt[21],
              imageChoose: "${widget.dirPath}/A1P1.2.3.1.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.2.3.2.mp3',
                  popUpText: learningTxt[22],
                  imageChoose: "${widget.dirPath}/A1P1.2.3.1.png",
                )
              : widget.step == 3
                  ? LearningPage4TextOnly(
                      player: player,
                      popUpText: learningTxt[23],
                      imageChoose: "${widget.dirPath}/A1P1.2.3.1.png",
                      backButton: () {},
                      voiceUrl: '${widget.dirPath}/A1S1.2.3.3.mp3',
                    )
                  : widget.step == 4
                      ? LearningPage2Portrait(
                          player: player,
                          voiceUrl: '${widget.dirPath}/A1S1.2.3.4.mp3',
                          popUpText: learningTxt[24],
                          imageChoose: "${widget.dirPath}/A1P1.2.3.4.png",
                        )
                      : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 1 &&
        widget.pageIndex == 3) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.2.4.1.mp3',
              popUpText: learningTxt[25],
              imageChoose: "${widget.dirPath}/A1P1.2.4.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.2.4.1.mp3',
                  popUpText: learningTxt[26],
                  imageChoose: "${widget.dirPath}/A1P1.2.4.2.png",
                )
              : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 2 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.3.1.1.mp3',
              popUpText: learningTxt[27],
              imageChoose: "${widget.dirPath}/A1P1.3.1.1.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.3.1.2.mp3',
                  popUpText: learningTxt[28],
                  imageChoose: "${widget.dirPath}/A1P1.3.1.2.png",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '${widget.dirPath}/A1S1.3.1.3.mp3',
                      popUpText: learningTxt[29],
                      imageChoose: "${widget.dirPath}/A1P1.3.1.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage2Portrait(
                          player: player,
                          voiceUrl: '${widget.dirPath}/A1S1.3.1.4.mp3',
                          popUpText: learningTxt[30],
                          imageChoose: "${widget.dirPath}/A1P1.3.1.2.png",
                        )
                      : widget.step == 5
                          ? LearningPage4TextOnly(
                              player: player,
                              backButton: () {},
                              voiceUrl: '${widget.dirPath}/A1S1.3.1.5.mp3',
                              popUpText: learningTxt[31],
                              imageChoose: "${widget.dirPath}/A1P1.3.1.2.png",
                            )
                          : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 2 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.3.2.1.mp3',
              popUpText: learningTxt[32],
              imageChoose: "${widget.dirPath}/A1P1.3.2.1.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.3.2.2.mp3',
                  popUpText: learningTxt[33],
                  imageChoose: "${widget.dirPath}/A1P1.3.2.2.png",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '${widget.dirPath}/A1S1.3.2.4.mp3',
                      popUpText: learningTxt[34],
                      imageChoose: "${widget.dirPath}/A1P1.3.2.4.png",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '${widget.dirPath}/A1S1.3.2.5.mp3',
                          popUpText: learningTxt[35],
                          imageChoose: "${widget.dirPath}/A1P1.3.2.5.png",
                        )
                      : widget.step == 5
                          ? LearningPage1Landscape(
                              player: player,
                              voiceUrl: '${widget.dirPath}/A1S1.3.2.6.mp3',
                              popUpText: learningTxt[36],
                              imageChoose: "${widget.dirPath}/A1P1.3.2.1.png",
                            )
                          : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 2 &&
        widget.pageIndex == 2) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.3.3.1.mp3',
              popUpText: learningTxt[37],
              imageChoose: "${widget.dirPath}/A1P1.3.3.1.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.3.3.2.mp3',
                  popUpText: learningTxt[38],
                  imageChoose: "${widget.dirPath}/A1P1.3.1.3.png",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '${widget.dirPath}/A1S1.3.3.3.mp3',
                      popUpText: learningTxt[39],
                      imageChoose: "${widget.dirPath}/A1P1.3.3.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '${widget.dirPath}/A1S1.3.3.4.mp3',
                          popUpText: learningTxt[40],
                          imageChoose: "${widget.dirPath}/A1P1.3.3.4.png",
                        )
                      : widget.step == 5
                          ? LearningPage4TextOnly(
                              player: player,
                              backButton: () {},
                              voiceUrl: '${widget.dirPath}/A1S1.3.2.6.mp3',
                              popUpText: learningTxt[41],
                              imageChoose: "${widget.dirPath}/A1P1.3.2.1.png",
                            )
                          : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 3 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.4.1.1.mp3',
              popUpText: learningTxt[42],
              imageChoose: "${widget.dirPath}/A1P1.4.1.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.4.1.2.mp3',
                  popUpText: learningTxt[43],
                  imageChoose: "${widget.dirPath}/A1P1.4.1.2.png",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '${widget.dirPath}/A1S1.4.1.3.mp3',
                      popUpText: learningTxt[44],
                      imageChoose: "${widget.dirPath}/A1P1.4.1.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '${widget.dirPath}/A1S1.4.1.4.mp3',
                          popUpText: learningTxt[45],
                          imageChoose: "${widget.dirPath}/A1P1.4.1.4.png",
                        )
                      : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 3 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.4.2.1.mp3',
              popUpText: learningTxt[46],
              imageChoose: "${widget.dirPath}/A1P1.4.2.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.4.2.2.mp3',
                  popUpText: learningTxt[47],
                  imageChoose: "${widget.dirPath}/A1P1.4.2.2.png",
                )
              : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 3 &&
        widget.pageIndex == 2) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.4.3.1.mp3',
              popUpText: learningTxt[48],
              imageChoose: "${widget.dirPath}/A1P1.4.3.1.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.4.3.2.mp3',
                  popUpText: learningTxt[49],
                  imageChoose: "${widget.dirPath}/A1P1.4.3.2.png",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '${widget.dirPath}/A1S1.4.3.3.mp3',
                      popUpText: learningTxt[50],
                      imageChoose: "${widget.dirPath}/A1P1.4.3.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage2Portrait(
                          player: player,
                          voiceUrl: '${widget.dirPath}/A1S1.4.3.4.mp3',
                          popUpText: learningTxt[51],
                          imageChoose: "${widget.dirPath}/A1P1.4.3.4.png",
                        )
                      : widget.step == 5
                          ? LearningPage2Portrait(
                              player: player,
                              voiceUrl: '${widget.dirPath}/A1S1.4.3.5.mp3',
                              popUpText: learningTxt[52],
                              imageChoose: "${widget.dirPath}/A1P1.4.3.5.png",
                            )
                          : widget.step == 6
                              ? LearningPage1Landscape(
                                  player: player,
                                  voiceUrl: '${widget.dirPath}/A1S1.4.3.6.mp3',
                                  popUpText: learningTxt[53],
                                  imageChoose:
                                      "${widget.dirPath}/A1P1.4.3.1.png",
                                )
                              : widget.step == 7
                                  ? LearningPage1Landscape(
                                      player: player,
                                      voiceUrl:
                                          '${widget.dirPath}/A1S1.4.3.7.mp3',
                                      popUpText: learningTxt[54],
                                      imageChoose:
                                          "${widget.dirPath}/A1P1.4.3.7.png",
                                    )
                                  : widget.step == 8
                                      ? LearningPage1Landscape(
                                          player: player,
                                          voiceUrl:
                                              '${widget.dirPath}/A1S1.4.3.8.mp3',
                                          popUpText: learningTxt[55],
                                          imageChoose:
                                              "${widget.dirPath}/A1P1.4.3.8.png",
                                        )
                                      : widget.step == 9
                                          ? LearningPage2Portrait(
                                              player: player,
                                              voiceUrl:
                                                  '${widget.dirPath}/A1S1.4.3.9.mp3',
                                              popUpText: learningTxt[56],
                                              imageChoose:
                                                  "${widget.dirPath}/A1P1.4.3.9.png",
                                            )
                                          : widget.step == 10
                                              ? LearningPage2Portrait(
                                                  player: player,
                                                  voiceUrl:
                                                      '${widget.dirPath}/A1S1.4.3.10.mp3',
                                                  popUpText: learningTxt[57],
                                                  imageChoose:
                                                      "${widget.dirPath}/A1P1.4.3.9.png",
                                                )
                                              : widget.step == 11
                                                  ? LearningPage2Portrait(
                                                      player: player,
                                                      voiceUrl:
                                                          '${widget.dirPath}/A1S1.4.3.11.mp3',
                                                      popUpText:
                                                          learningTxt[58],
                                                      imageChoose:
                                                          "${widget.dirPath}/A1P1.4.3.11.png",
                                                    )
                                                  : widget.step == 12
                                                      ? LearningPage2Portrait(
                                                          player: player,
                                                          voiceUrl:
                                                              '${widget.dirPath}/A1S1.4.3.12.mp3',
                                                          popUpText:
                                                              learningTxt[59],
                                                          imageChoose:
                                                              "${widget.dirPath}/A1P1.4.3.12.png",
                                                        )
                                                      : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 4 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.5.1.1.mp3',
              popUpText: learningTxt[60],
              imageChoose: "${widget.dirPath}/A1P1.5.1.1.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.5.1.2.mp3',
                  popUpText: learningTxt[61],
                  imageChoose: "${widget.dirPath}/A1P1.1.3.6.png",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '${widget.dirPath}/A1S1.5.1.3.mp3',
                      popUpText: learningTxt[62],
                      imageChoose: "${widget.dirPath}/A1P1.5.1.3.png",
                    )
                  : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 4 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.5.2.1.mp3',
              popUpText: learningTxt[63],
              imageChoose: "${widget.dirPath}/A1P1.4.3.9.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.5.2.2.mp3',
                  popUpText: learningTxt[64],
                  imageChoose: "${widget.dirPath}/A1P1.5.2.2.png",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '${widget.dirPath}/A1S1.5.2.3.mp3',
                      popUpText: learningTxt[65],
                      imageChoose: "${widget.dirPath}/A1P1.5.2.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage2Portrait(
                          player: player,
                          voiceUrl: '${widget.dirPath}/A1S1.5.2.4.mp3',
                          popUpText: learningTxt[66],
                          imageChoose: "${widget.dirPath}/A1P1.5.2.4.png",
                        )
                      : widget.step == 5
                          ? LearningPage2Portrait(
                              player: player,
                              voiceUrl: '${widget.dirPath}/A1S1.5.2.5.mp3',
                              popUpText: learningTxt[67],
                              imageChoose: "${widget.dirPath}/A1P1.5.2.5.png",
                            )
                          : widget.step == 6
                              ? LearningPage2Portrait(
                                  player: player,
                                  voiceUrl: '${widget.dirPath}/A1S1.5.2.6.mp3',
                                  popUpText: learningTxt[68],
                                  imageChoose:
                                      "${widget.dirPath}/A1P1.5.2.6.png",
                                )
                              : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 5 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.6.1.1.mp3',
              popUpText: learningTxt[69],
              imageChoose: "${widget.dirPath}/A1P1.6.1.1.png",
            )
          : widget.step == 2
              ? LearningPage4TextOnly(
                  player: player,
                  backButton: () {},
                  voiceUrl: '${widget.dirPath}/A1S1.5.2.2.mp3',
                  popUpText: learningTxt[70],
                  imageChoose: "${widget.dirPath}/A1P1.5.2.2.png",
                )
              : widget.step == 3
                  ? LearningPage4TextOnly(
                      player: player,
                      backButton: () {},
                      voiceUrl: '${widget.dirPath}/A1S1.5.2.3.mp3',
                      popUpText: learningTxt[71],
                      imageChoose: "${widget.dirPath}/A1P1.5.2.3.png",
                    )
                  : Container();
    } else if (widget.moduleIndex == 0 &&
        widget.chapterIndex == 5 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.6.2.1.mp3',
              popUpText: learningTxt[72],
              imageChoose: "${widget.dirPath}/A1P1.6.2.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.6.2.2.mp3',
                  popUpText: learningTxt[73],
                  imageChoose: "${widget.dirPath}/A1P1.6.2.2.png",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '${widget.dirPath}/A1S1.6.2.3.mp3',
                      popUpText: learningTxt[74],
                      imageChoose: "${widget.dirPath}/A1P1.4.3.9.png",
                    )
                  : Container();
    } else {
      return Container();
    }
  }
}
