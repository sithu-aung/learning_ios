import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';

class LearningPage3Video extends StatefulWidget {
  const LearningPage3Video({
    Key? key,
    required this.hearderTitle,
    required this.videoUrl,
    required this.videoPlayerController,
    required this.chewieController,
  }) : super(key: key);

  final String? hearderTitle;
  final String? videoUrl;
  final VideoPlayerController videoPlayerController;
  final ChewieController chewieController;
  @override
  State<LearningPage3Video> createState() => _LearningPage3VideoState();
}

class _LearningPage3VideoState extends State<LearningPage3Video> {
  // late VideoPlayerController videoPlayerController;

  // late ChewieController chewieController;

  Chewie? playerWidget;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playerWidget = Chewie(
      controller: widget.chewieController,
    );
  }
  // @override
  // void initState() {
  //   videoPlayerController = VideoPlayerController.asset(widget.videoUrl!);
  //   startVideo();

  //   super.initState();
  // }

  // startVideo() async {
  //   await videoPlayerController.initialize();
  //   setState(() {
  //     print(videoPlayerController.value.aspectRatio);

  //     chewieController = ChewieController(
  //         videoPlayerController: videoPlayerController,
  //         aspectRatio: videoPlayerController.value.aspectRatio,
  //         autoPlay: false,
  //         looping: false,
  //         allowFullScreen: true,
  //         deviceOrientationsAfterFullScreen: [
  //           DeviceOrientation.landscapeLeft,
  //           DeviceOrientation.landscapeRight,
  //         ]);
  //     playerWidget = Chewie(
  //       controller: chewieController,
  //     );
  //   });
  // }

  @override
  void didUpdateWidget(covariant LearningPage3Video oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    log('updated');
  }

  // @override
  // void dispose() {
  //   videoPlayerController.dispose();
  //   chewieController.dispose();
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.landscapeLeft,
  //     DeviceOrientation.landscapeRight,
  //   ]);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);

    return MediaQuery(
      data: mqDataNew,
      child: Align(
        alignment: Alignment.center,
        child: playerWidget != null
            ? Container(
                width: MediaQuery.of(context).size.width * 0.5,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.08,
                    bottom: MediaQuery.of(context).size.width * 0.03),
                child: AspectRatio(aspectRatio: 0.8, child: playerWidget),
              )
            : Container(),
      ),
    );
  }
}
