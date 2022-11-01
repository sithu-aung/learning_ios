import 'dart:developer';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learning/src/audio_controller/audio_controller.dart';
import 'package:learning/src/responsive.dart';
import 'package:just_audio/just_audio.dart' as justAudio;
import 'package:rxdart/rxdart.dart';

class LearningPage4TextOnly extends StatefulWidget {
  const LearningPage4TextOnly({
    Key? key,
    required this.popUpText,
    required this.imageChoose,
    required this.backButton,
    required this.voiceUrl,
    required this.player,
  }) : super(key: key);

  final String? popUpText;
  final String? imageChoose;

  final String? voiceUrl;

  final GestureTapCallback backButton;
  final justAudio.AudioPlayer player;
  @override
  State<LearningPage4TextOnly> createState() => _LearningPage4TextOnlyState();
}

class _LearningPage4TextOnlyState extends State<LearningPage4TextOnly> {
  bool imagepopUpVisible = false;
  bool startPlay = false;
  late Stream<DurationState>? _durationState;
  //final player = justAudio.AudioPlayer();
  @override
  void initState() {
    super.initState();
    prepare();
    log('hi this is text only');
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
    if (widget.player.playing) {
      widget.player.stop();
    }
    _durationState = null;

    log('kill here');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    log('deactivate');
  }

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);

    return MediaQuery(
      data: mqDataNew,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.8,
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1,
          right: 20,
          bottom: 0,
          top: 68,
        ),
        padding: const EdgeInsets.only(left: 24, top: 24, bottom: 8, right: 8),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/papersmall.png'),
              fit: BoxFit.fill),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12, bottom: 36),
              child: Scrollbar(
                trackVisibility: true,
                thumbVisibility: true,
                child: SingleChildScrollView(
                    child: Text(
                  widget.popUpText ?? '...',
                  style: TextStyle(
                      height: 1.7,
                      color: Colors.black,
                      fontSize: Responsive.isMobile(context) ? 16 : 19),
                )),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Align(
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
                    margin: const EdgeInsets.only(bottom: 2, right: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        playButton(),
                        SizedBox(
                          width: 60,
                          child: progressBar(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
            startPlay) {
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
    //await player.setFilePath(widget.voiceUrl, preload: true);

    await widget.player.play();
  }

  Widget textPopUpWidget() {
    return Container();
  }

  Widget imagePopUpWidget() {
    return Container();
  }
}
