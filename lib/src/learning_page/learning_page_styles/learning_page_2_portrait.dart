import 'dart:developer';
import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learning/src/audio_controller/audio_controller.dart';
import 'package:learning/src/learning_page/learning_widget/chapter1_image_pop_up.dart';
import 'package:learning/src/responsive.dart';
import 'package:photo_view/photo_view.dart';
import 'package:just_audio/just_audio.dart' as justAudio;
import 'package:rxdart/rxdart.dart';
import '../../../tool_widgets.dart';

class LearningPage2Portrait extends StatefulWidget {
  const LearningPage2Portrait({
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
  State<LearningPage2Portrait> createState() => _LearningPage2PortraitState();
}

class _LearningPage2PortraitState extends State<LearningPage2Portrait> {
  bool imagepopUpVisible = false;
  bool startPlay = false;
  late Stream<DurationState> _durationState;
  //final player = justAudio.AudioPlayer();
  @override
  void initState() {
    super.initState();
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: shadowDecorationWithBorderColor(
                    const Color.fromARGB(200, 113, 101, 45),
                    const Color.fromARGB(200, 113, 101, 45),
                    12),
                margin: EdgeInsets.only(
                  top: 60,
                  left: MediaQuery.of(context).size.width * 0.09,
                ),
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.8,
                padding: const EdgeInsets.only(
                    right: 8, top: 8, bottom: 12, left: 12),
                child: Stack(
                  children: [
                    Center(
                      child: Image.file(
                        File(widget.imageChoose!),
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
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
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.4,
                margin: const EdgeInsets.only(
                  left: 12,
                  right: 20,
                  bottom: 8,
                  top: 68,
                ),
                padding: const EdgeInsets.only(
                    left: 24, top: 16, bottom: 8, right: 8),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/paper_back.png'),
                      fit: BoxFit.fill),
                ),
                child: Stack(
                  children: [
                    Scrollbar(
                      trackVisibility: true,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 70),
                          child: Text(
                            widget.popUpText ?? '...',
                            style: TextStyle(
                                height: 1.7,
                                color: Colors.black,
                                fontSize:
                                    Responsive.isMobile(context) ? 16 : 19),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () async {
                          setState(() {
                            startPlay = true;
                          });
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
                  ],
                ),
              ),
            ],
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
              ),
            ),
          ),
        ],
      ),
    );
  }

  prepare() async {
    log(widget.voiceUrl.toString());
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

    await widget.player.play();
  }

  Widget imagePopUpWidget() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: shadowDecorationWithBorderColor(
            const Color.fromARGB(180, 0, 0, 0),
            const Color.fromARGB(180, 113, 101, 45),
            12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.98,
                    child: PhotoView(
                      imageProvider: FileImage(File(widget.imageChoose!)),
                      backgroundDecoration:
                          const BoxDecoration(color: Colors.white),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        imagepopUpVisible = false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        "assets/images/close.png",
                        width: Responsive.isMobile(context) ? 32 : 38,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
