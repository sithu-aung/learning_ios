// import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:learning/src/audio_controller/audio_controller.dart';
// import 'package:learning/src/interactive/soil_column_page.dart';
// import 'package:learning/src/interactive/soil_page.dart';

// import 'package:just_audio/just_audio.dart' as justAudio;
// import 'package:learning/src/learning_page/learning_page_styles/learning_page_1_landscape.dart';
// import 'package:learning/src/learning_page/learning_page_styles/learning_page_2_portrait.dart';
// import 'package:learning/src/learning_page/learning_page_styles/learning_page_3_video.dart';
// import 'package:learning/src/learning_page/learning_page_styles/learning_page_4_text_only.dart';
// import 'package:learning/src/learning_page/learning_page_styles/learning_page_5_image_only.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LearningPage extends StatefulWidget {
//   String type;
//   bool isFirstPage;
//   // String? text;
//   // String? image;
//   // String? audio;
//   // final Function? onLeftTap;
//   // final Function? onRightTap;
//   LearningPage({
//     Key? key,
//     required this.type,
//     required this.isFirstPage,
//     // this.text,
//     // this.image,
//     // this.audio,
//     // this.onLeftTap,
//     // this.onRightTap,
//   }) : super(key: key);

//   @override
//   State<LearningPage> createState() => _LearningPageState();
// }

// class _LearningPageState extends State<LearningPage> {
//   bool textpopUpVisible = false;
//   bool imagepopUpVisible = false;
//   bool startPlay = false;
//   String audio = "assets/audio/s1.wav";
//   late Stream<DurationState> _durationState;
//   final player = justAudio.AudioPlayer();
//   String? dirPath;
//   ScrollController scrollController = ScrollController();

//   String hearderTitle = '၁.၁။ မြေဆီလွှာဆိုသည်မာ အဘယ်နည်း။';

//   String learning1Txt =
//       """ကမ္ဘာမြေရဲ့ တစ်နေရာနဲ့ တစ်နေရာ၊ လယ်ကွင်းတစ်ခုရဲ့ တစ်နေရာနဲ့ တစ်နေရာ‌ပေါ် မူတည်ပြီး မြေဆီလွှာ‌တွေက ကွဲပြားမှု ရှိပါတယ်။ သူတို့ ဘယ်လိုဖြစ်‌ပေါ်လာလဲဆိုတဲ့ အပေါ်မူတည်ပြီးတော့လည်း မြေဆီလွှာတွေက ကွဲပြားမှုရှိကြပါတယ်။ မြေဆီလွှာကို ဖြစ်ပေါ်စေတဲ့ အကြောင်းအရာတွေကြောင့် မတူကွဲပြားတဲ့ မြေဆီလွှာအမျိုးမျိုး ဖြစ်ပေါ်လာရပါတယ်။ """;

//   String learning2txt =
//       "မြေဆီလွှာမှာ အဓိကပါဝင်မှု (၅)မျိုး ရှိပါတယ်။ ၎င်းတို့ကတော့ - \n၁။ ကျောက်တုံးကျောက်ဆောင်များ ပြိုကွဲခြင်းနှင့် ပျက်စီးခြင်းတို့မှ ဖြစ်ပေါ်လာသော ဓာတ်သတ္တုများ\n၂။ အပင်အကြွင်းအကျန်များ၊ တိရစ္ဆာန်အကြွင်းအကျန်များနှင့် အဏုဇီဝတစ်ရှုးများ ဆွေးမြေ့ရာမှ ဖြစ်ပေါ်လာသော သဘာဝမြေဆွေး \n၃။ ရေ \n၄။ လေနှင့် ဓာတ်ငွေ့များ  \n၅။ သက်ရှိများ (တီကောင်၊ အင်းဆက်ကဲ့သို့သော အကောင်ကြီးများနှင့် အဏုဇီဝပိုးများ ကဲ့သို့သော အကောင်ငယ်များ)";

