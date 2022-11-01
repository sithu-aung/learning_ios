import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/src/auth/controller/auth_controller.dart';
import 'package:learning/src/auth/presentation/pravicy_policy_dialog.dart';
import 'package:learning/src/common_widget/button_image.dart';
import 'package:learning/src/common_widget/common_dialog.dart';
import 'package:learning/src/util/utils.dart';

class RegisterNameScreen extends ConsumerStatefulWidget {
  static const routeName = '/register_name';
  const RegisterNameScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterNameScreen> createState() => _RegisterNameScreenState();
}

class _RegisterNameScreenState extends ConsumerState<RegisterNameScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final professionalController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? stateSelected;
  String? categorySelected;
  bool agree = false;
  String? dateSelected;
  String? monthSelected;
  String? yearSelected;
  String? fireToken;
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

  int userNameValue = 0;
  int emailValue = 0;
  int phoneValue = 0;
  int passwordValue = 0;
  int confirmPasswordValue = 0;

  bool backButton = true;

  @override
  void initState() {
    super.initState();
    //getToken();
  }

  // getToken() {
  //   FirebaseMessaging.instance.getToken().then((value) {
  //     setState(() {
  //       fireToken = value;
  //       print(fireToken);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
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
            setState(() {
              userNameValue = 0;
              emailValue = 0;
              phoneValue = 0;
              passwordValue = 0;
              confirmPasswordValue = 0;
              backButton = true;
              FocusScope.of(context).unfocus();
            });
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
                if (userNameValue == 1 ||
                    emailValue == 1 ||
                    phoneValue == 1 ||
                    passwordValue == 1 ||
                    confirmPasswordValue == 1)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    color: Colors.white,
                    child: TextField(
                      controller: userNameValue == 1
                          ? userNameController
                          : emailValue == 1
                              ? emailController
                              : phoneValue == 1
                                  ? phoneController
                                  : passwordValue == 1
                                      ? passwordController
                                      : confirmPasswordValue == 1
                                          ? confirmPasswordController
                                          : null,
                      cursorColor: Colors.grey,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                if (backButton)
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
                  child: ContainerImage(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 80,
                    buttonText: 'Create New Account/အကောင့်သစ် ဖွင့်မယ်။',
                    buttonImage: 'assets/images/title_leaf.png',
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
                    child: ListView(
                      cacheExtent: 1000,
                      shrinkWrap: true,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color(
                                0xffffdcdc,
                              ),
                              border: Border.all(color: Colors.red, width: 2)),
                          child: const Text(
                            '* Indicates Required\nအချက်အလက်များကို မဖြစ်မနေထည့်ပေးရမည်',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Text.rich(
                          TextSpan(
                            text: 'User Name / အသုံးပြုသူအမည်',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: '  *',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        ),
                        TextFormField(
                          onFieldSubmitted: (value) {
                            setState(() {
                              userNameValue = 0;
                              backButton = true;
                            });
                          },
                          onTap: () {
                            setState(() {
                              userNameValue = 1;
                              backButton = false;
                            });
                          },
                          scrollPadding: const EdgeInsets.only(bottom: 40),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            height: 1.0,
                            color: Colors.black,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'User name is required';
                            }
                            return null;
                          },
                          controller: userNameController,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'\s')),
                          ],
                          decoration: const InputDecoration(
                            hintText: "User Name / အသုံးပြုသူအမည်",
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle:
                                TextStyle(fontSize: 15, color: Colors.grey),
                            contentPadding:
                                EdgeInsets.only(left: 20, right: 20),
                            border: InputBorder.none,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Text.rich(
                              TextSpan(
                                text: 'Date Of Birth / မွေးသက္ကရာဇ်',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text: '  *',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => CommonDialog(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 55),
                                      child: Column(
                                        children: const [
                                          Text(
                                            'မိမိရဲ့လျှို့ဝှက်နံပါတ်ကို မေ့သွားခဲ့ရင် မိမိရဲ့ မွေးသက္ကရာဇကို သုံးပြီး လျှို့ဝှက်နံပါတ်ကို ပြောင်းလဲနိုင်ပါတယ်။',
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                child: Image.asset(
                                  "assets/images/ic_info.png",
                                  width: 26,
                                ),
                                //  Text(
                                //   'i',
                                //   style: TextStyle(
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField2(
                                value: dateSelected,
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
                                  'Date',
                                  style: TextStyle(fontSize: 16),
                                ),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 30,
                                buttonHeight: 48,
                                buttonPadding:
                                    const EdgeInsets.only(left: 20, right: 10),
                                dropdownDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                items: dateList
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
                              flex: 1,
                              child: DropdownButtonFormField2(
                                value: monthSelected,
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
                                  'Month',
                                  style: TextStyle(fontSize: 16),
                                ),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 30,
                                buttonHeight: 48,
                                buttonPadding:
                                    const EdgeInsets.only(left: 20, right: 10),
                                dropdownDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                items: monthList
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
                              flex: 1,
                              child: DropdownButtonFormField2(
                                value: yearSelected,
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
                                  'Year',
                                  style: TextStyle(fontSize: 16),
                                ),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 30,
                                buttonHeight: 48,
                                buttonPadding:
                                    const EdgeInsets.only(left: 20, right: 10),
                                dropdownDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                items: yearList
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
                            buttonPadding:
                                const EdgeInsets.only(left: 20, right: 10),
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
                              if (value.toString().isEmpty || value == null) {
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
                          onFieldSubmitted: (value) {
                            setState(() {
                              emailValue = 0;
                              backButton = true;
                            });
                          },
                          onTap: () {
                            setState(() {
                              emailValue = 1;
                              backButton = false;
                            });
                          },
                          scrollPadding: const EdgeInsets.only(bottom: 40),
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
                            hintStyle:
                                TextStyle(fontSize: 15, color: Colors.grey),
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
                          onFieldSubmitted: (value) {
                            setState(() {
                              phoneValue = 0;
                              backButton = true;
                            });
                          },
                          onTap: () {
                            setState(() {
                              phoneValue = 1;
                              backButton = false;
                            });
                          },
                          scrollPadding: const EdgeInsets.only(bottom: 40),
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
                            hintStyle:
                                TextStyle(fontSize: 15, color: Colors.grey),
                            contentPadding:
                                EdgeInsets.only(left: 20, right: 20),
                            border: InputBorder.none,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text.rich(
                          TextSpan(
                              text: 'Category / အမျိုးအစား',
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
                          child: DropdownButtonFormField2(
                            value: categorySelected,
                            decoration: const InputDecoration(
                              isDense: true,
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                            ),
                            isExpanded: true,
                            hint: const Text(
                              "Category / အမျိုးအစား",
                              style: TextStyle(fontSize: 16),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 48,
                            buttonPadding:
                                const EdgeInsets.only(left: 20, right: 10),
                            dropdownDecoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            items: categoryItems
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
                              if (value == null || value.toString().isEmpty) {
                                return "Please Select Category";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                categorySelected = value.toString();
                              });
                            },
                            onSaved: (value) {
                              setState(() {
                                categorySelected = value.toString();
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        Visibility(
                          visible:
                              categorySelected == "Instructor / သင်တန်းနည်းပြ",
                          child: const Text(
                            'Professional Field / အသက်မွေးဝမ်းကျောင်းအလုပ်',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Visibility(
                          visible:
                              categorySelected == "Instructor / သင်တန်းနည်းပြ",
                          child: TextFormField(
                            scrollPadding: const EdgeInsets.only(bottom: 40),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value == null || value.toString().isEmpty) {
                                return "Professinal Field/ အသက်မွေး၀မ်ကျောင်းအလုပ် is Required";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                              height: 1.0,
                              color: Colors.black,
                            ),
                            controller: professionalController,
                            decoration: const InputDecoration(
                              hintText:
                                  "Professional Field / အသက်မွေးဝမ်းကျောင်းအလုပ်",
                              fillColor: Colors.white,
                              filled: true,
                              hintStyle:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                              contentPadding:
                                  EdgeInsets.only(left: 20, right: 20),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text.rich(
                          TextSpan(
                              text: 'Password / လျှို့ဝှက်နံပါတ်',
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
                        TextFormField(
                          onFieldSubmitted: (value) {
                            setState(() {
                              passwordValue = 0;
                              backButton = true;
                            });
                          },
                          onTap: () {
                            setState(() {
                              passwordValue = 1;
                              backButton = false;
                            });
                          },
                          scrollPadding: const EdgeInsets.only(bottom: 40),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.toString().isEmpty) {
                              return "Password is Required";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            height: 1.0,
                            color: Colors.black,
                          ),
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: "Password / လျှို့ဝှက်နံပါတ်",
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle:
                                TextStyle(fontSize: 15, color: Colors.grey),
                            contentPadding:
                                EdgeInsets.only(left: 20, right: 20),
                            border: InputBorder.none,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text.rich(
                          TextSpan(
                              text:
                                  'Confirm Password / လျှို့ဝှက်နံပါတ်ကို အတည်ပြုပါ။',
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
                        TextFormField(
                          onFieldSubmitted: (value) {
                            setState(() {
                              confirmPasswordValue = 0;
                              backButton = true;
                            });
                          },
                          onTap: () {
                            setState(() {
                              confirmPasswordValue = 1;
                              backButton = false;
                            });
                          },
                          scrollPadding: const EdgeInsets.only(bottom: 40),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.toString().isEmpty) {
                              return "Password is Required";
                            }
                            return null;
                          },
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            height: 1.0,
                            color: Colors.black,
                          ),
                          controller: confirmPasswordController,
                          decoration: const InputDecoration(
                            hintText: "Confirm Password / လျှို့ဝှက်နံပါတ်",
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle:
                                TextStyle(fontSize: 15, color: Colors.grey),
                            contentPadding:
                                EdgeInsets.only(left: 20, right: 20),
                            border: InputBorder.none,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  setState(() {
                                    agree = !agree;
                                  });
                                },
                                child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 16, left: 8),
                                    child: agree
                                        ? Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            child: Image.asset(
                                              "assets/images/check_green.png",
                                              width: 22,
                                            ),
                                          )
                                        : Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                    color: Colors.grey)),
                                          )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          "I agree ",
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    const PrivacyPolicyDialog());
                                          },
                                          child: const Text(
                                            'privacy policy',
                                            style:
                                                TextStyle(color: Colors.cyan),
                                          ),
                                        ),
                                        const Text('of 360ed.'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "360ed ရဲ့ ",
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    const PrivacyPolicyDialog());
                                          },
                                          child: const Text(
                                            'လုံခြုံရေးမူဝါဒ',
                                            style:
                                                TextStyle(color: Colors.cyan),
                                          ),
                                        ),
                                        const Text(' ကို သဘောတူပါတယ်။ '),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        if (agree &&
                            userNameController.text.isNotEmpty &&
                            stateSelected != null &&
                            categorySelected != null &&
                            dateSelected != null &&
                            monthSelected != null &&
                            yearSelected != null &&
                            passwordController.text.isNotEmpty &&
                            confirmPasswordController.text.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: ButtonImage(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 55,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  // register(
                                  //     context,
                                  //     userNameController.text.toString(),
                                  //     passwordController.text.toString(),
                                  //     confirmPasswordController.text.toString(),
                                  //     emailController.text.toString(),
                                  //     phoneController.text.toString(),
                                  //     "dob",
                                  //     stateSelected.toString(),
                                  //     categorySelected.toString(),
                                  //     professionalController.text.toString());
                                  ref
                                      .read(authControllerProvider.notifier)
                                      .register(
                                        name:
                                            userNameController.text.toString(),
                                        password:
                                            passwordController.text.toString(),
                                        passwordConfirm:
                                            confirmPasswordController.text
                                                .toString(),
                                        email: emailController.text.toString(),
                                        phone: phoneController.text.toString(),
                                        fireToken: fireToken ?? "",
                                        dob:
                                            "$yearSelected-${Util.convertMonthToString(monthSelected!)}-${dateSelected!.length == 1 ? "0$dateSelected" : dateSelected}",
                                        state: stateSelected.toString(),
                                        userType: categorySelected
                                            .toString()
                                            .toLowerCase()
                                            .split(" ")[0],
                                        profession: professionalController.text
                                            .toString(),
                                      );
                                }
                              },
                              buttonText:
                                  'Create Account / အကောင့်သစ် ဖွင့်မယ်။',
                              buttonImage: 'assets/images/button_green.png',
                            ),
                            // Stack(
                            //   children: [
                            //     Image.asset(
                            //       "assets/images/button_green.png",
                            //       width:
                            //           MediaQuery.of(context).size.width * 0.4,
                            //       height: 54,
                            //       fit: BoxFit.fill,
                            //     ),
                            //     const Padding(
                            //       padding: EdgeInsets.only(left: 42, top: 16),
                            //       child: Text(
                            //         "Create Account / အကောင့်သစ် ဖွင့်မယ်။",
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
                          )
                        else
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: ButtonImage(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 54,
                              onTap: () {},
                              buttonText:
                                  'Create Account / အကောင့်သစ် ဖွင့်မယ်။',
                              buttonImage: 'assets/images/check_answer.png',
                            ),
                            //  Stack(
                            //   children: [
                            //     Image.asset(
                            //       "assets/images/check_answer.png",
                            //       width:
                            //           MediaQuery.of(context).size.width * 0.4,
                            //       height: 54,
                            //       fit: BoxFit.fill,
                            //     ),
                            //     const Padding(
                            //       padding: EdgeInsets.only(left: 42, top: 16),
                            //       child: Text(
                            //         "Create Account / အကောင့်သစ် ဖွင့်မယ်။",
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
                      ], //assets/images/check_answer.png
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
