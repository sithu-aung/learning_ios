import 'package:flutter/material.dart';
import 'package:learning/src/components/book_list_model.dart';

class VideoItemWidget extends StatelessWidget {
  const VideoItemWidget({
    super.key,
    required this.title,
    required this.index,
    required this.onTap,
    required this.module,
    required this.thumbnail,
    required this.type,
  });
  final String? title;
  final String? index;
  final Function? onTap;
  final String module;
  final String thumbnail;
  final VideoType type;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, right: 10, left: 12),
            width: MediaQuery.of(context).size.width * 0.23,
            height: 110,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage(
                  thumbnail,
                ),
              ),
            ),
            child: type == VideoType.youtube
                ? Center(
                    child: Image.asset(
                      "assets/images/download.png",
                      width: 40,
                    ),
                  )
                : null,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, right: 10, left: 12),
            width: MediaQuery.of(context).size.width * 0.23,
            height: 72,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.white.withOpacity(0.2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '...',
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  "Module $module",
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