//   String learning4txt =
//       "မြေကြီးရဲ့ အခြား ရုပ်ဂုဏ်သတ္တိတွေကတော့ - \n(၁) အလေးချိန်နဲ့ သိပ်သည်းဆ  \n(၂) မြေကြီးတွင် နေရာလပ်များ/ လေရှူပေါက်များ ပါဝင်မှု \n(၃) မြေကြီးရဲ့ စိမ့်ဝင်နိုင်မှု \n(၄) မြေကြီးရဲ့ အပူချိန်နဲ့ \n(၅) မြေကြီးရဲ့ ပုံစံပြောင်းနိုင်မှု၊ အဖိအသိပ်ခံနိုင်မှုနဲ့ တိုက်စားခံနိုင်မှု တို့ဖြစ်ပါတယ်။";

//   String textList =
//       "မြေဆီလွှာကို ဖြစ်ပေါ်စေတဲ့ အကြောင်းအရင်း (၅)ခုမှာ - \n(က)  ရာသီဥတု၊\n(ခ)   သက်ရှိအကြောင်းအရာများ၊\n(ဂ)   မြေမျက်နှာသွင်ပြင်၊ \n(ဃ)  မိခင်အစိုင်အခဲ၊ \n(င)    အချိန်။";

//   @override
//   void initState() {
//     initial();
//     super.initState();
//     _durationState = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
//         player.positionStream,
//         player.playbackEventStream,
//         (position, playbackEvent) => DurationState(
//               progress: position,
//               buffered: playbackEvent.bufferedPosition,
//               total: playbackEvent.duration,
//             ));
//   }

//   initial() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       dirPath = prefs.getString('module1');
//     });
//   }

//   @override
//   void dispose() {
//     player.dispose();
//     //videoPlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mqData = MediaQuery.of(context);
//     final mqDataNew = mqData.copyWith(
//         textScaleFactor:
//             mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);

