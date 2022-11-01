import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LearningPage6YoutubeVideo extends StatefulWidget {
  const LearningPage6YoutubeVideo({
    Key? key,
    required this.hearderTitle,
    required this.videoUrl,
  }) : super(key: key);

  final String? hearderTitle;
  final String? videoUrl;

  @override
  State<LearningPage6YoutubeVideo> createState() =>
      _LearningPage6YoutubeVideoState();
}

class _LearningPage6YoutubeVideoState extends State<LearningPage6YoutubeVideo> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoUrl!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    // videoPlayerController.dispose();
    // chewieController.dispose();
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
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.08,
              bottom: MediaQuery.of(context).size.width * 0.03),
          child: AspectRatio(
            aspectRatio: 0.8,
            child: YoutubePlayer(
              aspectRatio: 16 / 9,
              controller: _controller!,
              showVideoProgressIndicator: true,
            ),
          ),
        ),
        // child: YoutubePlayerBuilder(
        //     player: YoutubePlayer(
        //       controller: _controller!,
        //     ),
        //     builder: (context, player) {
        //       return Column(
        //         children: [
        //           // some widgets
        //           player,
        //           //some other widgets
        //         ],
        //       );
        //     }),
      ),
    );
  }
}
