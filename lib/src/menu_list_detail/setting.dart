import 'dart:developer';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/menu_list_detail/menu_list_text_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:volume_controller/volume_controller.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final volumecontroller = VolumeController();
  double? volume;

  control() async {
    var volume = await volumecontroller.getVolume();
    log(volume.toString());
  }

  @override
  void dispose() {
    volumecontroller.removeListener();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    VolumeController().listener((systemVolume) {
      setState(() => volume = systemVolume);
    });
    VolumeController().getVolume().then((value) {
      setState(() {
        volume = double.parse(value.toStringAsFixed(0));
      });
      log(volume.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MenuListTextWidget(
      title: 'Setting',
      text: 'text',
      widgetStatus: true,
      widget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 300,
                  height: 200,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'ဂီတသံ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Icon(
                        Icons.music_note,
                        size: 50,
                        color: Colors.amber,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BouncingWidget(
                            duration: const Duration(milliseconds: 400),
                            scaleFactor: 1.5,
                            onPressed: () {
                              setState(() {
                                volume = volume! - 0.1;
                              });
                              VolumeController().setVolume(volume!);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/button_small.png"),
                                      fit: BoxFit.fill)),
                              child: const Text(
                                "-",
                                style: TextStyle(
                                    height: 1.2,
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          LinearPercentIndicator(
                            width: 180,
                            animation: true,
                            animateFromLastPercent: true,
                            lineHeight: 34,
                            animationDuration: 800,
                            percent: volume!,
                            center: Text(
                              "${(volume! * 100).toStringAsFixed(0)}%",
                              style: TextStyle(
                                  color: (volume! * 100 > 50)
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 15),
                            ),
                            barRadius: const Radius.circular(4),
                            progressColor:
                                const Color.fromARGB(255, 173, 201, 38),
                            backgroundColor:
                                const Color.fromARGB(255, 167, 114, 74),
                          ),
                          const SizedBox(width: 10),
                          BouncingWidget(
                            duration: const Duration(milliseconds: 400),
                            scaleFactor: 1.5,
                            onPressed: () {
                              setState(() {
                                volume = volume! + 0.1;
                              });
                              VolumeController().setVolume(volume!);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/button_small.png"),
                                      fit: BoxFit.fill)),
                              child: const Text(
                                "+",
                                style: TextStyle(
                                    height: 1.2,
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 200,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'အသံ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          log(VolumeController().getVolume().toString());
                          // VolumeController().muteVolume();
                        },
                        child: const Icon(
                          Icons.volume_down,
                          size: 50,
                          color: Colors.amber,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BouncingWidget(
                            duration: const Duration(milliseconds: 400),
                            scaleFactor: 1.5,
                            onPressed: () {
                              setState(() {
                                volume = volume! - 0.1;
                              });
                              VolumeController().setVolume(volume!);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/button_small.png"),
                                      fit: BoxFit.fill)),
                              child: const Text(
                                "-",
                                style: TextStyle(
                                    height: 1.2,
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          LinearPercentIndicator(
                            width: 180,
                            animation: true,
                            animateFromLastPercent: true,
                            lineHeight: 34,
                            animationDuration: 800,
                            percent: volume!,
                            center: Text(
                              "${(volume! * 100).toStringAsFixed(0)}%",
                              style: TextStyle(
                                  color: (volume! * 100 > 50)
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 15),
                            ),
                            barRadius: const Radius.circular(4),
                            progressColor:
                                const Color.fromARGB(255, 173, 201, 38),
                            backgroundColor:
                                const Color.fromARGB(255, 167, 114, 74),
                          ),
                          const SizedBox(width: 10),
                          BouncingWidget(
                            duration: const Duration(milliseconds: 400),
                            scaleFactor: 1.5,
                            onPressed: () {
                              setState(() {
                                volume = volume! + 0.1;
                              });
                              VolumeController().setVolume(volume!);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/button_small.png"),
                                      fit: BoxFit.fill)),
                              child: const Text(
                                "+",
                                style: TextStyle(
                                    height: 1.2,
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