//     return MediaQuery(
//       data: mqDataNew,
//       child: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 225, 255, 147),
//         body: dirPath != null
//             ? widget.type == '1'
//                 ? LearningPage1Landscape(
//                     voiceUrl: 'assets/audio/s1.wav',
//                     playButton: _playButton(),
//                     progressBar: _progressBar,
//                     popUpText: learning1Txt,
//                     imageChoose: "${dirPath!}/A1P1.1.2.1.png",
//                     backButton: () {
//                       //     Navigator.pop(context);
//                     },
//                   )
//                 : widget.type == '2'
//                     ? LearningPage2Portrait(
//                         hearderTitle: hearderTitle,
//                         playSound: () async {
//                           await playSound();
//                         },
//                         playButton: _playButton(),
//                         progressBar: () {
//                           _progressBar();
//                         },
//                         popUpText: learning2txt,
//                         imageChoose: "${dirPath!}/A1P1.1.1.2.png",
//                         arrowLeftOnTap: () {
//                           setState(() {
//                             widget.type = '1';
//                           });
//                         },
//                         arrowRightOnTap: () {
//                           setState(() {
//                             widget.type = '3';
//                           });
//                         },
//                       )
//                     : widget.type == '3'
//                         ? LearningPage3Video(
//                             hearderTitle: hearderTitle,
//                             videoUrl: 'assets/soil.mp4',
//                           )
//                         : widget.type == '4'
//                             ? LearningPage4TextOnly(
//                                 hearderTitle: hearderTitle,
//                                 text: learning4txt,
//                                 playSound: () async {
//                                   await playSound();
//                                 },
//                                 playButton: _playButton(),
//                                 progressBar: () {
//                                   _progressBar();
//                                 },
//                                 arrowRightOnTap: () {
//                                   setState(() {
//                                     widget.type = '5';
//                                   });
//                                 },
//                                 arrowLeftOnTap: () {
//                                   setState(() {
//                                     widget.type = '3';
//                                   });
//                                 },
//                               )
//                             : widget.type == '5'
//                                 ? LearningPage5ImageOnly(
//                                     hearderTitle: hearderTitle,
//                                     image: 'assets/images/l6.jpg',
//                                     arrowRightOnTap: () {
//                                       setState(() {
//                                         widget.type = '6';
//                                       });
//                                       // Navigator.push(
//                                       //   context,
//                                       //   MaterialPageRoute(
//                                       //     builder: (context) =>
//                                       //         const SoilColumnPage(),
//                                       //   ),
//                                       // );
//                                     },
//                                     arrowLeftOnTap: () {
//                                       setState(() {
//                                         widget.type = '4';
//                                       });
//                                     },
//                                   )
//                                 : widget.type == '6'
//                                     ? SoilColumnPage(
//                                         hearderTitle: hearderTitle,
//                                         titleOne: 'ရာသီဥတု',
//                                         titleTwo: 'သက်ရှိအကြောင်းအရာများ',
//                                         titleThree: 'မြေမျက်နှာသွင်ပြင်',
//                                         titleFour: 'မိခင်အစိုင်အခဲ။',
//                                         titleFive: 'အချိန်',
//                                         titleImageOne: 'assets/images/m1.png',
//                                         titleImageTwo: 'assets/images/m2.png',
//                                         titleImageThree: 'assets/images/m3.png',
//                                         titleImageFour: 'assets/images/m4.png',
//                                         titleImageFive: 'assets/images/m5.png',
//                                         imageOne: 'assets/images/s1.png',
//                                         textOne:
//                                             '(က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။ (က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။ (က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။',
//                                         imageTwo: 'assets/images/s2.png',
//                                         textTwo:
//                                             '(ခ) သက်ရှိအကြောင်းအရာများ။ အပင်များ၊ တိရစ္ဆာန်များ၊ မှိုများ၊ ဘက်တီးရီးယားများနှင့် အဏုဇီဝသက်ရှိများ ',
//                                         imageThree: 'assets/images/s3.png',
//                                         textThree:
//                                             '(ဂ) မြေမျက်နှာသွင်ပြင်။ တောင်စောင်းအနေအထား၊ ရှုထောင့်၊ ပုံသဏ္ဍာန်',
//                                         imageFour: 'assets/images/s4.png',
//                                         textFour:
//                                             '(ဃ) မိခင်အစိုင်အခဲ။ ကျောက်ဆောင်၊ နုန်းမြေ (alluvium) (လေ သို့မဟုတ် ရေ အနယ်ကျရာမှ ဖြစ်ပေါ်လာသော အရာ)',
//                                         imageFive: 'assets/images/s5.png',
//                                         textFive:
//                                             '(င) အချိန်။ မြေဆီလွှာစတင်ဖြစ်ပေါ်တဲ့ အချိန်ကစပြီး ကြာချိန်',
//                                         textList: textList,
//                                         arrowLeftOnTap: () {
//                                           setState(() {
//                                             widget.type = '5';
//                                           });
//                                         },
//                                         arrowRightOnTap: () {
//                                           setState(() {
//                                             widget.type = '7';
//                                           });
//                                         },
//                                       )
//                                     : SoilPageScreen(
//                                         hearderTitle: hearderTitle,
//                                         titleOne: 'ရာသီဥတု',
//                                         titleTwo: 'သက်ရှိအကြောင်းအရာများ',
//                                         titleThree: 'မြေမျက်နှာသွင်ပြင်',
//                                         titleFour: 'မိခင်အစိုင်အခဲ။',
//                                         titleFive: 'အချိန်',
//                                         titleImageOne: 'assets/images/m1.png',
//                                         titleImageTwo: 'assets/images/m2.png',
//                                         titleImageThree: 'assets/images/m3.png',
//                                         titleImageFour: 'assets/images/m4.png',
//                                         titleImageFive: 'assets/images/m5.png',
//                                         imageOne: 'assets/images/s1.png',
//                                         textOne:
//                                             '(က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။ (က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။ (က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။',
//                                         imageTwo: 'assets/images/s2.png',
//                                         textTwo:
//                                             '(ခ) သက်ရှိအကြောင်းအရာများ။ အပင်များ၊ တိရစ္ဆာန်များ၊ မှိုများ၊ ဘက်တီးရီးယားများနှင့် အဏုဇီဝသက်ရှိများ ',
//                                         imageThree: 'assets/images/s3.png',
//                                         textThree:
//                                             '(ဂ) မြေမျက်နှာသွင်ပြင်။ တောင်စောင်းအနေအထား၊ ရှုထောင့်၊ ပုံသဏ္ဍာန်',
//                                         imageFour: 'assets/images/s4.png',
//                                         textFour:
//                                             '(ဃ) မိခင်အစိုင်အခဲ။ ကျောက်ဆောင်၊ နုန်းမြေ (alluvium) (လေ သို့မဟုတ် ရေ အနယ်ကျရာမှ ဖြစ်ပေါ်လာသော အရာ)',
//                                         imageFive: 'assets/images/s5.png',
//                                         textFive:
//                                             '(င) အချိန်။ မြေဆီလွှာစတင်ဖြစ်ပေါ်တဲ့ အချိန်ကစပြီး ကြာချိန်',
//                                         textList: textList,
//                                       )
//             : Container(),
//         // widget.type == "1"
//         //     ? Stack(
//         //         children: [
//         //           BackgroundPage(
//         //             backImage: "assets/images/agre_back.jpg",
//         //           ),
//         //           const SessionHeader(),
//         //           Align(
//         //             alignment: Alignment.topCenter,
//         //             child: Padding(
//         //               padding: const EdgeInsets.only(right: 52),
//         //               child: Row(
//         //                 mainAxisAlignment: MainAxisAlignment.center,
//         //                 crossAxisAlignment: CrossAxisAlignment.start,
//         //                 children: [
//         //                   GestureDetector(
//         //                     behavior: HitTestBehavior.translucent,
//         //                     onTap: () async {
//         //                       setState(() {
//         //                         startPlay = true;
//         //                       });
//         //                       await playSound();
//         //                     },
//         //                     child: Align(
//         //                       alignment: Alignment.bottomLeft,
//         //                       child: Container(
//         //                         margin: EdgeInsets.only(
//         //                             bottom: MediaQuery.of(context).size.height *
//         //                                 0.3,
//         //                             right: 12),
//         //                         child: Column(
//         //                           mainAxisAlignment: MainAxisAlignment.end,
//         //                           crossAxisAlignment: CrossAxisAlignment.start,
//         //                           children: [
//         //                             Row(
//         //                               mainAxisAlignment: MainAxisAlignment.end,
//         //                               crossAxisAlignment:
//         //                                   CrossAxisAlignment.end,
//         //                               children: [
//         //                                 Image.asset(
//         //                                   "assets/images/profile1.png",
//         //                                   width: 52,
//         //                                 ),
//         //                                 startPlay ? _playButton() : Container()
//         //                               ],
//         //                             ),
//         //                             const SizedBox(
//         //                               height: 8,
//         //                             ),
//         //                             SizedBox(width: 60, child: _progressBar())
//         //                           ],
//         //                         ),
//         //                       ),
//         //                     ),
//         //                   ),
//         //                   Container(
//         //                     decoration: shadowDecorationWithBorderColor(
//         //                         const Color.fromARGB(200, 113, 101, 45),
//         //                         const Color.fromARGB(180, 113, 101, 45),
//         //                         12),
//         //                     margin: const EdgeInsets.only(top: 60),
//         //                     width: MediaQuery.of(context).size.width * 0.5,
//         //                     height: MediaQuery.of(context).size.height * 0.54,
//         //                     padding: EdgeInsets.only(
//         //                         left: MediaQuery.of(context).size.width * 0.1,
//         //                         right: 12,
//         //                         top: 12,
//         //                         bottom: 12),
//         //                     child: Stack(
//         //                       children: [
//         //                         GestureDetector(
//         //                           behavior: HitTestBehavior.translucent,
//         //                           onTap: () {
//         //                             setState(() {
//         //                               imagepopUpVisible = true;
//         //                             });
//         //                           },
//         //                           child: Align(
//         //                             alignment: Alignment.topRight,
//         //                             child: Image.asset(
//         //                               "assets/images/expand.png",
//         //                               width: 28,
//         //                               color: Colors.white,
//         //                             ),
//         //                           ),
//         //                         ),
//         //                         Image.asset(
//         //                           widget.image ?? "assets/images/app_logo.png",
//         //                           width:
//         //                               MediaQuery.of(context).size.width * 0.32,
//         //                         ),
//         //                       ],
//         //                     ),
//         //                   ),
//         //                 ],
//         //               ),
//         //             ),
//         //           ),
//         //           Align(
//         //             alignment: Alignment.bottomCenter,
//         //             child: Container(
//         //                 height: MediaQuery.of(context).size.height * 0.26,
//         //                 width: MediaQuery.of(context).size.width * 0.74,
//         //                 margin: EdgeInsets.only(
//         //                     left: MediaQuery.of(context).size.width * 0.1,
//         //                     right: MediaQuery.of(context).size.width * 0.1,
//         //                     bottom: 8),
//         //                 padding: const EdgeInsets.only(
//         //                     left: 24, top: 8, bottom: 8, right: 8),
//         //                 decoration: shadowDecorationWithBorderColor(
//         //                     const Color.fromARGB(200, 113, 101, 45),
//         //                     const Color.fromARGB(200, 113, 101, 45),
//         //                     12),
//         //                 child: Stack(
//         //                   children: [
//         //                     GestureDetector(
//         //                       behavior: HitTestBehavior.translucent,
//         //                       onTap: () {
//         //                         setState(() {
//         //                           textpopUpVisible = true;
//         //                         });
//         //                       },
//         //                       child: Align(
//         //                         alignment: Alignment.topRight,
//         //                         child: Image.asset(
//         //                           "assets/images/expand.png",
//         //                           width: 28,
//         //                           color: Colors.white,
//         //                         ),
//         //                       ),
//         //                     ),
//         //                     Padding(
//         //                       padding: const EdgeInsets.only(right: 36),
//         //                       child: Scrollbar(
//         //                         trackVisibility: true,
//         //                         thumbVisibility: true,
//         //                         child: SingleChildScrollView(
//         //                             child: Padding(
//         //                           padding: const EdgeInsets.only(right: 12),
//         //                           child: Text(
//         //                             widget.text ?? "-",
//         //                             style: TextStyle(
//         //                                 height: 1.7,
//         //                                 color: Colors.white,
//         //                                 fontSize: Responsive.isMobile(context)
//         //                                     ? 16
//         //                                     : 19),
//         //                           ),
//         //                         )),
//         //                       ),
//         //                     ),
//         //                   ],
//         //                 )),
//         //           ),
//         //           Align(
//         //             alignment: Alignment.topCenter,
//         //             child: Visibility(
//         //                 visible: textpopUpVisible, child: textPopUpWidget()),
//         //           ),
//         //           Align(
//         //             alignment: Alignment.topCenter,
//         //             child: Visibility(
//         //                 visible: imagepopUpVisible, child: imagePopUpWidget()),
//         //           ),
//         //           Align(
//         //             alignment: Alignment.bottomRight,
//         //             child: Visibility(
//         //               visible: !imagepopUpVisible,
//         //               child: Container(
//         //                 height: 60,
//         //                 width: 60,
//         //                 margin: const EdgeInsets.only(bottom: 8, right: 20),
//         //                 child: GestureDetector(
//         //                   child: Image.asset(
//         //                     "assets/images/arrow_right.png",
//         //                     width: 20,
//         //                   ),
//         //                   onTap: () {
//         //                     if (player.playing) {
//         //                       player.stop();
//         //                     }
//         //                     widget.onRightTap?.call();
//         //                   },
//         //                 ),
//         //               ),
//         //             ),
//         //           ),
//         //           Visibility(
//         //             visible: !widget.isFirstPage && !imagepopUpVisible,
//         //             child: Align(
//         //               alignment: Alignment.bottomLeft,
//         //               child: Container(
//         //                 height: 60,
//         //                 width: 60,
//         //                 margin: const EdgeInsets.only(bottom: 8, left: 8),
//         //                 child: GestureDetector(
//         //                   child: Image.asset(
//         //                     "assets/images/arrow_left.png",
//         //                     width: 20,
//         //                   ),
//         //                   onTap: () {
//         //                     widget.onLeftTap?.call();
//         //                   },
//         //                 ),
//         //               ),
//         //             ),
//         //           ),
//         //         ],
//         //       )
//         //     : Stack(
//         //         children: [
//         //           BackgroundPage(
//         //             backImage: "assets/images/agre_back.jpg",
//         //           ),
//         //           const SessionHeader(),
//         //           Row(
//         //             mainAxisAlignment: MainAxisAlignment.start,
//         //             children: [
//         //               Container(
//         //                 decoration: shadowDecorationWithBorderColor(
//         //                     const Color.fromARGB(200, 113, 101, 45),
//         //                     const Color.fromARGB(200, 113, 101, 45),
//         //                     12),
//         //                 margin: EdgeInsets.only(
//         //                   top: 60,
//         //                   left: MediaQuery.of(context).size.width * 0.09,
//         //                 ),
//         //                 width: MediaQuery.of(context).size.width * 0.4,
//         //                 height: MediaQuery.of(context).size.height * 0.8,
//         //                 padding: const EdgeInsets.only(
//         //                     right: 12, top: 12, bottom: 12, left: 12),
//         //                 child: Stack(
//         //                   children: [
//         //                     Image.asset(
//         //                       widget.image ?? "assets/images/app_logo.png",
//         //                       width: MediaQuery.of(context).size.width * 0.38,
//         //                     ),
//         //                     GestureDetector(
//         //                       behavior: HitTestBehavior.translucent,
//         //                       onTap: () {
//         //                         setState(() {
//         //                           imagepopUpVisible = true;
//         //                         });
//         //                       },
//         //                       child: Align(
//         //                         alignment: Alignment.topRight,
//         //                         child: Image.asset(
//         //                           "assets/images/expand.png",
//         //                           width: 28,
//         //                           color: Colors.white,
//         //                         ),
//         //                       ),
//         //                     ),
//         //                   ],
//         //                 ),
//         //               ),
//         //               Container(
//         //                 height: MediaQuery.of(context).size.height * 0.8,
//         //                 width: MediaQuery.of(context).size.width * 0.4,
//         //                 margin: const EdgeInsets.only(
//         //                   left: 12,
//         //                   right: 20,
//         //                   bottom: 8,
//         //                   top: 68,
//         //                 ),
//         //                 padding: const EdgeInsets.only(
//         //                     left: 24, top: 16, bottom: 8, right: 8),
//         //                 decoration: shadowDecorationWithBorderColor(
//         //                     const Color.fromARGB(200, 113, 101, 45),
//         //                     const Color.fromARGB(200, 113, 101, 45),
//         //                     12),
//         //                 child: Stack(
//         //                   children: [
//         //                     Scrollbar(
//         //                       trackVisibility: true,
//         //                       thumbVisibility: true,
//         //                       child: SingleChildScrollView(
//         //                         child: Padding(
//         //                           padding: const EdgeInsets.only(right: 70),
//         //                           child: Text(
//         //                             widget.text ?? "-",
//         //                             style: TextStyle(
//         //                                 height: 1.7,
//         //                                 color: Colors.white,
//         //                                 fontSize: Responsive.isMobile(context)
//         //                                     ? 16
//         //                                     : 19),
//         //                           ),
//         //                         ),
//         //                       ),
//         //                     ),
//         //                     Align(
//         //                       alignment: Alignment.bottomRight,
//         //                       child: GestureDetector(
//         //                         behavior: HitTestBehavior.translucent,
//         //                         onTap: () async {
//         //                           setState(() {
//         //                             startPlay = true;
//         //                           });
//         //                           await playSound();
//         //                         },
//         //                         child: Container(
//         //                           margin: const EdgeInsets.only(
//         //                               bottom: 2, right: 2),
//         //                           child: Column(
//         //                             mainAxisAlignment: MainAxisAlignment.end,
//         //                             crossAxisAlignment:
//         //                                 CrossAxisAlignment.center,
//         //                             children: [
//         //                               _playButton(),
//         //                               const SizedBox(
//         //                                 height: 8,
//         //                               ),
//         //                               SizedBox(width: 60, child: _progressBar())
//         //                             ],
//         //                           ),
//         //                         ),
//         //                       ),
//         //                     ),
//         //                   ],
//         //                 ),
//         //               ),
//         //             ],
//         //           ),
//         //           Align(
//         //             alignment: Alignment.bottomRight,
//         //             child: Container(
//         //               height: 60,
//         //               width: 60,
//         //               margin: const EdgeInsets.only(bottom: 8, right: 8),
//         //               child: GestureDetector(
//         //                 child: Image.asset(
//         //                   "assets/images/arrow_right.png",
//         //                   width: 20,
//         //                 ),
//         //                 onTap: () {
//         //                   widget.onRightTap?.call();
//         //                 },
//         //               ),
//         //             ),
//         //           ),
//         //           Align(
//         //             alignment: Alignment.bottomLeft,
//         //             child: Container(
//         //               height: 60,
//         //               width: 60,
//         //               margin: const EdgeInsets.only(bottom: 8, left: 8),
//         //               child: GestureDetector(
//         //                 child: Image.asset(
//         //                   "assets/images/arrow_left.png",
//         //                   width: 20,
//         //                 ),
//         //                 onTap: () {
//         //                   widget.onLeftTap?.call();
//         //                 },
//         //               ),
//         //             ),
//         //           ),
//         //           Align(
//         //             alignment: Alignment.topCenter,
//         //             child: Visibility(
//         //                 visible: imagepopUpVisible, child: imagePopUpWidget()),
//         //           ),
//         //         ],
//         //       ),
//       ),
//     );
//   }

