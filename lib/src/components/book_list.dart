import 'package:flutter/material.dart';
import 'package:learning/src/components/book_items.dart';
import 'package:learning/src/components/book_list_model.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_intro_hearder.dart';
import 'package:learning/src/learning_page/components/title_container.dart';

List<String> _list = [
  'စိုက်ပျိုးဂေဟစနစ်ဆိုင်ရာ\nအလေ့အထများ',
  'ရေရှည်တည်တံ့တဲ့ \nသဘာဝရာဘာ',
  'လယ်သမား အဖွဲ့အစည်းများ \nဖွဲ့စည်းခြင်းနဲ့ အားကောင်းစေခြင်း',
];

List<List<BookListModel>> _bookList = [
  [
    BookListModel(
        name:
            'သင်ခန်းစာ (၁) အ‌ခြေခံမြေဆီလွှာနှင့် \nကောင်းမွန်သော မြေဆီလွှာအကြောင်း',
        image: 'assets/images/AgroMo1BookCover.png'),
    BookListModel(
        name: 'သင်ခန်းစာ (၃) ရေကို အကျိုးရှိစွာ အသုံးပြုခြင်း',
        image: 'assets/images/AgroMo3BookCover.png'),
    BookListModel(
        name: 'သင်ခန်းစာ (၅) လယ်ယာစီမံခန့်ခွဲမှု',
        image: 'assets/images/AgroMo5BookCover.png'),
  ],
  [
    BookListModel(
        name: 'သင်ခန်းစာ (၁) သဘာဝရော်ဘာ၏ အထွေထွေအချက်အလက်များ',
        image: 'assets/images/RubberMo1BookCover.png'),
  ],
  [],
];

class BookListByModuleScreen extends StatefulWidget {
  const BookListByModuleScreen({super.key});

  @override
  State<BookListByModuleScreen> createState() => _BookListByModuleScreenState();
}

class _BookListByModuleScreenState extends State<BookListByModuleScreen> {
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
                title: "စာကြည့်တိုက်",
                onBackButtonPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 64, 10, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    height: 70,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < _list.length; i++)
                            TitleContianer(
                              onTap: () {
                                setState(() {
                                  isSelected = i;
                                });
                              },
                              isSelected: isSelected == i,
                              title: _list[i],
                              fontSize: 13,
                              bgColor:
                                  isSelected == i ? Colors.white : Colors.grey,
                            ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/papersmall.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: BookItemsPage(
                        list: _bookList[isSelected],
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
