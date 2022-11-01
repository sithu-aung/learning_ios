import 'package:flutter/material.dart';
import 'package:learning/src/components/book_list_model.dart';
import 'package:learning/src/components/video_display.dart';
import 'package:learning/src/components/video_item_widget.dart';
import 'package:learning/src/components/youtube_display.dart';

class VideoItemsPage extends StatelessWidget {
  const VideoItemsPage({super.key, required, required this.list});
  final List<VideoListModel> list;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
          itemCount: list.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return VideoItemWidget(
              title: list[index].name,
              module: list[index].module,
              thumbnail: list[index].thumbnail,
              type: list[index].type,
              index: '',
              onTap: () {
                if (list[index].type == VideoType.asset) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoDisplay(
                          hearderTitle: list[index].name,
                          videoUrl: list[index].url),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YoutubeDisplay(
                          hearderTitle: list[index].name,
                          videoUrl: "udseIcrUxvA"),
                    ),
                  );
                }
              },
            );
          }),
    );
  }
}
