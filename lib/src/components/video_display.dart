import 'package:flutter/material.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_header.dart';
import 'package:video_player/video_player.dart';

import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';

class VideoDisplay extends StatefulWidget {
  const VideoDisplay({
    Key? key,
    required this.hearderTitle,
    required this.videoUrl,
  }) : super(key: key);

  final String? hearderTitle;
  final String? videoUrl;

  @override
  State<VideoDisplay> createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  late VideoPlayerController videoPlayerController;

  late ChewieController chewieController;

  Chewie? playerWidget;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.asset(widget.videoUrl!);
    startVideo();

    super.initState();
  }

  startVideo() async {
    await videoPlayerController.initialize();
    setState(() {
      print(videoPlayerController.value.aspectRatio);
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
      playerWidget = Chewie(
        controller: chewieController,
      );
    });
  }

  @override
  void dispose() {
     videoPlayerController.dispose();
    chewieController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);

    return MediaQuery(
      data: mqDataNew,
      child: Scaffold(
        body: Stack(
          children: [
            BackgroundPage(
              backImage: "assets/images/agre_back.jpg",
            ),
            SessionHeaderWithoutProgress(
              title: widget.hearderTitle,
              backButton: () {
                Navigator.pop(context);
              },
            ),
            Align(
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
          ],
        ),
      ),
    );
  }
}
