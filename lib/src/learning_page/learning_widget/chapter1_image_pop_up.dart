import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learning/src/responsive.dart';
import 'package:learning/tool_widgets.dart';
import 'package:photo_view/photo_view.dart';

class Chapter1ImagePopUp extends StatelessWidget {
  const Chapter1ImagePopUp({
    super.key,
    required this.photoToView,
    required this.closeOnTap,
  });
  final String? photoToView;

  final GestureTapCallback closeOnTap;

  @override
  Widget build(BuildContext context) {
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
                      imageProvider: FileImage(File(photoToView!)),
                      backgroundDecoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.2)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: closeOnTap,
                    // setState(() {
                    //   imagepopUpVisible = false;
                    // });

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
