import 'package:flutter/material.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/introduction_page.dart';
import 'package:learning/src/learning_page/components/user_progress_page.dart';
import 'package:learning/src/learning_page/components/section_intro_hearder.dart';
import 'package:learning/src/learning_page/components/title_container.dart';
import 'package:learning/src/learning_page/components/reference_page.dart';
import 'package:learning/src/main_map/presentation/farmer_map.dart';

List<String> _moudelTitles = [
  '၁။ အခြေခံမြေဆီလွှာနှင့် ကောင်းမွန်သော မြေဆီလွှာအကြောင်း',
  '',
  '၃။ ရေကို အကျိုးရှိစွာ အသုံးပြုခြင်း',
  '၄။ မတူကွဲပြားခြားနားသော သီးနှံစိုက်ပျိုးနည်းစနစ်များ',
  '၅။ ဘက်ပေါင်းစုံ လယ်ယာစီမံခန့်ခွဲမှု',
  '၆။ ပတ်ဝန်းကျင်ထိန်းသိမ်းခြင်းဆိုင်ရာ စိုက်ပျိုးရေးစနစ်',
];

class ModuleEntryScreen extends StatefulWidget {
  List<List<List<double>>> scores;
  ModuleEntryScreen({
    super.key,
    required this.moduleNumber,
    required this.scores,
  });
  final int moduleNumber;
  @override
  State<ModuleEntryScreen> createState() => _ModuleEntryScreenState();
}

class _ModuleEntryScreenState extends State<ModuleEntryScreen> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);

    return WillPopScope(
      onWillPop: onWillPop,
      child: MediaQuery(
        data: mqDataNew,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 225, 255, 147),
          body: Stack(
            children: [
              BackgroundPage(
                backImage: "assets/images/agre_back.jpg",
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SectionIntroHearder(
                  onBackButtonPressed: onWillPop,
                  title: _moudelTitles[widget.moduleNumber - 1],
                ),
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
                      height: 50,
                      child: Row(
                        children: [
                          TitleContianer(
                            isSelected: isSelected == 0,
                            onTap: () {
                              setState(() {
                                isSelected = 0;
                              });
                            },
                            title: 'သင်ခန်းစာမိတ်ဆက်',
                            fontSize: 16,
                            bgColor: isSelected == 0
                                ? Colors.amber.withOpacity(0.4)
                                : Colors.grey,
                          ),
                          const SizedBox(width: 10),
                          TitleContianer(
                            isSelected: isSelected == 1,
                            onTap: () {
                              setState(() {
                                isSelected = 1;
                              });
                            },
                            title: 'တိုးတက်မှုအခြေအနေ',
                            fontSize: 16,
                            bgColor: isSelected == 1
                                ? Colors.amber.withOpacity(0.4)
                                : Colors.grey,
                          ),
                          const SizedBox(width: 10),
                          TitleContianer(
                            isSelected: isSelected == 2,
                            onTap: () {
                              setState(() {
                                isSelected = 2;
                              });
                            },
                            title: 'အညွှန်းကိုးကားချက်များ',
                            fontSize: 16,
                            bgColor: isSelected == 2
                                ? Colors.amber.withOpacity(0.4)
                                : Colors.grey,
                          ),
                        ],
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
                        child: isSelected == 0
                            ? IntroductionPage(
                                moduleNumber: widget.moduleNumber,
                              )
                            : isSelected == 1
                                ? UserProgress(
                                    scores: widget.scores,
                                    moduleNumber: widget.moduleNumber,
                                  )
                                : const ReferencePage(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FarmerMapScreen(
          fromModule: false,
        ),
      ),
    );
    return Future.value(false);
  }
}
