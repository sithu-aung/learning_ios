import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/src/common_widget/button_image.dart';
import 'package:learning/src/components/controller/edit_profile_controller.dart';
import 'package:learning/src/util/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEdit extends ConsumerStatefulWidget {
  static const routeName = '/register_name';
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends ConsumerState<ProfileEdit> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final professionalController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? stateSelected;
  String? categorySelected;
  bool isTerAndConditionAggress = false;
  String dateSelected = '1';
  String monthSelected = "January";
  String yearSelected = '1999';
  List<String> dateList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31'
  ];
  List<String> monthList = [
    //in short terms
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  List<String> yearList = [
    //from 1900 to 2022 in one suggestion
    '1900',
    '1901',
    '1902',
    '1903',
    '1904',
    '1905',
    '1906',
    '1907',
    '1908',
    '1909',
    '1910',
    '1911',
    '1912',
    '1913',
    '1914',
    '1915',
    '1916',
    '1917',
    '1918',
    '1919',
    '1920',
    '1921',
    '1922',
    '1923',
    '1924',
    '1925',
    '1926',
    '1927',
    '1928',
    '1929',
    '1930',
    '1931',
    '1932',
    '1933',
    '1934',
    '1935',
    '1936',
    '1937',
    '1938',
    '1939',
    '1940',
    '1941',
    '1942',
    '1943',
    '1944',
    '1945',
    '1946',
    '1947',
    '1948',
    '1949',
    '1950',
    '1951',
    '1952',
    '1953',
    '1954',
    '1955',
    '1956',
    '1957',
    '1958',
    '1959',
    '1960',
    '1961',
    '1962',
    '1963',
    '1964',
    '1965',
    '1966',
    '1967',
    '1968',
    '1969',
    '1970',
    '1971',
    '1972',
    '1973',
    '1974',
    '1975',
    '1976',
    '1977',
    '1978',
    '1979',
    '1980',
    '1981',
    '1982',
    '1983',
    '1984',
    '1985',
    '1986',
    '1987',
    '1988',
    '1989',
    '1990',
    '1991',
    '1992',
    '1993',
    '1994',
    '1995',
    '1996',
    '1997',
    '1998',
    '1999',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
  ];
  List<String> categoryItems = [
    "Farmer / လယ်သမား",
    "Instructor / သင်တန်းနည်းပြ"
  ];
  List<String> stateItems = [
    "ကချင်ပြည်နယ်",
    "ကယားပြည်နယ်",
    "ကရင်ပြည်နယ်",
    "ချင်းပြည်နယ်",
    "မွန်ပြည်နယ်",
    "ရခိုင်ပြည်နယ်",
    "ရှမ်းပြည်နယ်",
    "စစ်ကိုင်းတိုင်း",
    "တနင်္သာရီတိုင်း",
    "ပဲခူးတိုင်း",
    "မကွေးတိုင်း",
    "မန္တလေးတိုင်း",
    "ရန်ကုန်တိုင်း",
    "ဧရာဝတီတိုင်း",
    "မြန်မာနိုင်ငံပြင်ပ"
  ];

  bool isPassword = false;

  @override
  void initState() {
    super.initState();
    initial();
    log("Profile Edit Called");
  }

  initial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    log(prefs.getString("dob").toString());
    if (prefs.getString("phone") != null) {
      phoneController.text = prefs.getString("phone") ?? "";
    }

    if (prefs.getString("email") != null) {
      emailController.text = prefs.getString("email") ?? "";
    }

    if (prefs.getString("profession") != null) {
      professionalController.text = prefs.getString("email") ?? "";
    }

    if (prefs.getString("user_type") != null) {
      //professionalController.text = prefs.getString("email") ?? "";
    }

    if (prefs.getString("state") != null) {
      setState(() {
        stateSelected = prefs.getString("state") ?? "";
      });
    }
    if (prefs.getString("dob") != null) {
      String dob = prefs.getString("dob") ?? "";
      log(Util.convertStringToMonth(dob.split("-")[1]));
      log("Date ${dob.split("-")[2]}");
      setState(() {
        dateSelected = dob.split("-")[2].startsWith("0")
            ? dob.split("-")[2].replaceAll("0", "")
            : dob.split("-")[2];
        yearSelected = dob.split("-")[0];

        monthSelected = Util.convertStringToMonth(dob.split("-")[1]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(editProfileProvider);
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);
    return MediaQuery(
      data: mqDataNew,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/app_back.jpg",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    child: Image.asset(
                      'assets/images/ic_info.png',
                      width: 40,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Image.asset(
                      "assets/images/back.png",
                      width: 36,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.2,
                    top: 50,
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/wooden_six.png",
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.82,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Image.asset(
                          "assets/images/paper_medium_leafs.png",
                          width: MediaQuery.of(context).size.width * 0.62,
                          height: MediaQuery.of(context).size.height * 0.74,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.24,
                    top: 12,
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/title_leaf.png",
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: const EdgeInsets.only(top: 32),
                        child: const Text(
                          "ကိုယ်ရေးအချက်အလက်များ ပြင်ဆင်မယ်။",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              height: 1.2,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.26,
                      right: MediaQuery.of(context).size.width * 0.26,
                      top: MediaQuery.of(context).size.width * 0.14,
                      bottom: MediaQuery.of(context).size.height * 0.15),
                  child: Form(
                      key: _formKey,
                      child: !isPassword
                          ? ListView(
                              cacheExtent: 1000,
                              shrinkWrap: true,
                              children: [
                                // const Text.rich(
                                //   TextSpan(
                                //       text: 'User Name / အသုံးပြုသူအမည်',
                                //       style: TextStyle(
                                //         color: Colors.white,
                                //       ),
                                //       children: [
                                //         TextSpan(
                                //             text: '  *',
                                //             style: TextStyle(
                                //               color: Colors.red,
                                //             ))
                                //       ]),
                                // ),
                                // TextFormField(
                                //   scrollPadding: const EdgeInsets.only(bottom: 40),
                                //   textInputAction: TextInputAction.next,
                                //   keyboardType: TextInputType.text,
                                //   style: const TextStyle(
                                //     height: 1.0,
                                //     color: Colors.black,
                                //   ),
                                //   validator: (value) {
                                //     if (value!.isEmpty) {
                                //       return 'User name is required';
                                //     }
                                //     return null;
                                //   },
                                //   controller: userNameController,
                                //   inputFormatters: [
                                //     FilteringTextInputFormatter.deny(RegExp(r'\s')),
                                //   ],
                                //   decoration: const InputDecoration(
                                //     hintText: "User Name / အသုံးပြုသူအမည်",
                                //     fillColor: Colors.white,
                                //     filled: true,
                                //     hintStyle:
                                //         TextStyle(fontSize: 15, color: Colors.grey),
                                //     contentPadding: EdgeInsets.only(left: 20, right: 20),
                                //     border: InputBorder.none,
                                //   ),
                                // ),
                                // const SizedBox(height: 12),
                                const Text(
                                  'Date Of Birth / မွေးသက္ကရာဇ်',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: DropdownButtonFormField2(
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: EdgeInsets.zero,
                                          border: InputBorder.none,
                                        ),
                                        buttonDecoration: const BoxDecoration(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                        isExpanded: true,
                                        value: dateSelected,
                                        hint: Text(
                                          dateSelected,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black45,
                                        ),
                                        iconSize: 30,
                                        buttonHeight: 48,
                                        buttonPadding: const EdgeInsets.only(
                                            left: 20, right: 10),
                                        dropdownDecoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                        items: dateList
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        validator: (value) {
                                          if (value == null ||
                                              value.toString().isEmpty) {
                                            return "Please Select Birth Day";
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            dateSelected = value.toString();
                                          });
                                        },
                                        onSaved: (value) {
                                          setState(() {
                                            dateSelected = value.toString();
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      flex: 2,
                                      child: DropdownButtonFormField2(
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: EdgeInsets.zero,
                                          border: InputBorder.none,
                                        ),
                                        buttonDecoration: const BoxDecoration(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                        isExpanded: true,
                                        value: monthSelected,
                                        hint: Text(
                                          monthSelected,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black45,
                                        ),
                                        iconSize: 30,
                                        buttonHeight: 48,
                                        buttonPadding: const EdgeInsets.only(
                                            left: 20, right: 10),
                                        dropdownDecoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                        items: monthList
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        validator: (value) {
                                          if (value == null ||
                                              value.toString().isEmpty) {
                                            return "Please Select Birth Month";
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            monthSelected = value.toString();
                                          });
                                        },
                                        onSaved: (value) {
                                          setState(() {
                                            monthSelected = value.toString();
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      flex: 2,
                                      child: DropdownButtonFormField2(
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: EdgeInsets.zero,
                                          border: InputBorder.none,
                                        ),
                                        buttonDecoration: const BoxDecoration(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                        value: yearSelected,
                                        isExpanded: true,
                                        hint: Text(
                                          yearSelected,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black45,
                                        ),
                                        iconSize: 30,
                                        buttonHeight: 48,
                                        buttonPadding: const EdgeInsets.only(
                                            left: 20, right: 10),
                                        dropdownDecoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                        items: yearList
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        validator: (value) {
                                          if (value == null ||
                                              value.toString().isEmpty) {
                                            return "Please Select Birth Year";
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            yearSelected = value.toString();
                                          });
                                        },
                                        onSaved: (value) {
                                          yearSelected = value.toString();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                const Text.rich(
                                  TextSpan(
                                      text: 'State or Region / နေထိုင်ရာဒေသ',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: '  *',
                                            style: TextStyle(
                                              color: Colors.red,
                                            ))
                                      ]),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 0, right: 0, top: 0, bottom: 0),
                                  child: DropdownButtonFormField2<String>(
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      fillColor: Colors.white,
                                      filled: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: InputBorder.none,
                                    ),
                                    buttonDecoration: const BoxDecoration(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    isExpanded: true,
                                    hint: const Text(
                                      "State or Region / နေထိုင်ရာဒေသ",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 48,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    value: stateSelected,
                                    items: stateItems
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {
                                      if (value.toString().isEmpty ||
                                          value == null) {
                                        return "Please Select State/Region";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        stateSelected = value.toString();
                                      });
                                    },
                                    onSaved: (value) {
                                      setState(() {
                                        stateSelected = value.toString();
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'Email / အီးမေးလ်',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                TextFormField(
                                  scrollPadding:
                                      const EdgeInsets.only(bottom: 40),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(
                                    height: 1.0,
                                    color: Colors.black,
                                  ),
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    hintText: "Email / အီးမေးလ်",
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintStyle: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                    contentPadding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    border: InputBorder.none,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'Phone / ဖုန်းနံပါတ်',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                TextFormField(
                                  scrollPadding:
                                      const EdgeInsets.only(bottom: 40),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                    height: 1.0,
                                    color: Colors.black,
                                  ),
                                  controller: phoneController,
                                  decoration: const InputDecoration(
                                    hintText: "Phone / ဖုန်းနံပါတ်",
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintStyle: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                    contentPadding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    border: InputBorder.none,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'Old Password / လျှို့ဝှက်နံပါတ် အဟောင်း',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                TextFormField(
                                  scrollPadding:
                                      const EdgeInsets.only(bottom: 40),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                    height: 1.0,
                                    color: Colors.black,
                                  ),
                                  controller: oldPasswordController,
                                  decoration: const InputDecoration(
                                    hintText:
                                        "Old Password / လျှို့ဝှက်နံပါတ် အဟောင်း",
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintStyle: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                    contentPadding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    border: InputBorder.none,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'New Password / လျှို့ဝှက်နံပါတ် အသစ်',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                TextFormField(
                                  scrollPadding:
                                      const EdgeInsets.only(bottom: 40),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                    height: 1.0,
                                    color: Colors.black,
                                  ),
                                  controller: passwordController,
                                  decoration: const InputDecoration(
                                    hintText:
                                        "New Password / လျှို့ဝှက်နံပါတ် အသစ်",
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintStyle: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                    contentPadding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    border: InputBorder.none,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'Confirm New Password/လျှို့ဝှက်နံပါတ် အသစ်ကို အတည်ပြုပါ။',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                TextFormField(
                                  scrollPadding:
                                      const EdgeInsets.only(bottom: 40),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                    height: 1.0,
                                    color: Colors.black,
                                  ),
                                  controller: confirmPasswordController,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    hintText:
                                        "လျှို့ဝှက်နံပါတ် အသစ်ကို အတည်ပြုပါ။",
                                    filled: true,
                                    hintStyle: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                    contentPadding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    border: InputBorder.none,
                                  ),
                                ),
                                // const SizedBox(height: 12),
                                // const Text.rich(
                                //   TextSpan(
                                //       text: 'Category / အမျိုးအစား',
                                //       style: TextStyle(
                                //         color: Colors.white,
                                //       ),
                                //       children: [
                                //         TextSpan(
                                //             text: '  *',
                                //             style: TextStyle(
                                //               color: Colors.red,
                                //             ))
                                //       ]),
                                // ),
                                // Container(
                                //   margin: const EdgeInsets.only(
                                //       left: 0, right: 0, top: 0, bottom: 0),
                                //   child: DropdownButtonFormField2(
                                //     decoration: const InputDecoration(
                                //       isDense: true,
                                //       fillColor: Colors.white,
                                //       filled: true,
                                //       contentPadding: EdgeInsets.zero,
                                //       border: InputBorder.none,
                                //     ),
                                //     isExpanded: true,
                                //     hint: const Text(
                                //       "Category / အမျိုးအစား",
                                //       style: TextStyle(fontSize: 16),
                                //     ),
                                //     icon: const Icon(
                                //       Icons.arrow_drop_down,
                                //       color: Colors.black45,
                                //     ),
                                //     iconSize: 30,
                                //     buttonHeight: 48,
                                //     buttonPadding:
                                //         const EdgeInsets.only(left: 20, right: 10),
                                //     dropdownDecoration: BoxDecoration(
                                //       color: Colors.white,
                                //       borderRadius: BorderRadius.circular(0),
                                //     ),
                                //     items: categoryItems
                                //         .map((item) => DropdownMenuItem<String>(
                                //               value: item,
                                //               child: Text(
                                //                 item,
                                //                 style: const TextStyle(
                                //                   fontSize: 14,
                                //                 ),
                                //               ),
                                //             ))
                                //         .toList(),
                                //     validator: (value) {
                                //       if (value == null || value.toString().isEmpty) {
                                //         return "Please Select Category";
                                //       }
                                //       return null;
                                //     },
                                //     onChanged: (value) {
                                //       setState(() {
                                //         categorySelected = value.toString();
                                //       });
                                //     },
                                //     onSaved: (value) {
                                //       setState(() {
                                //         categorySelected = value.toString();
                                //       });
                                //     },
                                //   ),
                                // ),
                                // const SizedBox(height: 12),
                                // Visibility(
                                //   visible:
                                //       categorySelected == "Instructor / သင်တန်းနည်းပြ",
                                //   child: const Text(
                                //     'Professional Field / အသက်မွေးဝမ်းကျောင်းအလုပ်',
                                //     style: TextStyle(
                                //       color: Colors.white,
                                //     ),
                                //   ),
                                // ),
                                // Visibility(
                                //   visible:
                                //       categorySelected == "Instructor / သင်တန်းနည်းပြ",
                                //   child: TextFormField(
                                //     scrollPadding: const EdgeInsets.only(bottom: 40),
                                //     textInputAction: TextInputAction.next,
                                //     validator: (value) {
                                //       if (value == null || value.toString().isEmpty) {
                                //         return "Professinal Field/ အသက်မွေး၀မ်ကျောင်းအလုပ် is Required";
                                //       }
                                //       return null;
                                //     },
                                //     keyboardType: TextInputType.text,
                                //     style: const TextStyle(
                                //       height: 1.0,
                                //       color: Colors.black,
                                //     ),
                                //     controller: professionalController,
                                //     decoration: const InputDecoration(
                                //       hintText:
                                //           "Professional Field / အသက်မွေးဝမ်းကျောင်းအလုပ်",
                                //       fillColor: Colors.white,
                                //       filled: true,
                                //       hintStyle:
                                //           TextStyle(fontSize: 15, color: Colors.grey),
                                //       contentPadding:
                                //           EdgeInsets.only(left: 20, right: 20),
                                //       border: InputBorder.none,
                                //     ),
                                //   ),
                                // ),
                                // const SizedBox(
                                //   height: 12,
                                // ),
                                // const Text.rich(
                                //   TextSpan(
                                //       text: 'Password / လျှို့ဝှက်နံပါတ်',
                                //       style: TextStyle(
                                //         color: Colors.white,
                                //       ),
                                //       children: [
                                //         TextSpan(
                                //             text: '  *',
                                //             style: TextStyle(
                                //               color: Colors.red,
                                //             ))
                                //       ]),
                                // ),
                                // TextFormField(
                                //   scrollPadding: const EdgeInsets.only(bottom: 40),
                                //   textInputAction: TextInputAction.next,
                                //   validator: (value) {
                                //     if (value == null || value.toString().isEmpty) {
                                //       return "Password is Required";
                                //     }
                                //     return null;
                                //   },
                                //   keyboardType: TextInputType.text,
                                //   style: const TextStyle(
                                //     height: 1.0,
                                //     color: Colors.black,
                                //   ),
                                //   controller: passwordController,
                                //   obscureText: true,
                                //   decoration: const InputDecoration(
                                //     hintText: "Password / လျှို့ဝှက်နံပါတ်",
                                //     fillColor: Colors.white,
                                //     filled: true,
                                //     hintStyle:
                                //         TextStyle(fontSize: 15, color: Colors.grey),
                                //     contentPadding: EdgeInsets.only(left: 20, right: 20),
                                //     border: InputBorder.none,
                                //   ),
                                // ),
                                // const SizedBox(
                                //   height: 12,
                                // ),
                                // const Text.rich(
                                //   TextSpan(
                                //       text:
                                //           'Confirm Password / လျှို့ဝှက်နံပါတ်ကို အတည်ပြုပါ။',
                                //       style: TextStyle(
                                //         color: Colors.white,
                                //       ),
                                //       children: [
                                //         TextSpan(
                                //             text: '  *',
                                //             style: TextStyle(
                                //               color: Colors.red,
                                //             ))
                                //       ]),
                                // ),
                                // TextFormField(
                                //   scrollPadding: const EdgeInsets.only(bottom: 40),
                                //   textInputAction: TextInputAction.next,
                                //   validator: (value) {
                                //     if (value == null || value.toString().isEmpty) {
                                //       return "Password is Required";
                                //     }
                                //     return null;
                                //   },
                                //   obscureText: true,
                                //   keyboardType: TextInputType.text,
                                //   style: const TextStyle(
                                //     height: 1.0,
                                //     color: Colors.black,
                                //   ),
                                //   controller: confirmPasswordController,
                                //   decoration: const InputDecoration(
                                //     hintText: "Confirm Password / လျှို့ဝှက်နံပါတ်",
                                //     fillColor: Colors.white,
                                //     filled: true,
                                //     hintStyle:
                                //         TextStyle(fontSize: 15, color: Colors.grey),
                                //     contentPadding: EdgeInsets.only(left: 20, right: 20),
                                //     border: InputBorder.none,
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 100, right: 100),
                                  child: ButtonImage(
                                    state: state.isLoading,
                                    width: 150,
                                    height: 45,
                                    onTap: () {
                                      // if (_formKey.currentState!.validate()) {
                                      //   _formKey.currentState!.save();
                                      // }
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (context) => Dialog(
                                      //     backgroundColor: Colors.transparent,
                                      //     child: Stack(
                                      //       children: [
                                      //         Container(
                                      //           decoration: BoxDecoration(
                                      //             image: DecorationImage(
                                      //                 image: AssetImage(
                                      //                     'assets/images/paper_medium_leafs.png'),
                                      //                 fit: BoxFit.fill),
                                      //           ),
                                      //           width: 300,
                                      //           height: 200,
                                      //         ),
                                      //         Container(
                                      //           width: 250,
                                      //           height: 50,
                                      //           child: Image.asset(
                                      //             'assets/images/title_leaf.png',
                                      //             fit: BoxFit.fill,
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // );
                                      ref
                                          .read(editProfileProvider.notifier)
                                          .editProfile(
                                            dob:
                                                "$yearSelected-${Util.convertMonthToString(monthSelected)}-${dateSelected.length == 1 ? "0$dateSelected" : dateSelected}",
                                            state: stateSelected!,
                                            email:
                                                emailController.text.toString(),
                                            phone:
                                                phoneController.text.toString(),
                                            oldPassword: oldPasswordController
                                                .text
                                                .toString(),
                                            newPassword: passwordController.text
                                                .toString(),
                                            confirmPassword:
                                                confirmPasswordController.text
                                                    .toString(),
                                          );
                                    },
                                    buttonText: 'သိမ်းမယ်။',
                                    buttonImage:
                                        'assets/images/button_green.png',
                                  ),
                                  //  Stack(
                                  //   children: [
                                  //     Image.asset(
                                  //       "assets/images/button_green.png",
                                  //       width: MediaQuery.of(context).size.width * 0.2,
                                  //       height: 54,
                                  //       fit: BoxFit.fill,
                                  //     ),
                                  //     Container(
                                  //       width: MediaQuery.of(context).size.width * 0.2,
                                  //       height: 54,
                                  //       padding: const EdgeInsets.only(top: 16),
                                  //       child: const Text(
                                  //         "သိမ်းမယ်။",
                                  //         textAlign: TextAlign.center,
                                  //         style: TextStyle(
                                  //           color: Colors.white,
                                  //           fontSize: 15,
                                  //           height: 1.2,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            )
                          : ListView(
                              children: [
                                const Text(
                                  'Old Password / လျှို့ဝှက်နံပါတ် အဟောင်း',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                TextFormField(
                                  scrollPadding:
                                      const EdgeInsets.only(bottom: 40),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                    height: 1.0,
                                    color: Colors.black,
                                  ),
                                  controller: oldPasswordController,
                                  decoration: const InputDecoration(
                                    hintText:
                                        "Old Password / လျှို့ဝှက်နံပါတ် အဟောင်း",
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintStyle: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                    contentPadding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    border: InputBorder.none,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'New Password / လျှို့ဝှက်နံပါတ် အသစ်',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                TextFormField(
                                  scrollPadding:
                                      const EdgeInsets.only(bottom: 40),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                    height: 1.0,
                                    color: Colors.black,
                                  ),
                                  controller: passwordController,
                                  decoration: const InputDecoration(
                                    hintText:
                                        "New Password / လျှို့ဝှက်နံပါတ် အသစ်",
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintStyle: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                    contentPadding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    border: InputBorder.none,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'Confirm New Password/လျှို့ဝှက်နံပါတ် အသစ်ကို အတည်ပြုပါ။',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                TextFormField(
                                  scrollPadding:
                                      const EdgeInsets.only(bottom: 40),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                    height: 1.0,
                                    color: Colors.black,
                                  ),
                                  controller: confirmPasswordController,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    hintText:
                                        "လျှို့ဝှက်နံပါတ် အသစ်ကို အတည်ပြုပါ။",
                                    filled: true,
                                    hintStyle: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                    contentPadding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    border: InputBorder.none,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 100, right: 100),
                                  child: ButtonImage(
                                    state: state.isLoading,
                                    width: 150,
                                    height: 45,
                                    onTap: () {
                                      // if (_formKey.currentState!.validate()) {
                                      //   _formKey.currentState!.save();
                                      // }
                                    },
                                    buttonText: 'သိမ်းမယ်။',
                                    buttonImage:
                                        'assets/images/button_green.png',
                                  ),
                                ),
                              ],
                            )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
