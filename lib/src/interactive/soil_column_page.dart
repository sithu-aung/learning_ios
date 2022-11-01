import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:math' as math;
import 'package:learning/src/audio_controller/audio_controller.dart';
import 'package:learning/src/learning_page/learning_widget/chapter1_textPopUpWidget.dart';
import 'package:learning/src/responsive.dart';
import 'package:learning/tool_widgets.dart';
import 'package:just_audio/just_audio.dart' as justAudio;
import 'package:rxdart/rxdart.dart';

class SoilColumnPage extends StatefulWidget {
  const SoilColumnPage({
    super.key,
    required this.hearderTitle,
    required this.titleOne,
    required this.titleTwo,
    required this.titleThree,
    required this.titleFour,
    required this.titleFive,
    required this.titleImageOne,
    required this.titleImageTwo,
    required this.titleImageThree,
    required this.titleImageFour,
    required this.titleImageFive,
    required this.imageOne,
    required this.textOne,
    required this.imageTwo,
    required this.textTwo,
    required this.imageThree,
    required this.textThree,
    required this.imageFour,
    required this.textFour,
    required this.imageFive,
    required this.textFive,
    required this.textList,
    required this.arrowLeftOnTap,
    required this.arrowRightOnTap,
  });

  final String? hearderTitle;
  final String? titleOne;
  final String? titleTwo;
  final String? titleThree;
  final String? titleFour;
  final String? titleFive;

  final String? titleImageOne;
  final String? titleImageTwo;
  final String? titleImageThree;
  final String? titleImageFour;
  final String? titleImageFive;

  final String? imageOne;
  final String? textOne;

  final String? imageTwo;
  final String? textTwo;

  final String? imageThree;
  final String? textThree;

  final String? imageFour;
  final String? textFour;

  final String? imageFive;
  final String? textFive;

  final String? textList;

  final Function? arrowRightOnTap;
  final Function? arrowLeftOnTap;

  @override
  State<SoilColumnPage> createState() => _SoilColumnPageState();
}

class _SoilColumnPageState extends State<SoilColumnPage> {
  String imageChoosen = "assets/images/l1.png";
  String title = "မြေဆီလွှာကို ဖြစ်ပေါ်စေသည့် အကြောင်းအရင်း ";
  bool startPlay = false;
  late Stream<DurationState> _durationState;
  final player = justAudio.AudioPlayer();

  bool startPlay1 = false;
  late Stream<DurationState> _durationState1;
  final player1 = justAudio.AudioPlayer();

  bool startPlay2 = false;
  late Stream<DurationState> _durationState2;
  final player2 = justAudio.AudioPlayer();

  bool startPlay3 = false;
  late Stream<DurationState> _durationState3;
  final player3 = justAudio.AudioPlayer();

  bool startPlay4 = false;
  late Stream<DurationState> _durationState4;
  final player4 = justAudio.AudioPlayer();

  bool startPlay5 = false;
  late Stream<DurationState> _durationState5;
  final player5 = justAudio.AudioPlayer();
  String txt =
      "မြေဆီလွှာကို ဖြစ်ပေါ်စေတဲ့ အကြောင်းအရင်း (၅)ခုမှာ - \n(က)  ရာသီဥတု၊\n(ခ)   သက်ရှိအကြောင်းအရာများ၊\n(ဂ)   မြေမျက်နှာသွင်ပြင်၊ \n(ဃ)  မိခင်အစိုင်အခဲ၊ \n(င)    အချိန်။";
  bool popUpVisible = false;
  bool popUpPortraitVisible = false;

  String txtChoosen =
      "(က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။ ";

  bool textpopUpVisible = false;

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    prepare();

