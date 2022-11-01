import 'dart:developer';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learning/data/data/module3_string.dart';
import 'package:learning/src/learning_page/learning_page_styles/learning_page_1_landscape.dart';
import 'package:learning/src/learning_page/learning_page_styles/learning_page_2_portrait.dart';
import 'package:learning/src/learning_page/learning_page_styles/learning_page_4_text_only.dart';
import 'package:learning/src/learning_page/learning_page_styles/learning_page_5_image_only.dart';

class ChapterModule3 extends StatefulWidget {
  const ChapterModule3({
    super.key,
    required this.dirPath,
    required this.moduleIndex,
    required this.chapterIndex,
    required this.pageIndex,
    required this.step,
  });
  final int moduleIndex;
  final int chapterIndex;
  final int pageIndex;
  final int step;
  final String dirPath;

  @override
  State<ChapterModule3> createState() => _ChapterModule3State();
}

class _ChapterModule3State extends State<ChapterModule3> {
  final AudioPlayer player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    log("Step ${widget.step}");
    if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 0 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
              popUpText: module3TextList[0],
              imageChoose: "${widget.dirPath}/A3P3.1.1.1.jpg",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                  popUpText: module3TextList[1],
                  imageChoose: "${widget.dirPath}/A3P3.1.1.2.png",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '${widget.dirPath}/A1S1.1.3.3.mp3',
                      popUpText: module3TextList[2],
                      imageChoose: "${widget.dirPath}/A3P3.1.1.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '${widget.dirPath}/A1S1.1.3.4.mp3',
                          popUpText: module3TextList[3],
                          imageChoose: "${widget.dirPath}/A3P3.1.1.4.png",
                        )
                      : widget.step == 5
                          ? LearningPage4TextOnly(
                              player: player,
                              backButton: () {},
                              voiceUrl: '${widget.dirPath}/A1S1.1.3.5.mp3',
                              popUpText: module3TextList[4],
                              imageChoose: "${widget.dirPath}/A3P3.1.1.5.png",
                            )
                          : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 0 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
              popUpText: module3TextList[5],
              imageChoose: "${widget.dirPath}/A3P3.1.2.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                  popUpText: module3TextList[6],
                  imageChoose: "${widget.dirPath}/A3P3.1.2.2.png",
                )
              : widget.step == 3
                  ? LearningPage5ImageOnly(
                      hearderTitle: '',
                      arrowLeftOnTap: () {},
                      arrowRightOnTap: () {},
                      imageChoose: "${widget.dirPath}/A3P3.1.2.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage5ImageOnly(
                          hearderTitle: '',
                          arrowLeftOnTap: () {},
                          arrowRightOnTap: () {},
                          imageChoose: "${widget.dirPath}/A3P3.1.2.4.png",
                        )
                      : widget.step == 5
                          ? LearningPage2Portrait(
                              player: player,
                              voiceUrl: '${widget.dirPath}/A1S1.1.3.5.mp3',
                              popUpText: module3TextList[9],
                              imageChoose: "${widget.dirPath}/A3P3.1.2.5.png",
                            )
                          : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 1 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
              popUpText: module3TextList[10],
              imageChoose: "${widget.dirPath}/A3P3.2.1.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                  popUpText: module3TextList[11],
                  imageChoose: "${widget.dirPath}/A3P3.2.1.2.png",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                      popUpText: module3TextList[12],
                      imageChoose: "${widget.dirPath}/A3P3.2.1.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                          popUpText: module3TextList[13],
                          imageChoose: "${widget.dirPath}/A3P3.2.1.4.png",
                        )
                      : widget.step == 5
                          ? LearningPage1Landscape(
                              player: player,
                              voiceUrl: '${widget.dirPath}/A1S1.1.3.5.mp3',
                              popUpText: module3TextList[14],
                              imageChoose: "${widget.dirPath}/A3P3.1.2.5.png",
                            )
                          : widget.step == 6
                              ? LearningPage4TextOnly(
                                  player: player,
                                  backButton: () {},
                                  voiceUrl: '${widget.dirPath}/A1S1.1.3.5.mp3',
                                  popUpText: module3TextList[15],
                                  imageChoose: "",
                                )
                              : widget.step == 7
                                  ? LearningPage1Landscape(
                                      player: player,
                                      voiceUrl:
                                          '${widget.dirPath}/A1S1.1.3.5.mp3',
                                      popUpText: module3TextList[16],
                                      imageChoose:
                                          "${widget.dirPath}/A3P3.1.2.7.png",
                                    )
                                  : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 1 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
              popUpText: module3TextList[17],
              imageChoose: "${widget.dirPath}/A3P3.2.2.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                  popUpText: module3TextList[18],
                  imageChoose: "${widget.dirPath}/A3P3.2.2.2.png",
                )
              : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 2 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
              popUpText: module3TextList[19],
              imageChoose: "${widget.dirPath}/A3P3.3.1.1.GIF",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                  popUpText: module3TextList[20],
                  imageChoose: "${widget.dirPath}/A3P3.3.1.2.GIF",
                )
              : widget.step == 3
                  ? LearningPage4TextOnly(
                      player: player,
                      backButton: () {},
                      voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                      popUpText: module3TextList[21],
                      imageChoose: "${widget.dirPath}/A3P3.3.1.3.GIF",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                          popUpText: module3TextList[22],
                          imageChoose: "${widget.dirPath}/A3P3.3.1.4.png",
                        )
                      : widget.step == 5
                          ? LearningPage2Portrait(
                              player: player,
                              voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                              popUpText: module3TextList[23],
                              imageChoose: "${widget.dirPath}/A3P3.3.1.5.png",
                            )
                          : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 3 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
              popUpText: module3TextList[24],
              imageChoose: "${widget.dirPath}/A3P3.4.1.1.GIF",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                  popUpText: module3TextList[25],
                  imageChoose: "${widget.dirPath}/A3P3.4.1.2.GIF",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                      popUpText: module3TextList[26],
                      imageChoose: "${widget.dirPath}/A3P3.4.1.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                          popUpText: module3TextList[27],
                          imageChoose: "${widget.dirPath}/A3P3.4.1.4.png",
                        )
                      : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 3 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
              popUpText: module3TextList[28],
              imageChoose: "${widget.dirPath}/A3P3.4.2.1.GIF",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                  popUpText: module3TextList[29],
                  imageChoose: "${widget.dirPath}/A3P3.4.2.3.GIF",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                      popUpText: module3TextList[30],
                      imageChoose: "${widget.dirPath}/A3P3.4.2.5.png",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                          popUpText: module3TextList[31],
                          imageChoose: "${widget.dirPath}/A3P3.4.2.6.GIF",
                        )
                      : widget.step == 5
                          ? LearningPage1Landscape(
                              player: player,
                              voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                              popUpText: module3TextList[32],
                              imageChoose: "${widget.dirPath}/A3P3.4.2.6.GIF",
                            )
                          : widget.step == 6
                              ? LearningPage1Landscape(
                                  player: player,
                                  voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                                  popUpText: module3TextList[33],
                                  imageChoose:
                                      "${widget.dirPath}/A3P3.4.2.9.png",
                                )
                              : widget.step == 7
                                  ? LearningPage1Landscape(
                                      player: player,
                                      voiceUrl:
                                          '${widget.dirPath}/A1S1.1.3.2.mp3',
                                      popUpText: module3TextList[34],
                                      imageChoose:
                                          "${widget.dirPath}/A3P3.4.2.10.png",
                                    )
                                  : widget.step == 8
                                      ? LearningPage1Landscape(
                                          player: player,
                                          voiceUrl:
                                              '${widget.dirPath}/A1S1.1.3.2.mp3',
                                          popUpText: module3TextList[35],
                                          imageChoose:
                                              "${widget.dirPath}/A3P3.4.2.11.png",
                                        )
                                      : widget.step == 9
                                          ? LearningPage4TextOnly(
                                              player: player,
                                              backButton: () {},
                                              voiceUrl:
                                                  '${widget.dirPath}/A1S1.1.3.2.mp3',
                                              popUpText: module3TextList[36],
                                              imageChoose: "",
                                            )
                                          : widget.step == 10
                                              ? LearningPage1Landscape(
                                                  player: player,
                                                  voiceUrl:
                                                      '${widget.dirPath}/A1S1.1.3.2.mp3',
                                                  popUpText:
                                                      module3TextList[37],
                                                  imageChoose:
                                                      "${widget.dirPath}/A3P3.4.2.13.png",
                                                )
                                              : widget.step == 11
                                                  ? LearningPage1Landscape(
                                                      player: player,
                                                      voiceUrl:
                                                          '${widget.dirPath}/A1S1.1.3.2.mp3',
                                                      popUpText:
                                                          module3TextList[38],
                                                      imageChoose:
                                                          "${widget.dirPath}/A3P3.4.2.14.png",
                                                    )
                                                  : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 4 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage4TextOnly(
              player: player,
              backButton: () {},
              voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
              popUpText: module3TextList[39],
              imageChoose: "${widget.dirPath}/A3P3.4.2.1.GIF",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                  popUpText: module3TextList[40],
                  imageChoose: "${widget.dirPath}/A3P3.5.1.3.png",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                      popUpText: module3TextList[41],
                      imageChoose: "${widget.dirPath}/A3P3.5.1.4.png",
                    )
                  : widget.step == 4
                      ? LearningPage4TextOnly(
                          player: player,
                          backButton: () {},
                          voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                          popUpText: module3TextList[42],
                          imageChoose: "${widget.dirPath}/A3P3.5.1.3.GIF",
                        )
                      : widget.step == 5
                          ? LearningPage2Portrait(
                              player: player,
                              voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                              popUpText: module3TextList[43],
                              imageChoose: "${widget.dirPath}/A3P3.5.1.6.png",
                            )
                          : widget.step == 6
                              ? LearningPage1Landscape(
                                  player: player,
                                  voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                                  popUpText: module3TextList[44],
                                  imageChoose:
                                      "${widget.dirPath}/A3P3.5.1.7.png",
                                )
                              : widget.step == 7
                                  ? LearningPage2Portrait(
                                      player: player,
                                      voiceUrl:
                                          '${widget.dirPath}/A1S1.1.3.2.mp3',
                                      popUpText: module3TextList[45],
                                      imageChoose:
                                          "${widget.dirPath}/A3P3.5.1.9.png",
                                    )
                                  : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 4 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
              popUpText: module3TextList[46],
              imageChoose: "${widget.dirPath}/A3P3.5.2.1.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                  popUpText: module3TextList[47],
                  imageChoose: "${widget.dirPath}/A3P3.5.2.2.png",
                )
              : widget.step == 3
                  ? LearningPage1Landscape(
                      player: player,
                      voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                      popUpText: module3TextList[48],
                      imageChoose: "${widget.dirPath}/A3P3.5.2.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage1Landscape(
                          player: player,
                          voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                          popUpText: module3TextList[49],
                          imageChoose: "${widget.dirPath}/A3P3.5.2.4.png",
                        )
                      : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 4 &&
        widget.pageIndex == 2) {
      return widget.step == 1
          ? LearningPage4TextOnly(
              player: player,
              backButton: () {},
              voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
              popUpText: module3TextList[50],
              imageChoose: "${widget.dirPath}/A3P3.5.2.1.png",
            )
          : widget.step == 2
              ? LearningPage1Landscape(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.1.3.2.mp3',
                  popUpText: module3TextList[51],
                  imageChoose: "${widget.dirPath}/A3P3.5.3.3.png",
                )
              : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 5 &&
        widget.pageIndex == 0) {
      return widget.step == 1
          ? LearningPage4TextOnly(
              player: player,
              backButton: () {},
              voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
              popUpText: module3TextList[52],
              imageChoose: "${widget.dirPath}/A3P3.5.2.1.png",
            )
          : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 5 &&
        widget.pageIndex == 1) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
              popUpText: module3TextList[53],
              imageChoose: "${widget.dirPath}/A3P3.6.2.1.png",
            )
          : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 5 &&
        widget.pageIndex == 2) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
              popUpText: module3TextList[54],
              imageChoose: "${widget.dirPath}/A3P3.6.3.1.png",
            )
          : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 5 &&
        widget.pageIndex == 3) {
      return widget.step == 1
          ? LearningPage2Portrait(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
              popUpText: module3TextList[55],
              imageChoose: "${widget.dirPath}/A3P3.6.4.1.png",
            )
          : Container();
    } else if (widget.moduleIndex == 2 &&
        widget.chapterIndex == 5 &&
        widget.pageIndex == 5) {
      return widget.step == 1
          ? LearningPage1Landscape(
              player: player,
              voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
              popUpText: module3TextList[56],
              imageChoose: "${widget.dirPath}/A3P3.6.6.1.png",
            )
          : widget.step == 2
              ? LearningPage2Portrait(
                  player: player,
                  voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
                  popUpText: module3TextList[57],
                  imageChoose: "${widget.dirPath}/A3P3.6.6.2.png",
                )
              : widget.step == 3
                  ? LearningPage2Portrait(
                      player: player,
                      voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
                      popUpText: module3TextList[58],
                      imageChoose: "${widget.dirPath}/A3P3.6.6.3.png",
                    )
                  : widget.step == 4
                      ? LearningPage2Portrait(
                          player: player,
                          voiceUrl: '${widget.dirPath}/A1S1.1.3.1.mp3',
                          popUpText: module3TextList[59],
                          imageChoose: "${widget.dirPath}/A3P3.6.6.4.png",
                        )
                      : Container();
    } else {
      return Container();
    }
  }
}