//   StreamBuilder<DurationState> _progressBar() {
//     return StreamBuilder<DurationState>(
//       stream: _durationState,
//       builder: (context, snapshot) {
//         final durationState = snapshot.data;
//         final progress = durationState?.progress ?? Duration.zero;
//         final buffered = durationState?.buffered ?? Duration.zero;
//         final total = durationState?.total ?? Duration.zero;
//         return ProgressBar(
//           progress: progress,
//           buffered: buffered,
//           total: total,
//           onSeek: (duration) {
//             player.seek(duration);
//           },
//           onDragUpdate: (details) {
//             debugPrint('${details.timeStamp}, ${details.localPosition}');
//           },
//           timeLabelLocation: TimeLabelLocation.none,
//           barHeight: 6,
//           baseBarColor: Colors.white,
//           thumbRadius: 2,
//         );
//       },
//     );
//   }

//   StreamBuilder<PlayerState> _playButton() {
//     return StreamBuilder<PlayerState>(
//       stream: player.playerStateStream,
//       builder: (context, snapshot) {
//         final playerState = snapshot.data;
//         final processingState = playerState?.processingState;
//         final playing = playerState?.playing;
//         if ((processingState == ProcessingState.loading ||
//                 processingState == ProcessingState.buffering) &&
//             !startPlay) {
//           return Container(
//             margin: const EdgeInsets.all(8.0),
//             width: 24.0,
//             height: 24.0,
//             child: const CircularProgressIndicator(),
//           );
//         } else if (playing != true) {
//           return IconButton(
//             icon: const Icon(Icons.play_arrow),
//             iconSize: 32.0,
//             onPressed: player.play,
//           );
//         } else if (processingState != ProcessingState.completed) {
//           return IconButton(
//             icon: const Icon(Icons.pause),
//             iconSize: 32.0,
//             onPressed: player.pause,
//           );
//         } else {
//           return IconButton(
//             icon: const Icon(Icons.replay),
//             iconSize: 32.0,
//             onPressed: () => player.seek(Duration.zero),
//           );
//         }
//       },
//     );
//   }

