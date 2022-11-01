import 'package:flutter/material.dart';
import 'package:learning/src/components/book_list_model.dart';
import 'package:learning/src/components/video_items.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_intro_hearder.dart';
import 'package:learning/src/learning_page/components/title_container.dart';

List<String> _list = [
  'စိုက်ပျိုးဂေဟစနစ်ဆိုင်ရာ\nအလေ့အထများ',
  'ရေရှည်တည်တံ့တဲ့ \nသဘာဝရာဘာ',
  'လယ်သမား အဖွဲ့အစည်းများ \nဖွဲ့စည်းခြင်းနဲ့ အားကောင်းစေခြင်း',
];

List<List<VideoListModel>> _videoList = [
  [
    VideoListModel(
      name: 'မြေဆီလွှာဆိုတာဘာလဲ',
      module: '1',
      thumbnail: 'assets/images/myay_si_hlwr_thumbnail.png',
      type: VideoType.asset,
      url: 'assets/soil.mp4',
    ),
  ],
  [],
  [],
];

class VideoListByModuleScreen extends StatefulWidget {
  const VideoListByModuleScreen({super.key});

  @override
  State<VideoListByModuleScreen> createState() =>
      _VideoListByModuleScreenState();
}

class _VideoListByModuleScreenState extends State<VideoListByModuleScreen> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);

    return MediaQuery(
      data: mqDataNew,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 225, 255, 147),
        body: Stack(
          children: [
            BackgroundPage(
              backImage: isSelected == 0
                  ? "assets/images/agre_back.jpg"
                  : isSelected == 1
                      ? "assets/images/farmer_back.jpg"
                      : "assets/images/rubber_back.jpg",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SectionIntroHearder(
                  title: "ဗီဒီယိုများ",
                  onBackButtonPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 70, 10, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    height: 60,
                    child: Row(
                      children: [
                        for (int i = 0; i < _list.length; i++)
                          TitleContianer(
                            isSelected: isSelected == i,
                            onTap: () {
                              setState(() {
                                isSelected = i;
                              });
                            },
                            title: _list[i],
                            fontSize: 13,
                            bgColor:
                                isSelected == 0 ? Colors.white : Colors.grey,
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            isSelected == 0
                                ? 'assets/images/papersmall.png'
                                : "",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: VideoItemsPage(
                        list: _videoList[isSelected],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
