import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learning/src/common_widget/button_image.dart';
import 'package:learning/src/common_widget/common_dialog.dart';
import 'package:learning/src/learning_page/chapters/chapter_page.dart';
import 'package:learning/src/main_map/presentation/main_map1_widget/mm1_chapter1_title_widget.dart';

class MM1Chapter1Dialog extends StatefulWidget {
  const MM1Chapter1Dialog(
      {super.key,
      required this.onTap,
      required this.closeOnTap,
      required this.chapList,
      required this.title,
      required this.moduleIndex,
      required this.chanpterIndex});
  final Function? closeOnTap;
  final Function? onTap;
  final List<String> chapList;
  final String title;
  final int moduleIndex;
  final int chanpterIndex;

  @override
  State<MM1Chapter1Dialog> createState() => _MM1Chapter1DialogState();
}

class _MM1Chapter1DialogState extends State<MM1Chapter1Dialog> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CommonDialog(
      isChapter: true,
      title: widget.title,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.4,
            width: size.width * 0.44,
            child: ListView.builder(
                itemCount: widget.chapList.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MM1Chapter1TitleWidget(
                      title: widget.chapList[index],
                      selected: selectedIndex == index,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  );
                }),
          ),
          selectedIndex == null
              ? ButtonImage(
                  width: 120,
                  height: 40,
                  onTap: () {},
                  buttonText: 'စတင်မယ်။',
                  buttonImage: 'assets/images/check_answer.png')
              : ButtonImage(
                  width: 120,
                  height: 40,
                  onTap: () {
                    widget.onTap?.call();

                    String nextTitle = "";
                    if (widget.chapList.length == selectedIndex! + 1) {
                      nextTitle = "end";
                    } else {
                      nextTitle = widget.chapList[selectedIndex! + 1];
                    }

                    log(nextTitle);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChapterPage(
                                  moduleIndex: widget.moduleIndex,
                                  chapterIndex: widget.chanpterIndex,
                                  pageIndex: selectedIndex!,
                                  title: widget.chapList[selectedIndex!],
                                  nextTitle: nextTitle,
                                  step: 1,
                                  force: false,
                                  fromModule: false,
                                )));
                  },
                  buttonText: 'စတင်မယ်။',
                  buttonImage: 'assets/images/button_green.png',
                ),
        ],
      ),
    );
  }
}