//   Future<void> playSound() async {
//     if (player.playing) {
//       player.stop();
//     }
//     await player.setAsset(audio, preload: true);

//     await player.play();
//   }

//   // Widget textPopUpWidget() {
//   //   return GestureDetector(
//   //     onTap: () {},
//   //     child: Container(
//   //         width: MediaQuery.of(context).size.width * 0.58,
//   //         margin: EdgeInsets.only(
//   //             top: MediaQuery.of(context).size.height * 0.14,
//   //             bottom: Responsive.isMobile(context)
//   //                 ? 12
//   //                 : MediaQuery.of(context).size.height * 0.26),
//   //         decoration: shadowDecorationWithBorderColor(
//   //             const Color.fromARGB(255, 255, 216, 95),
//   //             const Color.fromARGB(255, 255, 216, 95),
//   //             12),
//   //         child: Stack(
//   //           children: [
//   //             Align(
//   //               alignment: Alignment.topRight,
//   //               child: GestureDetector(
//   //                 onTap: () {
//   //                   setState(() {
//   //                     textpopUpVisible = false;
//   //                   });
//   //                 },
//   //                 child: Padding(
//   //                   padding: const EdgeInsets.all(8.0),
//   //                   child: Image.asset(
//   //                     "assets/images/close.png",
//   //                     width: Responsive.isMobile(context) ? 32 : 38,
//   //                   ),
//   //                 ),
//   //               ),
//   //             ),
//   //             Padding(
//   //               padding: const EdgeInsets.only(right: 60, top: 30, bottom: 20),
//   //               child: Scrollbar(
//   //                 controller: scrollController,
//   //                 trackVisibility: true,
//   //                 thumbVisibility: true,
//   //                 child: SingleChildScrollView(
//   //                   child: Container(
//   //                       height: MediaQuery.of(context).size.height * 0.7,
//   //                       margin: const EdgeInsets.only(right: 30),
//   //                       padding: const EdgeInsets.only(
//   //                           left: 30, bottom: 16, right: 50),
//   //                       child: Padding(
//   //                         padding: const EdgeInsets.only(right: 12),
//   //                         child: Text(
//   //                           widget.text ?? "-",
//   //                           style: TextStyle(
//   //                               height: 1.8,
//   //                               color: Colors.black,
//   //                               fontSize:
//   //                                   Responsive.isMobile(context) ? 16 : 19),
//   //                         ),
//   //                       )),
//   //                 ),
//   //               ),
//   //             ),
//   //           ],
//   //         )),
//   //   );
//   // }

