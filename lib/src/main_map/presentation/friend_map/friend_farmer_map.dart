import 'dart:convert';
import 'dart:developer';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:learning/data/data/chap_string.dart';
import 'package:learning/data/response/user_progress_response.dart';
import 'package:learning/src/components/book_list.dart';
import 'package:learning/src/components/menu_list.dart';
import 'package:learning/src/components/video_list.dart';
import 'package:learning/src/learning_page/chapters/jsonparser.dart';
import 'package:learning/src/learning_page/module_entry.dart';
import 'package:learning/src/learning_page/lession_progress/lesson_progress_page.dart';
import 'package:learning/src/main_map/presentation/common/common_download_dialog3.dart';
import 'package:learning/src/main_map/presentation/common/navigator_title_widget.dart';
import 'package:learning/src/main_map/presentation/main_map1_widget/mm1_chapter1_dialog.dart';
import 'package:learning/src/main_map/presentation/organization_map.dart';
import 'package:learning/src/main_map/presentation/rubber_map.dart';
import 'package:learning/src/notification/presentation/notification_page.dart';
import 'package:learning/src/util/constants.dart';
import 'package:learning/tool_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FriendFarmerMapScreen extends StatefulWidget {
  static const routeName = '/friend_map';
  String userId;
  String userName;
  FriendFarmerMapScreen(
      {Key? key, required this.userId, required this.userName})
      : super(key: key);

  @override
  State<FriendFarmerMapScreen> createState() => _FriendFarmerMapScreenState();
}

