import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learning/src/learning_page/learning_widget/chapter1_image_pop_up.dart';
import 'package:learning/src/responsive.dart';
import 'package:learning/tool_widgets.dart';
import 'package:photo_view/photo_view.dart';

class LearningPage5ImageOnly extends StatefulWidget {
  const LearningPage5ImageOnly({
    Key? key,
    required this.hearderTitle,
    required this.imageChoose,
    required this.arrowRightOnTap,
    required this.arrowLeftOnTap,
  }) : super(key: key);

  final String? hearderTitle;
  final String? imageChoose;

  final Function? arrowRightOnTap;
  final Function? arrowLeftOnTap;

  @override
  State<LearningPage5ImageOnly> createState() => _LearningPage5ImageOnlyState();
}

class _LearningPage5ImageOnlyState extends State<LearningPage5ImageOnly> {
  bool imagepopUpVisible = false;

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
          Container(
            decoration: shadowDecorationWithBorderColor(
                const Color.fromARGB(200, 113, 101, 45),
                const Color.fromARGB(200, 113, 101, 45),
                12),
            margin: EdgeInsets.only(
              top: 60,
              left: MediaQuery.of(context).size.width * 0.1,
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            padding:
                const EdgeInsets.only(right: 12, top: 12, bottom: 12, left: 12),
            child: Stack(
              children: [
                Image.file(
                  File(widget.imageChoose!),
                  width: MediaQuery.of(context).size.width * 0.8,
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
