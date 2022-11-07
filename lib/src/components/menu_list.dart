import 'package:flutter/material.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_intro_hearder.dart';
import 'package:learning/src/menu_list_detail/about_application.dart';
import 'package:learning/src/menu_list_detail/help.dart';
import 'package:learning/src/menu_list_detail/member.dart';
import 'package:learning/src/menu_list_detail/quit_app.dart';
import 'package:learning/src/menu_list_detail/references.dart';
import 'package:learning/src/menu_list_detail/setting.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuListScreen extends StatefulWidget {
  const MenuListScreen({Key? key}) : super(key: key);

  @override
  State<MenuListScreen> createState() => _MenuListScreenState();
}

class _MenuListScreenState extends State<MenuListScreen> {
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
                  backImage: "assets/images/app_back.jpg",
                ),
                ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SectionIntroHearderWithoutMenu(
                        onTap: () {},
                        title: "စာရင်းများ",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AboutApplication(),
                                    ));
                              },
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/button_green.png",
                                    height: 84,
                                  ),
                                  const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 22),
                                      child: Text(
                                        "စိုက်ဓလေ့ အကြောင်း",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Help(),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/button_yellow.png",
                                    height: 84,
                                  ),
                                  const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 22),
                                      child: Text(
                                        "အကူအညီ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () => launchUrl(Uri.parse(
                                  "https://www.360ed.org/privacy-policy/")),
                              // onTap: () => Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => const PrivacyPolicy(),
                              //     )),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/button_blue.png",
                                    height: 84,
                                  ),
                                  const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 22),
                                      child: Text(
                                        "လုံခြုံရေးမူဝါဒ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Stack(
                              children: [
                                Image.asset(
                                  "assets/images/button_green.png",
                                  height: 84,
                                ),
                                const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 22),
                                    child: Text(
                                      "အသုံးပြုလမ်းညွှန်",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: Stack(
                              children: [
                                Image.asset(
                                  "assets/images/button_yellow.png",
                                  height: 84,
                                ),
                                const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 22),
                                    child: Text(
                                      "အဆင့်သတ်မှတ်ရန်",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => const OtherApp(),
                                //   ),
                                // );
                              },
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/button_blue.png",
                                    height: 84,
                                  ),
                                  const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 22),
                                      child: Text(
                                        "အခြား Application များ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Members(),
                                  )),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/button_green.png",
                                    height: 84,
                                  ),
                                  const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 22),
                                      child: Text(
                                        "ပါဝင်သူများ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const References(),
                                  )),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/button_yellow.png",
                                    height: 84,
                                  ),
                                  const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 22),
                                      child: Text(
                                        "အညွှန်းကိုးကားချက်များ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Setting(),
                                  )),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/button_blue.png",
                                    height: 84,
                                  ),
                                  const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 22),
                                      child: Text(
                                        "Setting",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(flex: 1, child: Container()),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => const QuitApplication(),
                                );
                              },
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/button_yellow.png",
                                    height: 84,
                                  ),
                                  const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 22),
                                      child: Text(
                                        "Application မှ ထွက်မည်။",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(flex: 1, child: Container())
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ],
            )));
  }
}
