import 'dart:developer';
import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learning/src/audio_controller/audio_controller.dart';
import 'package:learning/src/learning_page/learning_widget/chapter1_image_pop_up.dart';
import 'package:learning/src/learning_page/learning_widget/chapter1_textPopUpWidget.dart';
import 'package:learning/src/responsive.dart';
import 'package:just_audio/just_audio.dart' as justAudio;
import 'package:learning/tool_widgets.dart';
import 'package:rxdart/rxdart.dart';

class LearningPage1Landscape extends StatefulWidget {
  const LearningPage1Landscape({
    Key? key,
    required this.popUpText,
    required this.imageChoose,
    required this.voiceUrl,
    required this.player,
  }) : super(key: key);

  final String? popUpText;
  final String? imageChoose;
  final justAudio.AudioPlayer player;
  final String? voiceUrl;

  @override
  State<LearningPage1Landscape> createState() => _LearningPage1LandscapeState();
}

class _LearningPage1LandscapeState extends State<LearningPage1Landscape> {
  bool textpopUpVisible = false;
  bool imagepopUpVisible = false;
  bool startPlay = false;
  late Stream<DurationState> _durationState;
  //final player = justAudio.AudioPlayer();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    log('landscapce');
    prepare();
    _durationState = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
        widget.player.positionStream,
        widget.player.playbackEventStream,
        (position, playbackEvent) => DurationState(
              progress: position,
              buffered: playbackEvent.bufferedPosition,
              total: playbackEvent.duration,
            ));
  }

  @override
  void dispose() {
    super.dispose();
    widget.player.stop();
  }

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);

    return MediaQuery(
      data: mqDataNew,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(right: 52),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () async {
                      setState(() {
                        startPlay = true;
                      });
                      await playSound();
                    },
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.3,
                            right: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [playButton()],
                            ),
                            SizedBox(
                              width: 60,
                              child: progressBar(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: shadowDecorationWithBorderColor(
                        const Color.fromARGB(200, 113, 101, 45),
                        const Color.fromARGB(180, 113, 101, 45),
                        12),
                    margin: const EdgeInsets.only(top: 60),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.54,
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        right: 12,
                        top: 12,
                        bottom: 12),
                    child: Stack(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              imagepopUpVisible = true;
                            });
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              "assets/images/expand.png",
                              width: 28,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Image.file(
                          File(widget.imageChoose!),
                          width: MediaQuery.of(context).size.width * 0.32,
                        ),
                      ],
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
                          widget.popUpText ?? '...',
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
                text: widget.popUpText ?? '...',
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
            child: Visibility(
                visible: imagepopUpVisible,
                child: Chapter1ImagePopUp(
                  photoToView: widget.imageChoose,
                  closeOnTap: () {
                    setState(() {
                      imagepopUpVisible = false;
                    });
                  },
                )),
          ),
        ],
      ),
    );
  }

  prepare() async {
    await widget.player.setFilePath(widget.voiceUrl!, preload: true);
  }

  StreamBuilder<PlayerState> playButton() {
    return StreamBuilder<PlayerState>(
      stream: widget.player.playerStateStream,
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
              widget.player.play();
            },
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            icon: const Icon(Icons.pause),
            iconSize: 32.0,
            onPressed: widget.player.pause,
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.replay),
            iconSize: 32.0,
            onPressed: () => widget.player.seek(Duration.zero),
          );
        }
      },
    );
  }

  StreamBuilder<DurationState> progressBar() {
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
            widget.player.seek(duration);
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
    if (widget.player.playing) {
      widget.player.stop();
    }
    //await player.setFilePath(widget.voiceUrl!, preload: true);

    await widget.player.play();
  }

  Widget textPopUpWidget() {
    return Container();
  }

  Widget imagePopUpWidget() {
    return Container();
  }
}