class _FriendFarmerMapScreenState extends State<FriendFarmerMapScreen> {
  bool folded = true;
  bool mm1ChapterDialog = false;
  bool module1 = false;
  bool module2 = false;
  bool module3 = false;
  bool module4 = false;
  bool module5 = false;
  List<String> chapList = [];
  int moduleIndex = 0;
  int chapterIndex = 0;
  String chapTitle = "";
  double module1Score = 0;
  String? scoreString;
  List<List<List<double>>> scores = [
    [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0],
      [0, 0, 0],
      [0, 0],
      [0, 0]
    ],
    [],
    [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0],
      [0, 0],
      [0],
      [0, 0],
      [0, 0, 0],
      [0, 0, 0, 0, 0]
    ],
    [],
    [
      [0, 0, 0],
      [0, 0],
      [0, 0],
      [0],
      [0, 0],
      [0, 0, 0],
      [0, 0, 0],
      [0, 0],
    ],
  ];

  List<List<double>> scoreAvg = [
    [
      0,
      0,
      0,
      0,
      0,
      0,
    ],
    [],
    [
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
    ],
    [0, 0, 0, 0, 0],
    [
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
    ],
  ];

  @override
  void initState() {
    super.initState();
    _setName();
  }

  void _setName() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString('module1') != null ? module1 = true : module1 = false;
    prefs.getString('module2') != null ? module2 = true : module2 = false;
    prefs.getString('module3') != null ? module3 = true : module3 = false;
    prefs.getString('module4') != null ? module4 = true : module4 = false;
    prefs.getString('module5') != null ? module5 = true : module5 = false;

    //prefs.remove("userscore");

    getUserDataById();
  }

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
        body: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/farm.png",
                      width: 1500,
                    ),
                    titleSubject(
                        "စိုက်ပျိုးဂေဟစနစ်ဆိုင်ရာ \nအလေ့အထများ", 490, 70),

                    Positioned(
                      left: 294,
                      top: 280,
                      child: Image.asset(
                        "assets/images/f1.png",
                        height: 166,
                      ),
                    ),

                    moduleText(
                        0,
                        "Module 1",
                        "module1",
                        module1,
                        "၁။ အခြေခံမြေဆီလွှာနှင့် \n  ကောင်းမွန်သော \n  မြေဆီလွှာအကြောင်း",
                        138,
                        80,
                        294,
                        210,
                        "assets/images/avator_boy2.png",
                        40,
                        0.5,
                        80,
                        1),

                    //House 1
                    chapterButton(
                      module1,
                      "assets/images/fhl.png",
                      64,
                      550,
                      310,
                      0.5,
                      0,
                      0,
                      "၁.၁။ မြေဆီလွှာ \n အကြောင်းအခြေခံ ",
                    ),
                    chapterText(
                      module1,
                      0,
                      0,
                      "၁.၁။ မြေဆီလွှာ \n အကြောင်းအခြေခံ ",
                      110,
                      54,
                      456,
                      262,
                    ),

                    //farm 1
                    chapterButton(
                      module1,
                      "assets/images/f8.png",
                      46,
                      642,
                      284,
                      0.5,
                      0,
                      1,
                      "၁.၂။ မြေဆီလွှာရဲ့ \nရုပ်ဂုဏ်သတ္တိများ",
                    ),
                    chapterText(
                      module1,
                      0,
                      1,
                      "၁.၂။ မြေဆီလွှာရဲ့ \nရုပ်ဂုဏ်သတ္တိများ",
                      100,
                      48,
                      574,
                      246,
                    ),

                    //House 2
                    chapterButton(
                      module1,
                      "assets/images/fhl.png",
                      64,
                      670,
                      180,
                      0.7,
                      0,
                      2,
                      "၁.၃။ မြေဆီလွှာရဲ့ ဓာတ်ဂုဏ်သတ္တိများ",
                    ),
                    chapterText(
                      module1,
                      0,
                      2,
                      "၁.၃။ မြေဆီလွှာရဲ့ ဓာတ်ဂုဏ်သတ္တိများ",
                      100,
                      48,
                      590,
                      140,
                    ),

                    //farm 2
                    chapterButton(
                      module1,
                      "assets/images/f8.png",
                      46,
                      772,
                      144,
                      0.5,
                      0,
                      3,
                      "၁.၄။ မြေဆီလွှာရှိ \nသဘာဝမြေဆွေး",
                    ),
                    chapterText(
                      module1,
                      0,
                      3,
                      "၁.၄။ မြေဆီလွှာရှိ \nသဘာဝမြေဆွေး",
                      100,
                      48,
                      694,
                      94,
                    ),

                    //House 3
                    chapterButton(
                      module1,
                      "assets/images/fhl.png",
                      64,
                      840,
                      212,
                      0.5,
                      0,
                      4,
                      "၁.၅။ မြေဆီလွှာရှိ \nအဏုဇီဝပိုးမွှားများ",
                    ),
                    chapterText(
                      module1,
                      0,
                      4,
                      "၁.၅။ မြေဆီလွှာရှိ \nအဏုဇီဝပိုးမွှားများ",
                      100,
                      48,
                      780,
                      184,
                    ),

                    //farm 3
                    chapterButton(
                      module1,
                      "assets/images/f8.png",
                      46,
                      818,
                      328,
                      0.7,
                      0,
                      5,
                      "၁.၆။ ကောင်းမွန်သော \nမြေဆီလွှာ",
                    ),
                    chapterText(
                      module1,
                      0,
                      5,
                      "၁.၆။ ကောင်းမွန်သော \nမြေဆီလွှာ",
                      110,
                      48,
                      740,
                      288,
                    ),

                    //Chapter 2

                    moduleButton(
                      module3,
                      "assets/images/f3.png",
                      112,
                      984,
                      560,
                    ),
                    moduleText(
                        2,
                        "Module 3",
                        "module3",
                        module3,
                        "၃။ ရေကို အကျိုးရှိစွာ \nအသုံးပြုခြင်း",
                        128,
                        60,
                        944,
                        520,
                        "",
                        0,
                        0,
                        90,
                        3),

                    //farm 1
                    chapterButton(
                      module3,
                      "assets/images/f8.png",
                      46,
                      920,
                      674,
                      0.5,
                      2,
                      0,
                      " ၃.၁။ မိတ်ဆက်ခြင်း",
                    ),
                    chapterText(
                      module3,
                      2,
                      0,
                      " ၃.၁။ မိတ်ဆက်ခြင်း",
                      108,
                      32,
                      836,
                      648,
                    ),

                    //House 1
                    chapterButton(
                      module3,
                      "assets/images/fhl.png",
                      64,
                      834,
                      616,
                      0.5,
                      2,
                      1,
                      "၃.၂။ ရေရဲ့ အရည်အသွေး",
                    ),
                    chapterText(
                      module3,
                      2,
                      1,
                      "၃.၂။ ရေရဲ့ အရည်အသွေး",
                      128,
                      32,
                      760,
                      588,
                    ),

                    //Farm 2
                    chapterButton(
                      module3,
                      "assets/images/f8.png",
                      46,
                      890,
                      526,
                      0.5,
                      2,
                      2,
                      "၃.၃။ မိုးကောင်းသောက်စိုက်ပျိုးရေးတွင် \nရေကို အကျိုးရှိစွာအသုံးပြုခြင်း",
                    ),
                    chapterText(
                      module3,
                      2,
                      2,
                      "၃.၃။ မိုးကောင်းသောက်စိုက်ပျိုးရေးတွင် \nရေကို အကျိုးရှိစွာအသုံးပြုခြင်း",
                      186,
                      50,
                      740,
                      488,
                    ),

                    //House 2
                    chapterButton(
                      module3,
                      "assets/images/fhl.png",
                      64,
                      844,
                      426,
                      0.5,
                      2,
                      3,
                      "၃.၄။ အကျိုးထိရောက်မှုရှိသော\nရေသွင်းခြင်း",
                    ),
                    chapterText(
                      module3,
                      2,
                      3,
                      "၃.၄။ အကျိုးထိရောက်မှုရှိသော\nရေသွင်းခြင်း",
                      152,
                      44,
                      786,
                      400,
                    ),

                    // Farm 3
                    chapterButton(
                      module3,
                      "assets/images/f8.png",
                      46,
                      724,
                      396,
                      0.5,
                      2,
                      4,
                      "၃.၅။ ရေစုဆောင်းခြင်းနှင့် \nထိန်းသိမ်းခြင်း",
                    ),
                    chapterText(
                      module3,
                      2,
                      4,
                      "၃.၅။ ရေစုဆောင်းခြင်းနှင့် \nထိန်းသိမ်းခြင်း",
                      132,
                      40,
                      624,
                      366,
                    ),

                    //House 3
                    chapterButton(
                      module3,
                      "assets/images/fhl.png",
                      64,
                      610,
                      456,
                      0.5,
                      2,
                      5,
                      "၃.၆။ စိုက်ပျိုးမှုစနစ်များတွင် \nရေကိုအကျိုးရှိစွာအသုံးပြုခြင်းအတွက်\nဘက်ပေါင်းစုံနည်းစနစ်များ",
                    ),
                    chapterText(
                      module3,
                      2,
                      5,
                      "၃.၆။ စိုက်ပျိုးမှုစနစ်များတွင် \nရေကိုအကျိုးရှိစွာအသုံးပြုခြင်းအတွက်\nဘက်ပေါင်းစုံနည်းစနစ်များ",
                      182,
                      74,
                      450,
                      400,
                    ),

                    //Chapter 4
                    moduleButton(
                      module4,
                      "assets/images/f4.png",
                      156,
                      570,
                      500,
                    ),
                    moduleText(
                        3,
                        "Module 4",
                        "module4",
                        module4,
                        "၄။ မတူကွဲပြားခြားနားသော \nသီးနှံစိုက်ပျိုးနည်းစနစ်များ",
                        158,
                        60,
                        570,
                        520,
                        "",
                        0,
                        0,
                        90,
                        4),

                    //farm 1
                    chapterButton(
                      module4,
                      "assets/images/f8.png",
                      46,
                      500,
                      632,
                      0.5,
                      3,
                      3,
                      "၄.၄။ သီးနှံသစ်တော \nရောနှောစနစ်",
                    ),
                    chapterText(
                      module4,
                      3,
                      3,
                      "၄.၄။ သီးနှံသစ်တော \nရောနှောစနစ်",
                      110,
                      44,
                      430,
                      600,
                    ),

                    //House 1
                    chapterButton(
                      module4,
                      "assets/images/fhl.png",
                      64,
                      724,
                      650,
                      0.5,
                      3,
                      0,
                      "၄.၁။ သီးနှံစိုက်ပျိုးနည်းစနစ်များ",
                    ),
                    chapterText(
                      module4,
                      3,
                      0,
                      "၄.၁။ သီးနှံစိုက်ပျိုးနည်းစနစ်များ",
                      148,
                      32,
                      610,
                      628,
                    ),

                    //House 2
                    chapterButton(
                      module4,
                      "assets/images/fhl.png",
                      64,
                      544,
                      720,
                      0.5,
                      3,
                      2,
                      "၄.၃။ သီးညှပ်စိုက်ပျိုးခြင်း",
                    ),
                    chapterText(
                      module4,
                      3,
                      2,
                      "၄.၃။ သီးညှပ်စိုက်ပျိုးခြင်း",
                      128,
                      32,
                      460,
                      698,
                    ),

                    //House 2
                    chapterButton(
                      module4,
                      "assets/images/fhl.png",
                      64,
                      404,
                      670,
                      0.5,
                      3,
                      4,
                      "၄.၅။ သီးနှံပြက္ခဒိန်",
                    ),
                    chapterText(
                      module4,
                      3,
                      4,
                      "၄.၅။ သီးနှံပြက္ခဒိန်",
                      110,
                      32,
                      320,
                      658,
                    ),

                    //farm 2
                    chapterButton(
                      module4,
                      "assets/images/f8.png",
                      46,
                      630,
                      752,
                      0.5,
                      3,
                      1,
                      "၄.၂။ သီးလှည့်စိုက်ပျိုးနည်းစနစ်",
                    ),
                    chapterText(
                      module4,
                      3,
                      1,
                      "၄.၂။ သီးလှည့်စိုက်ပျိုးနည်းစနစ်",
                      152,
                      32,
                      580,
                      730,
                    ),

                    //404,
                    //  670,
                    //Chapter 4
                    moduleButton(
                      module5,
                      "assets/images/f5.png",
                      106,
                      364,
                      744,
                    ),
                    moduleText(
                        4,
                        "Module 5",
                        "module5",
                        module5,
                        "၅။ ဘက်ပေါင်းစုံ \nလယ်ယာစီမံခန့်ခွဲမှု",
                        118,
                        60,
                        248,
                        764,
                        "",
                        0,
                        0,
                        90,
                        5),

                    //House 1
                    chapterButton(
                      module5,
                      "assets/images/fhl.png",
                      64,
                      464,
                      840,
                      0.5,
                      4,
                      0,
                      "၅.၁။ ဘက်ပေါင်းစုံ \nလယ်ယာစီမံခန့်ခွဲမှု",
                    ),
                    chapterText(
                      module5,
                      4,
                      0,
                      "၅.၁။ ဘက်ပေါင်းစုံ \nလယ်ယာစီမံခန့်ခွဲမှု",
                      110,
                      52,
                      440,
                      838,
                    ),

                    //farm 2
                    chapterButton(
                      module5,
                      "assets/images/f8.png",
                      46,
                      390,
                      912,
                      0.5,
                      4,
                      1,
                      "၅.၂။ သီးနှံစနစ်နဲ့ \nလယ်ယာစိုက်ပျိုးတဲ့စနစ်",
                    ),
                    chapterText(
                      module5,
                      4,
                      1,
                      "၅.၂။ သီးနှံစနစ်နဲ့ \nလယ်ယာစိုက်ပျိုးတဲ့စနစ်",
                      120,
                      48,
                      284,
                      872,
                    ),

                    //House 1
                    chapterButton(
                      module5,
                      "assets/images/fhl.png",
                      64,
                      270,
                      940,
                      0.5,
                      4,
                      2,
                      "၅.၃ ။ စိုက်ပျိုးဂေဟစနစ်တွင် \nတိရစ္ဆာန်တွေရဲ့ အခန်းကဏ္ဍ ",
                    ),
                    chapterText(
                      module5,
                      4,
                      2,
                      "၅.၃ ။ စိုက်ပျိုးဂေဟစနစ်တွင် \nတိရစ္ဆာန်တွေရဲ့ အခန်းကဏ္ဍ ",
                      130,
                      52,
                      154,
                      900,
                    ),

                    //farm 2
                    chapterButton(
                      module5,
                      "assets/images/f8.png",
                      46,
                      274,
                      1052,
                      0.5,
                      4,
                      3,
                      "၅.၄။ စိုက်ပျိုးဂေဟစနစ်တွေကို \nအမျိုးအစားခွဲခြားခြင်း",
                    ),
                    chapterText(
                      module5,
                      4,
                      3,
                      "၅.၄။ စိုက်ပျိုးဂေဟစနစ်တွေကို \nအမျိုးအစားခွဲခြားခြင်း",
                      140,
                      48,
                      204,
                      1012,
                    ),

                    //House 1
                    chapterButton(
                      module5,
                      "assets/images/fhl.png",
                      64,
                      344,
                      1094,
                      0.5,
                      4,
                      4,
                      "၅.၅။ ရေရှည်တည်တံ့တဲ့ ဖွံ့ဖြိုးတိုးတက်မှု \nရရှိစေဖို့ ချဉ်းကပ်နည်းအမျိုးမျိုး",
                    ),
                    chapterText(
                      module5,
                      4,
                      4,
                      "၅.၅။ ရေရှည်တည်တံ့တဲ့ ဖွံ့ဖြိုးတိုးတက်မှု \nရရှိစေဖို့ ချဉ်းကပ်နည်းအမျိုးမျိုး",
                      180,
                      48,
                      120,
                      1108,
                    ),

                    //farm 2
                    chapterButton(
                      module5,
                      "assets/images/f8.png",
                      46,
                      424,
                      1132,
                      0.5,
                      4,
                      5,
                      "၅.၆။ သီးနှံစိုက်ပျိုးရေး၊ ငါးမွေးမြူရေးနဲ့ \nတိရစ္ဆာန်မွေးမြူရေးကို ပေါင်းစပ်လုပ်ကိုင်ခြင်း",
                    ),
                    chapterText(
                      module5,
                      4,
                      5,
                      "၅.၆။ သီးနှံစိုက်ပျိုးရေး၊ ငါးမွေးမြူရေးနဲ့ \nတိရစ္ဆာန်မွေးမြူရေးကို ပေါင်းစပ်လုပ်ကိုင်ခြင်း",
                      190,
                      48,
                      304,
                      1172,
                    ),

                    //House 1
                    chapterButton(
                      module5,
                      "assets/images/fhl.png",
                      64,
                      490,
                      1074,
                      0.5,
                      4,
                      6,
                      "၅.၇။ သီးနှံစိုက်ပျိုးတဲ့စနစ်တွေမှာ \nရုပ်ဝတ္ထုဆိုင်ရာ အရင်းအမြစ်များ၊ \nမြေဆီလွှာနဲ့ ရေအား စီမံခန့်ခွဲမှု ",
                    ),
                    chapterText(
                      module5,
                      4,
                      6,
                      "၅.၇။ သီးနှံစိုက်ပျိုးတဲ့စနစ်တွေမှာ \nရုပ်ဝတ္ထုဆိုင်ရာ အရင်းအမြစ်များ၊ \nမြေဆီလွှာနဲ့ ရေအား စီမံခန့်ခွဲမှု ",
                      152,
                      64,
                      470,
                      1078,
                    ),

                    //farm 2
                    chapterButton(
                      module5,
                      "assets/images/f8.png",
                      46,
                      454,
                      1018,
                      0.5,
                      4,
                      7,
                      "၅.၈။ တောင်သူတွေအတွက် \nသင်တန်းပေးရခြင်းရဲ့ \nရည်ရွယ်ချက်များ",
                    ),
                    chapterText(
                      module5,
                      4,
                      7,
                      "၅.၈။ တောင်သူတွေအတွက် \nသင်တန်းပေးရခြင်းရဲ့ \nရည်ရွယ်ချက်များ",
                      132,
                      56,
                      344,
                      972,
                    ),

                    //Chapter 2

                    moduleButton(
                      module3,
                      "assets/images/f6.png",
                      102,
                      534,
                      978,
                    ),
                    moduleText(
                      2,
                      "Module 3",
                      "module3",
                      module3,
                      "၆။ ပတ်ဝန်းကျင်ထိန်းသိမ်းခြင်းဆိုင်ရာ စိုက်ပျိုးရေးစနစ်",
                      152,
                      60,
                      484,
                      928,
                      "",
                      0,
                      0,
                      90,
                      6,
                    ),

                    titleSubject(
                      "လယ်သမားအဖွဲ့အစည်းများ ဖွဲ့စည်းခြင်းနဲ့ \nအားကောင်းစေခြင်း",
                      894,
                      1188,
                    ),

                    Positioned(
                      left: 964,
                      top: 1250,
                      child: BouncingWidget(
                        duration: const Duration(milliseconds: 400),
                        scaleFactor: 1.5,
                        onPressed: () async {
                          log("Hey");
                          Future.delayed(const Duration(milliseconds: 800), () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OrganizationMapScreen()));
                          });
                        },
                        child: Image.asset(
                          "assets/images/v3.png",
                          height: 96,
                        ),
                      ),
                    ),

                    titleSubject(
                      "ရေရှည်တည်တံ့တဲ့ သဘာဝရာဘာ",
                      1204,
                      238,
                    ),
                    Positioned(
                      left: 1404,
                      top: 288,
                      child: BouncingWidget(
                        duration: const Duration(milliseconds: 400),
                        scaleFactor: 1.5,
                        onPressed: () async {
                          log("Hey");
                          Future.delayed(const Duration(milliseconds: 800), () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RubberMapScreen()));
                          });
                        },
                        child: Image.asset(
                          "assets/images/r1.png",
                          height: 120,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Stable
            Positioned(
              left: 20,
              top: 8,
              child: BouncingWidget(
                duration: const Duration(milliseconds: 400),
                scaleFactor: 1.5,
                onPressed: () async {
                  log("Hey");
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const ProfilePageScreen()),
                  // );
                },
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/wooden_small.png",
                      width: MediaQuery.of(context).size.width * 0.23,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                "assets/images/frame1.png",
                                width: 24,
                              ),
                              Image.asset(
                                'assets/images/avator_boy2.png',
                                width: 24,
                                height: 24,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                widget.userName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/ic_trophy.png",
                                    width: 18,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Image.asset(
                                    "assets/images/ic_trophy.png",
                                    width: 18,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Image.asset(
                                    "assets/images/ic_trophy.png",
                                    width: 18,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // const FriendList(),

            NavigatorTitleWidget(
              leftText:
                  "လယ်သမား\n အဖွဲ့အစည်းများ\n         ဖွဲ့စည်းခြင်းနဲ့\n        အားကောင်းစေခြင်း",
              middleText: '\tစိုက်ပျိုးဂေဟစနစ်ဆိုင်ရာ \nအလေ့အထများ',
              rightText:
                  "  \t\t            ရေရှည်\n            တည်တံ့တဲ့ \n   \t\t\t\t\tသဘာဝ \n\t\t\t\t   ရာဘာ",
              leftAction: () async {
                // await Future.delayed(const Duration(milliseconds: 800), () {
                //   Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const OrganizationMapScreen()));
                // });
              },
              rightAction: () async {
                // await Future.delayed(const Duration(milliseconds: 800), () {
                //   Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const RubberMapScreen()));
                // });
              },
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.82,
              top: 8,
              child: BouncingWidget(
                duration: const Duration(milliseconds: 400),
                scaleFactor: 1.5,
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationPage()));
                },
                child: Image.asset(
                  "assets/images/ic_noti.png",
                  width: 56,
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.9,
              top: 8,
              child: BouncingWidget(
                duration: const Duration(milliseconds: 400),
                scaleFactor: 1.5,
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MenuListScreen()));
                },
                child: Image.asset(
                  "assets/images/buttons_menu.png",
                  width: 56,
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.82,
              top: MediaQuery.of(context).size.height * 0.83,
              child: BouncingWidget(
                duration: const Duration(milliseconds: 400),
                scaleFactor: 1.5,
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BookListByModuleScreen()));
                },
                child: Image.asset(
                  "assets/images/ic_book.png",
                  width: 56,
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.9,
              top: MediaQuery.of(context).size.height * 0.83,
              child: BouncingWidget(
                duration: const Duration(milliseconds: 400),
                scaleFactor: 1.5,
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const VideoListByModuleScreen()));
                },
                child: Image.asset(
                  "assets/images/ic_media.png",
                  width: 56,
                ),
              ),
            ),
            //1.1 chapter popup
            // Visibility(
            //   visible: mm1ChapterDialog,
            //   child: Positioned(
            //     left: MediaQuery.of(context).size.width * 0.2,
            //     top: MediaQuery.of(context).size.height * 0.1,
            //     child: MM1Chapter1Dialog(
            //       moduleIndex: moduleIndex,
            //       chanpterIndex: chapterIndex,
            //       title: chapTitle,
            //       chapList: chapList,
            //       onTap: () {
            //         setState(() {
            //           mm1ChapterDialog = false;
            //         });
            //       },
            //       closeOnTap: () {
            //         setState(() {
            //           mm1ChapterDialog = false;
            //         });
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget chapterText(bool open, int modulePosition, int chapterPostion,
      String text, double width, double height, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: open
          ? GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () async {
                if (open) {
                  setState(() {
                    mm1ChapterDialog = true;
                    chapTitle = text.replaceAll("\n", "");
                    chapList = subjects[modulePosition][chapterPostion];
                    moduleIndex = modulePosition;
                    chapterIndex = chapterPostion;
                  });
                  await showDialog(
                      context: context,
                      builder: (context) => MM1Chapter1Dialog(
                            moduleIndex: moduleIndex,
                            chanpterIndex: chapterIndex,
                            title: chapTitle,
                            chapList: chapList,
                            onTap: () {
                              setState(() {
                                mm1ChapterDialog = false;
                              });
                              Navigator.pop(context);
                            },
                            closeOnTap: () {
                              setState(() {
                                mm1ChapterDialog = false;
                              });
                              Navigator.pop(context);
                            },
                          ));
                  setState(() {
                    mm1ChapterDialog = false;
                  });
                  _setName();
                }
              },
              child: Container(
                padding: const EdgeInsets.only(left: 12),
                alignment: Alignment.centerLeft,
                decoration: shadowDecorationWithBorderColor(
                    const Color.fromARGB(100, 255, 255, 255),
                    const Color.fromARGB(100, 255, 255, 255),
                    20),
                margin: const EdgeInsets.symmetric(horizontal: 60),
                width: width,
                height: height,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 10),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  Widget moduleText(
    int modulePosition,
    String moduleDisplayName,
    String moduleName,
    bool open,
    String text,
    double width,
    double height,
    double left,
    double top,
    String image,
    double size,
    double percent,
    double percentWidth,
    int moduleNumber,
  ) {
    log(modulePosition.toString());
    double moduleScoreAvg = 0;
    // log("Score List $scoreAvg");
    for (int j = 0; j < scoreAvg[modulePosition].length; j++) {
      moduleScoreAvg += scoreAvg[modulePosition][j];
    }
    if (scoreAvg[modulePosition].isNotEmpty) {
      moduleScoreAvg = moduleScoreAvg / scoreAvg[modulePosition].length;
    }
    // log("Average Module Score $moduleScoreAvg");
    if (modulePosition == 0) {
      module1Score = moduleScoreAvg;
    }

    return Positioned(
      left: left,
      top: top,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (open) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ModuleEntryScreen(
                              moduleNumber: moduleNumber,
                              scores: scores,
                            )));
              }
            },
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              alignment: Alignment.centerLeft,
              decoration: shadowDecorationWithBorderColor(
                  const Color.fromARGB(100, 255, 255, 255), Colors.yellow, 20),
              margin: const EdgeInsets.symmetric(horizontal: 60),
              width: width,
              height: height,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Visibility(
            visible: size != 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: BouncingWidget(
                duration: const Duration(milliseconds: 400),
                scaleFactor: 1.5,
                onPressed: () async {},
                child: Image.asset(
                  image,
                  height: size,
                ),
              ),
            ),
          ),
          open
              ? Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: LinearPercentIndicator(
                    width: percentWidth,
                    animation: true,
                    lineHeight: 8,
                    animationDuration: 1000,
                    percent: moduleScoreAvg,
                    center: const Text(
                      "",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    barRadius: const Radius.circular(14),
                    progressColor: Colors.yellow,
                    backgroundColor: Colors.white,
                  ),
                )
              : modulePosition == 3
                  ? const SizedBox(
                      width: 60,
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              "မကြာမီ လာမည်။",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )),
                      ),
                    )
                  : SizedBox(
                      width: 60,
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: BouncingWidget(
                              duration: const Duration(milliseconds: 400),
                              scaleFactor: 1.5,
                              onPressed: () async {
                                await showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) => DownloadDialog3(
                                          moduleName: moduleName,
                                          moduleDisplayName: moduleDisplayName,
                                        ));
                                _setName();
                              },
                              child: Image.asset("assets/images/download.png",
                                  height: 32),
                            )),
                      ),
                    ),
        ],
      ),
    );
  }

  Widget moduleButton(
      bool open, String image, double size, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: AnimatedContainer(
        height: size,
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: BouncingWidget(
          duration: const Duration(milliseconds: 400),
          scaleFactor: 1.5,
          onPressed: () async {
            if (open) {
              Future.delayed(const Duration(milliseconds: 800), () {
                setState(() {
                  mm1ChapterDialog = !mm1ChapterDialog;
                });
              });
            }
          },
          child: Image.asset(
            image,
            height: size,
          ),
        ),
      ),
    );
  }

  Widget chapterButton(
      bool open,
      String image,
      double size,
      double left,
      double top,
      double percent,
      int modulePosition,
      int chapterPostion,
      String text) {
    double avgPercent = 0;
    if (open) {
      log(modulePosition.toString());
      for (int i = 0; i < scores[modulePosition][chapterPostion].length; i++) {
        avgPercent += scores[modulePosition][chapterPostion][i];
      }
      if (scores[modulePosition][chapterPostion].isNotEmpty) {
        avgPercent = avgPercent / scores[modulePosition][chapterPostion].length;
      }
    }

    setState(() {
      scoreAvg[modulePosition][chapterPostion] = avgPercent;
    });
    // log("Average Percent of $text is $avgPercent");

    return Positioned(
      left: left,
      top: top,
      child: AnimatedContainer(
        height: size + 8,
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: BouncingWidget(
          duration: const Duration(milliseconds: 400),
          scaleFactor: 1.5,
          onPressed: () async {
            if (open) {
              setState(() {
                mm1ChapterDialog = true;
                chapTitle = text.replaceAll("\n", "");
                chapList = subjects[modulePosition][chapterPostion];
                moduleIndex = modulePosition;
                chapterIndex = chapterPostion;
              });
              await showDialog(
                  context: context,
                  builder: (context) => MM1Chapter1Dialog(
                        moduleIndex: moduleIndex,
                        chanpterIndex: chapterIndex,
                        title: chapTitle,
                        chapList: chapList,
                        onTap: () {
                          setState(() {
                            mm1ChapterDialog = false;
                          });
                          Navigator.pop(context);
                        },
                        closeOnTap: () {
                          setState(() {
                            mm1ChapterDialog = false;
                          });
                        },
                      ));
              setState(() {
                mm1ChapterDialog = false;
              });
              _setName();
            }
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    image,
                    height: size,
                  ),
                  !open
                      ? SizedBox(
                          height: size,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Image.asset(
                                "assets/images/key_lock.png",
                                color: Colors.yellow,
                                width: 22,
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: size,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: LinearPercentIndicator(
                              width: 80,
                              animation: true,
                              lineHeight: 7,
                              animationDuration: 1000,
                              percent: avgPercent,
                              center: const Text(
                                "",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              barRadius: const Radius.circular(14),
                              progressColor: Colors.yellow,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget moduleIcon(
    bool open,
    String image,
    double size,
    double left,
    double top,
    int moduleNumber,
  ) {
    return Positioned(
      left: left,
      top: top,
      child: AnimatedContainer(
        height: size,
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: BouncingWidget(
          duration: const Duration(milliseconds: 400),
          scaleFactor: 1.5,
          onPressed: () async {
            Future.delayed(const Duration(milliseconds: 800), () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ModuleEntryScreen(
                            moduleNumber: moduleNumber,
                            scores: scores,
                          )));
            });
          },
          child: Image.asset(
            image,
            height: size,
          ),
        ),
      ),
    );
  }

  Widget titleSubject(String text, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: AnimatedContainer(
        height: 76,
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: BouncingWidget(
          duration: const Duration(milliseconds: 400),
          scaleFactor: 1.5,
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LessonProgress(
                  scores: scores,
                ),
              ),
            );
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/title_leaf.png",
                    height: 56,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 54, top: 14),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          height: 1.2,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const SizedBox(
                height: 5,
                width: 200,
                child: LinearProgressIndicator(
                  value: .6,
                  color: Colors.greenAccent,
                  backgroundColor: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getUserDataById() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    final response = await http.post(
      Uri.parse('https://wwf.360ed.com/api/view-user-progress'),
      headers: kHeaders(token),
      body: jsonEncode(
        {
          "user_id": widget.userId,
        },
      ),
    );
    log(jsonEncode({
      "user_id": widget.userId,
    }));
    log(response.body);
    final result = jsonDecode(response.body);
    if (result['code'] == 200) {
      var data = UserProgressResponse.fromJson(result);
      if (data.progressData!.progress!.subjects![0].modules != null) {
        setState(() {
          scoreString = data.progressData!.progress!.subjects![0].modules!;
          scores = JsonArrayConversion.convertJson3(
              jsonDecode(scoreString!).cast<dynamic>());
        });
      } else {
        log("data empty");
      }
    } else {}
    setState(() {});
  }
}