    _durationState = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
        player.positionStream,
        player.playbackEventStream,
        (position, playbackEvent) => DurationState(
              progress: position,
              buffered: playbackEvent.bufferedPosition,
              total: playbackEvent.duration,
            ));
    _durationState1 = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
        player1.positionStream,
        player1.playbackEventStream,
        (position, playbackEvent) => DurationState(
              progress: position,
              buffered: playbackEvent.bufferedPosition,
              total: playbackEvent.duration,
            ));

    _durationState2 = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
        player2.positionStream,
        player2.playbackEventStream,
        (position, playbackEvent) => DurationState(
              progress: position,
              buffered: playbackEvent.bufferedPosition,
              total: playbackEvent.duration,
            ));

    _durationState3 = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
        player3.positionStream,
        player3.playbackEventStream,
        (position, playbackEvent) => DurationState(
              progress: position,
              buffered: playbackEvent.bufferedPosition,
              total: playbackEvent.duration,
            ));

    _durationState4 = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
        player4.positionStream,
        player4.playbackEventStream,
        (position, playbackEvent) => DurationState(
              progress: position,
              buffered: playbackEvent.bufferedPosition,
              total: playbackEvent.duration,
            ));

    _durationState5 = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
        player5.positionStream,
        player5.playbackEventStream,
        (position, playbackEvent) => DurationState(
              progress: position,
              buffered: playbackEvent.bufferedPosition,
              total: playbackEvent.duration,
            ));
  }

  prepare() async {
    await player.setFilePath("${widget.textList!}/A1S1.1.2.2_Inter1.mp3",
        preload: true);
    await player1.setFilePath("${widget.textList!}/A1S1.1.2.2_Inter1.1.mp3",
        preload: true);
    await player2.setFilePath("${widget.textList!}/A1S1.1.2.2_Inter1.2.mp3",
        preload: true);
    await player3.setFilePath("${widget.textList!}/A1S1.1.2.2_Inter1.3.mp3",
        preload: true);
    await player4.setFilePath("${widget.textList!}/A1S1.1.2.2_Inter1.4.mp3",
        preload: true);
    await player5.setFilePath("${widget.textList!}/A1S1.1.2.2_Inter1.5.mp3",
        preload: true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);
    return MediaQuery(
      data: mqData,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: shadowDecorationWithBorderColor(
                  const Color.fromARGB(200, 113, 101, 45),
                  const Color.fromARGB(200, 113, 101, 45),
                  12),
              margin: const EdgeInsets.only(top: 60),
              width: MediaQuery.of(context).size.width * 0.73,
              height: MediaQuery.of(context).size.height * 0.54,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () async {
                        setState(() {
                          startPlay = true;
                        });
                        await player.setFilePath(
                            "${widget.textList!}/A1S1.1.2.2_Inter1.mp3",
                            preload: true);

                        await playSound();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8, right: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            playButton(),
                            SizedBox(
                              width: 60,
                              child: _progressBar(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      margin: const EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Center(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 1.1,
                              fontSize: Responsive.isMobile(context) ? 12 : 12,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 84,
                    left: 40,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          popUpVisible = true;
                          imageChoosen = widget.imageOne ??
                              '...'; //"assets/images/s2.png";
                          txtChoosen = widget.textOne ?? '...';
                          // "(ခ) သက်ရှိအကြောင်းအရာများ။ အပင်များ၊ တိရစ္ဆာန်များ၊ မှိုများ၊ ဘက်တီးရီးယားများနှင့် အဏုဇီဝသက်ရှိများ ";
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: size.width * .03),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  widget.titleImageOne ??
                                      '...', //  "assets/images/m2.png",
                                  height: size.height * 0.11,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                    widget.titleOne ??
                                        '...', //'သက်ရှိအကြောင်းအရာများ',
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: Transform.rotate(
                                angle: 270 * math.pi / 180,
                                child: Image.asset(
                                  'assets/images/arrow_down.png',
                                  height: size.height * 0.11,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 150,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          popUpVisible = true;
                          imageChoosen = widget.imageTwo ??
                              '...'; //"assets/images/s2.png";
                          txtChoosen = widget.textTwo ?? '...';
                          // "(ခ) သက်ရှိအကြောင်းအရာများ။ အပင်များ၊ တိရစ္ဆာန်များ၊ မှိုများ၊ ဘက်တီးရီးယားများနှင့် အဏုဇီဝသက်ရှိများ ";
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: size.width * .03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  widget.titleImageTwo ??
                                      '...', //  "assets/images/m2.png",
                                  height: size.height * 0.11,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                    widget.titleTwo ??
                                        '...', //'သက်ရှိအကြောင်းအရာများ',
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 40),
                              child: Transform.rotate(
                                angle: 150,
                                child: Image.asset(
                                  'assets/images/arrow_down.png',
                                  height: size.height * 0.11,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 50,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          popUpVisible = true;
                          imageChoosen = widget.imageThree ??
                              '...'; //"assets/images/s3.png";
                          txtChoosen = widget.textThree ?? '...';
                          // "(ဂ) မြေမျက်နှာသွင်ပြင်။ တောင်စောင်းအနေအထား၊ ရှုထောင့်၊ ပုံသဏ္ဍာန်";
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: size.width * .03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 30),
                              child: Row(
                                children: [
                                  Image.asset(
                                    widget.titleImageThree ??
                                        '...', //  "assets/images/m3.png",
                                    height: size.height * 0.11,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                      widget.titleThree ??
                                          '...', //'မြေမျက်နှာသွင်ပြင်',
                                      style:
                                          const TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                            Transform.rotate(
                              angle: 70,
                              child: Image.asset(
                                'assets/images/arrow_down.png',
                                height: size.height * 0.11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 3,
                    left: 150,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          popUpVisible = true;
                          imageChoosen = widget.imageFour ??
                              '...'; //"assets/images/s4.png";
                          txtChoosen = widget.textFour ?? '...';
                          // "(ဃ) မိခင်အစိုင်အခဲ။ ကျောက်ဆောင်၊ နုန်းမြေ (alluvium) (လေ သို့မဟုတ် ရေ အနယ်ကျရာမှ ဖြစ်ပေါ်လာသော အရာ)";
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: size.width * .03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 30),
                              child: Transform.rotate(
                                angle: 10,
                                child: Image.asset(
                                  'assets/images/arrow_down.png',
                                  height: size.height * 0.11,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  widget.titleImageFour ??
                                      '...', //  "assets/images/m4.png",
                                  height: size.height * 0.11,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                    widget.titleFour ??
                                        '...', //'မိခင်အစိုင်အခဲ။',
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 120,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          popUpVisible = true;
                          imageChoosen = widget.imageFive ??
                              '...'; //"assets/images/s5.png";
                          txtChoosen = widget.textFive ?? '...';
                          //  "(င) အချိန်။ မြေဆီလွှာစတင်ဖြစ်ပေါ်တဲ့ အချိန်ကစပြီး ကြာချိန်";
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: size.width * .03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: size.width * .12),
                              child: Transform.rotate(
                                angle: 40,
                                child: Image.asset(
                                  'assets/images/arrow_down.png',
                                  height: size.height * 0.11,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  widget.titleImageFive ??
                                      '...', // "assets/images/m5.png",
                                  height: size.height * 0.11,
                                ),
                                const SizedBox(width: 5),
                                Text(widget.titleFive ?? '...', //' အချိန်',
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: MediaQuery.of(context).size.height * 0.26,
                width: MediaQuery.of(context).size.width * 0.74,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                    bottom: 8),
                padding: const EdgeInsets.only(
                    left: 24, top: 8, bottom: 8, right: 8),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/paper_back.png'),
                      fit: BoxFit.fill),
                ),
                child: Stack(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          textpopUpVisible = true;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          "assets/images/expand.png",
                          width: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 36),
                      child: SingleChildScrollView(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text(
                          txt,
                          style: TextStyle(
                              height: 1.7,
                              color: Colors.black,
                              fontSize: Responsive.isMobile(context) ? 16 : 19),
                        ),
                      )),
                    ),
                  ],
                )),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Visibility(
              visible: textpopUpVisible,
              child: Chapter1TextPopUpWidget(
                text: txt,
                scrollController: scrollController,
                closeOnTap: () {
                  setState(() {
                    textpopUpVisible = false;
                  });
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Visibility(visible: popUpVisible, child: popUpWidget()),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Visibility(
                visible: popUpPortraitVisible, child: popUpWidgetPortrait()),
          ),
        ],
      ),
    );
  }

  StreamBuilder<PlayerState> playButton() {
    return StreamBuilder<PlayerState>(
      stream: player.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if ((processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) &&
            !startPlay) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 24.0,
            height: 24.0,
            child: const CircularProgressIndicator(),
          );
        } else if (playing != true) {
          return IconButton(
            icon: const Icon(Icons.play_arrow),
            iconSize: 32.0,
            onPressed: () async {
              setState(() {
                startPlay = true;
              });
              player.play();
            },
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            icon: const Icon(Icons.pause),
            iconSize: 32.0,
            onPressed: player.pause,
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.replay),
            iconSize: 32.0,
            onPressed: () => player.seek(Duration.zero),
          );
        }
      },
    );
  }

  StreamBuilder<DurationState> _progressBar() {
    return StreamBuilder<DurationState>(
      stream: _durationState,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progress: progress,
          buffered: buffered,
          total: total,
          onSeek: (duration) {
            player.seek(duration);
          },
          onDragUpdate: (details) {
            debugPrint('${details.timeStamp}, ${details.localPosition}');
          },
          timeLabelLocation: TimeLabelLocation.none,
          barHeight: 6,
          baseBarColor: Colors.white,
          thumbRadius: 2,
        );
      },
    );
  }

  Future<void> playSound() async {
    if (player.playing) {
      player.stop();
    }
    if (player1.playing) {
      player1.stop();
    }
    if (player2.playing) {
      player2.stop();
    }
    if (player3.playing) {
      player3.stop();
    }
    if (player4.playing) {
      player4.stop();
    }
    if (player5.playing) {
      player5.stop();
    }

    await player.play();
  }

  StreamBuilder<PlayerState> playButton1() {
    return StreamBuilder<PlayerState>(
      stream: player1.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if ((processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) &&
            !startPlay1) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 24.0,
            height: 24.0,
            child: const CircularProgressIndicator(),
          );
        } else if (playing != true) {
          return IconButton(
            icon: const Icon(Icons.play_arrow),
            iconSize: 32.0,
            onPressed: () async {
              setState(() {
                startPlay1 = true;
              });
              player1.play();
            },
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            icon: const Icon(Icons.pause),
            iconSize: 32.0,
            onPressed: player1.pause,
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.replay),
            iconSize: 32.0,
            onPressed: () => player1.seek(Duration.zero),
          );
        }
      },
    );
  }

  StreamBuilder<DurationState> _progressBar1() {
    return StreamBuilder<DurationState>(
      stream: _durationState1,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progress: progress,
          buffered: buffered,
          total: total,
          onSeek: (duration) {
            player1.seek(duration);
          },
          onDragUpdate: (details) {
            debugPrint('${details.timeStamp}, ${details.localPosition}');
          },
          timeLabelLocation: TimeLabelLocation.none,
          barHeight: 6,
          baseBarColor: Colors.white,
          thumbRadius: 2,
        );
      },
    );
  }

  Future<void> playSound1() async {
    if (player.playing) {
      player.stop();
    }
    if (player1.playing) {
      player1.stop();
    }
    if (player2.playing) {
      player2.stop();
    }
    if (player3.playing) {
      player3.stop();
    }
    if (player4.playing) {
      player4.stop();
    }
    if (player5.playing) {
      player5.stop();
    }

    await player1.play();
  }

  StreamBuilder<PlayerState> playButton2() {
    return StreamBuilder<PlayerState>(
      stream: player2.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if ((processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) &&
            !startPlay2) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 24.0,
            height: 24.0,
            child: const CircularProgressIndicator(),
          );
        } else if (playing != true) {
          return IconButton(
            icon: const Icon(Icons.play_arrow),
            iconSize: 32.0,
            onPressed: () async {
              setState(() {
                startPlay2 = true;
              });
              player2.play();
            },
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            icon: const Icon(Icons.pause),
            iconSize: 32.0,
            onPressed: player2.pause,
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.replay),
            iconSize: 32.0,
            onPressed: () => player2.seek(Duration.zero),
          );
        }
      },
    );
  }

  StreamBuilder<DurationState> _progressBar2() {
    return StreamBuilder<DurationState>(
      stream: _durationState2,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progress: progress,
          buffered: buffered,
          total: total,
          onSeek: (duration) {
            player2.seek(duration);
          },
          onDragUpdate: (details) {
            debugPrint('${details.timeStamp}, ${details.localPosition}');
          },
          timeLabelLocation: TimeLabelLocation.none,
          barHeight: 6,
          baseBarColor: Colors.white,
          thumbRadius: 2,
        );
      },
    );
  }

  Future<void> playSound2() async {
    if (player.playing) {
      player.stop();
    }
    if (player1.playing) {
      player1.stop();
    }
    if (player2.playing) {
      player2.stop();
    }
    if (player3.playing) {
      player3.stop();
    }
    if (player4.playing) {
      player4.stop();
    }
    if (player5.playing) {
      player5.stop();
    }

    await player2.play();
  }

  StreamBuilder<PlayerState> playButton3() {
    return StreamBuilder<PlayerState>(
      stream: player3.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if ((processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) &&
            !startPlay3) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 24.0,
            height: 24.0,
            child: const CircularProgressIndicator(),
          );
        } else if (playing != true) {
          return IconButton(
            icon: const Icon(Icons.play_arrow),
            iconSize: 32.0,
            onPressed: () async {
              setState(() {
                startPlay3 = true;
              });
              player3.play();
            },
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            icon: const Icon(Icons.pause),
            iconSize: 32.0,
            onPressed: player3.pause,
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.replay),
            iconSize: 32.0,
            onPressed: () => player3.seek(Duration.zero),
          );
        }
      },
    );
  }

  StreamBuilder<DurationState> _progressBar3() {
    return StreamBuilder<DurationState>(
      stream: _durationState3,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progress: progress,
          buffered: buffered,
          total: total,
          onSeek: (duration) {
            player3.seek(duration);
          },
          onDragUpdate: (details) {
            debugPrint('${details.timeStamp}, ${details.localPosition}');
          },
          timeLabelLocation: TimeLabelLocation.none,
          barHeight: 6,
          baseBarColor: Colors.white,
          thumbRadius: 2,
        );
      },
    );
  }

  Future<void> playSound3() async {
    if (player.playing) {
      player.stop();
    }
    if (player1.playing) {
      player1.stop();
    }
    if (player2.playing) {
      player2.stop();
    }
    if (player3.playing) {
      player3.stop();
    }
    if (player4.playing) {
      player4.stop();
    }
    if (player5.playing) {
      player5.stop();
    }

    await player3.play();
  }

  StreamBuilder<PlayerState> playButton4() {
    return StreamBuilder<PlayerState>(
      stream: player4.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if ((processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) &&
            !startPlay4) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 24.0,
            height: 24.0,
            child: const CircularProgressIndicator(),
          );
        } else if (playing != true) {
          return IconButton(
            icon: const Icon(Icons.play_arrow),
            iconSize: 32.0,
            onPressed: () async {
              setState(() {
                startPlay4 = true;
              });
              player4.play();
            },
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            icon: const Icon(Icons.pause),
            iconSize: 32.0,
            onPressed: player4.pause,
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.replay),
            iconSize: 32.0,
            onPressed: () => player4.seek(Duration.zero),
          );
        }
      },
    );
  }

  StreamBuilder<DurationState> _progressBar4() {
    return StreamBuilder<DurationState>(
      stream: _durationState4,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progress: progress,
          buffered: buffered,
          total: total,
          onSeek: (duration) {
            player4.seek(duration);
          },
          onDragUpdate: (details) {
            debugPrint('${details.timeStamp}, ${details.localPosition}');
          },
          timeLabelLocation: TimeLabelLocation.none,
          barHeight: 6,
          baseBarColor: Colors.white,
          thumbRadius: 2,
        );
      },
    );
  }

  Future<void> playSound4() async {
    if (player.playing) {
      player.stop();
    }
    if (player1.playing) {
      player1.stop();
    }
    if (player2.playing) {
      player2.stop();
    }
    if (player3.playing) {
      player3.stop();
    }
    if (player4.playing) {
      player4.stop();
    }
    if (player5.playing) {
      player5.stop();
    }

    await player4.play();
  }

  StreamBuilder<PlayerState> playButton5() {
    return StreamBuilder<PlayerState>(
      stream: player5.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if ((processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) &&
            !startPlay5) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 24.0,
            height: 24.0,
            child: const CircularProgressIndicator(),
          );
        } else if (playing != true) {
          return IconButton(
            icon: const Icon(Icons.play_arrow),
            iconSize: 32.0,
            onPressed: () async {
              setState(() {
                startPlay5 = true;
              });
              player5.play();
            },
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            icon: const Icon(Icons.pause),
            iconSize: 32.0,
            onPressed: player1.pause,
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.replay),
            iconSize: 32.0,
            onPressed: () => player5.seek(Duration.zero),
          );
        }
      },
    );
  }

  StreamBuilder<DurationState> _progressBar5() {
    return StreamBuilder<DurationState>(
      stream: _durationState5,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progress: progress,
          buffered: buffered,
          total: total,
          onSeek: (duration) {
            player5.seek(duration);
          },
          onDragUpdate: (details) {
            debugPrint('${details.timeStamp}, ${details.localPosition}');
          },
          timeLabelLocation: TimeLabelLocation.none,
          barHeight: 6,
          baseBarColor: Colors.white,
          thumbRadius: 2,
        );
      },
    );
  }

  Future<void> playSound5() async {
    if (player.playing) {
      player.stop();
    }
    if (player1.playing) {
      player1.stop();
    }
    if (player2.playing) {
      player2.stop();
    }
    if (player3.playing) {
      player3.stop();
    }
    if (player4.playing) {
      player4.stop();
    }
    if (player5.playing) {
      player5.stop();
    }

    await player5.play();
  }

  Widget popUpWidget() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withOpacity(0.5),
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.74,
          margin: EdgeInsets.only(
              top: Responsive.isMobile(context)
                  ? 4
                  : MediaQuery.of(context).size.height * 0.15,
              bottom: Responsive.isMobile(context)
                  ? 8
                  : MediaQuery.of(context).size.height * 0.26),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/paper_medium_leafs.png'),
                fit: BoxFit.fill),
          ),
          // decoration: shadowDecorationWithBorderColor(
          //     const Color.fromARGB(255, 255, 216, 95), Colors.white, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12.0, right: 36, left: 20),
                        child: Center(
                          child: Image.asset(
                            imageChoosen,
                            //fit: BoxFit.fill,
                            // width: MediaQuery.of(context).size.width * 0.74,
                            height: MediaQuery.of(context).size.height * 0.63,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.1),
                        height: MediaQuery.of(context).size.height * 0.63,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () async {},
                            child: Container(
                              margin:
                                  const EdgeInsets.only(bottom: 8, right: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  imageChoosen == widget.imageOne
                                      ? playButton1()
                                      : imageChoosen == widget.imageTwo
                                          ? playButton2()
                                          : imageChoosen == widget.imageThree
                                              ? playButton3()
                                              : imageChoosen == widget.imageFour
                                                  ? playButton4()
                                                  : playButton5(),
                                  SizedBox(
                                    width: 60,
                                    child: imageChoosen == widget.imageOne
                                        ? _progressBar1()
                                        : imageChoosen == widget.imageTwo
                                            ? _progressBar2()
                                            : imageChoosen == widget.imageThree
                                                ? _progressBar3()
                                                : imageChoosen ==
                                                        widget.imageFour
                                                    ? _progressBar4()
                                                    : _progressBar5(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 70,
                    // margin: EdgeInsets.only(right: 50),
                    // alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          popUpVisible = false;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/close.png",
                          width: Responsive.isMobile(context) ? 32 : 38,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  padding: const EdgeInsets.only(
                      top: 12, left: 50, bottom: 40, right: 80),
                  child: SingleChildScrollView(
                    child: Text(
                      txtChoosen,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          height: 1.8, fontSize: 17, color: Colors.black),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget popUpWidgetPortrait() {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: MediaQuery.of(context).size.width * 0.74,
          margin: EdgeInsets.only(
              top: Responsive.isMobile(context)
                  ? 4
                  : MediaQuery.of(context).size.height * 0.15,
              bottom: Responsive.isMobile(context)
                  ? 8
                  : MediaQuery.of(context).size.height * 0.26),
          decoration: shadowDecorationWithBorderColor(
              const Color.fromARGB(255, 197, 231, 117), Colors.white, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, right: 36, left: 20),
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: Image.asset(
                      imageChoosen,
                      //fit: BoxFit.fill,
                      // width: MediaQuery.of(context).size.width * 0.74,
                      // height: MediaQuery.of(context).size.height * 0.9,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      padding:
                          const EdgeInsets.only(top: 12, bottom: 16, right: 20),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Text(
                            txtChoosen,
                            textAlign: TextAlign.left,
                            style: const TextStyle(height: 1.8, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            popUpPortraitVisible = false;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/close.png",
                            width: Responsive.isMobile(context) ? 32 : 38,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
