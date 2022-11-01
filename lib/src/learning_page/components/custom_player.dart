import 'dart:developer';
import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class CustomPlayer extends StatefulWidget {
  final String videoUrl;

  const CustomPlayer({
    required this.videoUrl,
  });

  @override
  _CustomPlayerState createState() => _CustomPlayerState(videoUrl);
}

class _CustomPlayerState extends State<CustomPlayer> {
  String videoUrl;

  _CustomPlayerState(this.videoUrl);

  BetterPlayerController? _betterPlayerController;

  @override
  void initState() {
    super.initState();
    log(videoUrl);
    _saveAssetVideoToFile();
  }

  Future _saveAssetVideoToFile() async {
    var content = await rootBundle.load(videoUrl);
    String dir = "";
    if (Platform.isAndroid) {
      await getExternalStorageDirectory().then((value) {
        dir = value!.path;
      });
    } else if (Platform.isIOS) {
      dir = (await getApplicationDocumentsDirectory()).absolute.path;
    }
    var file = File("${Directory(dir).path}/soil.mp4");
    file.writeAsBytesSync(content.buffer.asUint8List());
    log(file.path);
    Future.delayed(const Duration(seconds: 3), () async {
      BetterPlayerDataSource betterPlayerDataSource =
          BetterPlayerDataSource(BetterPlayerDataSourceType.file, file.path);
      _betterPlayerController = BetterPlayerController(
          const BetterPlayerConfiguration(
            controlsConfiguration: BetterPlayerControlsConfiguration(
                enableAudioTracks: false,
                enablePlaybackSpeed: false,
                enableSubtitles: false),
            fullScreenAspectRatio: 16 / 9,
            fit: BoxFit.fitHeight,
            expandToFill: false,
            deviceOrientationsAfterFullScreen: [
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
            ],
          ),
          betterPlayerDataSource: betterPlayerDataSource);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_betterPlayerController != null) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer(
          controller: _betterPlayerController!,
        ),
      );
    } else {
      return Container();
    }
  }
}
