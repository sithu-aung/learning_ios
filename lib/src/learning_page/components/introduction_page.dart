import 'package:flutter/material.dart';
import 'package:learning/data/data/chap_string.dart';
import 'package:learning/src/learning_page/chapters/chapter_page.dart';
import 'package:learning/src/learning_page/components/intro_list_widget.dart';

List<List<String>> titlesForModuleOne = [
  [
    'အခန်း ၁.၁။ အခြေခံမြေဆီလွှာအကြောင်း',
    'အခန်း ၁.၂။ မြေဆီလွှာ၏ ရုပ်ဂုဏ်သတ္တိများ',
    'အခန်း ၁.၃။ မြေဆီလွှာ၏ ဓာတ်ဂုဏ်သတ္တိများ',
    'အခန်း ၁.၄။ မြေဆီလွှာရှိ သဘာ၀မြေဆွေး',
    'အခန်း ၁.၅။ မြေဆီလွှာရှိ အဏုဇီ၀ ပီုးမွှားများ',
    'အခန်း ၁.၆။ ကောင်းမွှန်သော မြေဆီလွှာ',
  ],
  [],
  [
    'အခန်း ၃.၁။ မိတ်ဆက်ခြင်း',
    'အခန်း ၃.၂။ ရေရဲ့အရည်အသွေး',
    'အခန်း ၃.၃။ မိုးကောင်းသောစိုက်ပျိုးရေးတွင် ရေကိုအကျိုးရှိစွာ အသုံပြုခြင်း',
    'အခန်း ၃.၄။ အကျိုးထိရောက်မှုရှိတဲ့ ရေသွင်းခြင်း',
    'အခန်း ၃.၅။ ရေစုဆောင်းခြင်းနဲ့ ထိန်းသိမ်းခြင်း',
    'အခန်း ၃.၆။ စိုက်ပျိုးမှုစနစ်များတွင် ရေကိုအကျိုးရှိစွာအသုံးပြုခြင်းအတွက် ဘက်ပေါင်းစုံနည်းစနစ်များ '
  ],
  [],
  [
    'အခန်း ၅.၁။ အဓိပ္ပါယ်ဖွင့်ဆိုခြင်း',
    'အခန်း ၅.၂။ သီးနှံစနစ်နဲ့ လယ်ယာစိုက်ပျိုးတဲ့စနစ်  ',
    'အခန်း ၅.၃ ။ စိုက်ပျိုးဂေဟစနစ်တွင် တိရစ္ဆာန်တွေရဲ့ အခန်းကဏ္ဍ ',
    'အခန်း ၅.၄။ စိုက်ပျိုးဂေဟစနစ်တွေကို အမျိုးအစား ခွဲခြားခြင်း  ',
    'အခန်း ၅.၅။ ရေရှည်တည်တံ့တဲ့ ဖွံ့ဖြိုးတိုးတက်မှုရရှိစေဖို့ ချဉ်းကပ်နည်းအမျိုးမျိုး',
    'အခန်း ၅.၆။ သီးနှံစိုက်ပျိုးရေး၊ ငါးမွေးမြူရေးနဲ့ တိရစ္ဆာန်မွေးမြူရေးကို ပေါင်းစပ်လုပ်ကိုင်ခြင်း  ',
    'အခန်း ၅.၇။ သီးနှံစိုက်ပျိုးတဲ့စနစ်တွေမှာ ရုပ်ဝတ္ထုဆိုင်ရာ အရင်းအမြစ်များ၊ မြေဆီလွှာနဲ့ ရေအား စီမံခန့်ခွဲမှု ',
    'အခန်း ၅.၈။ တောင်သူတွေအတွက် သင်တန်းပေးရခြင်းရဲ့ ရည်ရွယ်ချက်များ',
  ],
  [],
];

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({
    super.key,
    required this.moduleNumber,
  });
  final int moduleNumber;
  @override
  Widget build(BuildContext context) {
    List<String> str = [
      "မြေဆီလွှာဖြစ်ပေါ်လာပုံ၊ မြေဆီလွှာတွင် ပါဝင်ဖွဲ့စည်းထားသော အရာများ၊ စိုက်ပျိုးရေးကို အဓိကသက်ရောက်မှု ဖြစ်စေသော မြေဆီလွှာ၏ ရုပ်ဂုဏ်သတ္တိနှင့် ဓာတ်ဂုဏ်သတ္တိများ၏ အကြောင်းကို နားလည်စေရန်။မြေဆီလွှာရှိ အဏုဇီဝပိုးမွှားများ၊ သဘာဝမြေဆီမြေနှစ် ကောင်းမွန်သော မြေဆီလွှာတို့၏ အရေးပါသောအခန်းကဏ္ဍများအကြောင်းကို သိရှိစေရန်။",
      "",
      "လူတွေရဲ့ဘဝမှာ ရေကို ပုံစံအမျိုးမျိုးနဲ့ နေ့စဉ်အသုံးပြုနေပြီး လူတိုင်းအတွက် အလွန်အရေးပါပါတယ်။ ဒါ့အပြင် စိုက်ပျိုးရေး၊ စက်ရုံလုပ်ငန်းတွေနဲ့ ပြည်တွင်းလုပ်ငန်းတွေမှာ ရေဟာ မရှိမဖြစ်လိုအပ်တဲ့ အစိတ်အပိုင်းတစ်ခု ဖြစ်နေပါတယ်။ လူဦးရေတိုးတက်လာတာနဲ့အမျှ ရေသုံးစွဲမှုနဲ့ ရေလိုအပ်ချက်တွေကလည်း တိုးမြင့်လာပြီး တစ်ဖက်မှာလည်း ရာသီဥတုပြောင်းလဲမှုတွေက ရေရရှိနိုင်မှုကို ထိခိုက်စေပါတယ်။ ဒါကြောင့် ဒီသင်ခန်းစာမှာ ရရှိတဲ့ရေကို ကောင်းစွာ အသုံးချဖို့၊  စိုက်ပျိုးထုတ်လုပ်မှုမှာ ရေကို ကောင်းစွာ စီမံခန့်ခွဲနိုင်ဖို့နဲ့ ရေကို စနစ်တကျ မျှဝေသုံးစွဲတတ်ဖို့ကို ရည်ရွယ်ပြီး သင်ကြားပေးသွားမှာ ဖြစ်ပါတယ်။",
      "",
      "ဘက်ပေါင်းစုံလယ်ယာစီမံခန့်ခွဲမှုစနစ်ဆိုတာ သမာရိုးကျစိုက်ပျိုးတာ တစ်ခုတည်းထက် ဘက်ပေါင်းစုံပေါင်းစည်းထားတဲ့ လယ်ယာစိုက်ပျိုးနည်းစနစ် ဖြစ်ပါတယ်။ တိရစ္ဆာန်မွေးမြူရေးနဲ့ သီးနှံစိုက်ပျိုးရေး (ဒါမှမဟုတ်) ငါးမွေးမြူရေးနဲ့ တိရစ္ဆာန်မွေးမြူရေးကို ပေါင်းစည်းလုပ်ကိုင်တဲ့စနစ် ဖြစ်ပြီးတော့ ဒီစနစ်ကို ဇီဝစနစ်တွေ ပူးပေါင်းလုပ်ဆောင်တဲ့စနစ်လို့လည်း ခေါ်လေ့ရှိပါတယ်။ ဒီသင်ခန်းစာမှာ ဘက်ပေါင်းစုံလယ်ယာစီမံခန့်ခွဲမှုစနစ်အကြောင်းကို အသေးစိတ်လေ့လာသွားရမှာ ဖြစ်ပါတယ်။"
    ];

    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(20),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              children: [
                Text(
                  str[moduleNumber - 1],
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return IntroListWidget(
                    title: titlesForModuleOne[moduleNumber - 1].isNotEmpty
                        ? titlesForModuleOne[moduleNumber - 1][index]
                        : '',
                    lessons: subjects[moduleNumber - 1][index],
                    onTap: (iIndex) {
                      String nextTitle = "";
                      if (subjects[moduleNumber - 1][index].length ==
                          iIndex + 1) {
                        nextTitle = "end";
                      } else {
                        nextTitle =
                            subjects[moduleNumber - 1][index][iIndex + 1];
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapterPage(
                            moduleIndex: moduleNumber - 1,
                            chapterIndex: index,
                            pageIndex: iIndex,
                            nextTitle: nextTitle,
                            title: subjects[moduleNumber - 1][index][iIndex],
                            step: 1,
                            force: false,
                            fromModule: true,
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),
        ),
      ],
    );
  }
}
