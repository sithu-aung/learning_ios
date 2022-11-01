import 'package:flutter/material.dart';
import 'package:learning/src/components/menu_list.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_intro_hearder.dart';

class MenuListTextWidget extends StatelessWidget {
  const MenuListTextWidget({
    super.key,
    required this.title,
    required this.text,
    this.widget,
    this.widgetStatus = false,
  });
  final String title;
  final String text;
  final Widget? widget;
  final bool widgetStatus;
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SectionIntroHearderWithoutMenu(
                        // onTap: () {},
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MenuListScreen(),
                            )),
                        title: title,
                      ),
                    ),
                    Expanded(
                      child: widgetStatus
                          ? widget!
                          : Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Image.asset(
                                      'assets/images/papersmall.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  ListView(
                                    shrinkWrap: true,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 30, 30, 30),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.8,
                                        child: SingleChildScrollView(
                                          child: Text(
                                            text,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              wordSpacing: 1.2,
                                              height: 1.5,
                                              // letterSpacing: 0.7,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