//   // Widget imagePopUpWidget() {
//   //   return GestureDetector(
//   //     onTap: () {},
//   //     child: Container(
//   //       width: MediaQuery.of(context).size.width,
//   //       decoration: shadowDecorationWithBorderColor(
//   //           const Color.fromARGB(180, 0, 0, 0),
//   //           const Color.fromARGB(180, 113, 101, 45),
//   //           12),
//   //       child: Column(
//   //         crossAxisAlignment: CrossAxisAlignment.start,
//   //         children: [
//   //           Stack(
//   //             children: [
//   //               Center(
//   //                 child: SizedBox(
//   //                   height: MediaQuery.of(context).size.height * 0.98,
//   //                   child: PhotoView(
//   //                     imageProvider: AssetImage(
//   //                         widget.image ?? "assets/images/app_logo.png"),
//   //                     backgroundDecoration:
//   //                         const BoxDecoration(color: Colors.white),
//   //                   ),
//   //                 ),
//   //               ),
//   //               Align(
//   //                 alignment: Alignment.topRight,
//   //                 child: GestureDetector(
//   //                   onTap: () {
//   //                     setState(() {
//   //                       imagepopUpVisible = false;
//   //                     });
//   //                   },
//   //                   child: Padding(
//   //                     padding: const EdgeInsets.all(12.0),
//   //                     child: Image.asset(
//   //                       "assets/images/close.png",
//   //                       width: Responsive.isMobile(context) ? 32 : 38,
//   //                     ),
//   //                   ),
//   //                 ),
//   //               ),
//   //             ],
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

// }
