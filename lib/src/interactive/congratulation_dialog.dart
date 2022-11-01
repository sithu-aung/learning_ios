import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/common_widget/button_image.dart';

class CongrulationDialog extends StatelessWidget {
  const CongrulationDialog({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.homeOnTap,
    required this.nextOnTap,
  });
  final String firstText;
  final String secondText;

  final GestureTapCallback homeOnTap;
  final GestureTapCallback nextOnTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        height: 320,
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Image.asset(
                      'assets/images/wooden_six.png',
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.7,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, left: 30, right: 40),
                    child: Image.asset(
                      'assets/images/papersmall.png',
                      width: MediaQuery.of(context).size.width * 0.5,
                      fit: BoxFit.fill,
                      //scale: isPolicy ? 1.8 : 1.5,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: MediaQuery.of(context).size.width * 0.01,
                    right: 0,
                    child: Container(
                      width: 50,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/title_leaf.png',
                          ),
                        ),
                      ),
                      child: Container(
                        height: 70,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 55, vertical: 5),
                        child: const Center(
                          child: Text(
                            'အောင်မြင်ပါတယ်။',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  secondText != "end"
                      ? Container(
                          width: 300,
                          margin: const EdgeInsets.only(
                              top: 50, bottom: 12, right: 40, left: 40),
                          child: ListView(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(
                                        top: 40,
                                        left: 50,
                                        right: 50,
                                      ),
                                      child: Text("$firstText ပြီးပါပြီ။")),
                                  const Text('နောက်သင်ခန်းစာ ဖြစ်တဲ့'),
                                  Text(
                                    "$secondText သို့ \nဆက်သွားမလား။",
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ButtonImage(
                                      width: 110,
                                      height: 45,
                                      onTap: homeOnTap,
                                      buttonText: 'အိမ်သို့',
                                      buttonImage:
                                          'assets/images/button_orange_frame.png'),
                                  const SizedBox(width: 30),
                                  ButtonImage(
                                      width: 110,
                                      height: 45,
                                      onTap: nextOnTap,
                                      buttonText: 'ရှေ့သို့',
                                      buttonImage:
                                          'assets/images/button_green_round.png'),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 50, bottom: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 60, right: 60, top: 20),
                                    child: Text("$firstText ပြီးပါပြီ။"),
                                  ),
                                  //  Text('၁.၁။ မြေဆီလွှာဆိုသည်မာ အဘယ်နည်း'),
                                ],
                              ),
                              ButtonImage(
                                  width: 110,
                                  height: 45,
                                  onTap: homeOnTap,
                                  buttonText: 'အိမ်သို့',
                                  buttonImage:
                                      'assets/images/button_orange_frame.png'),
                            ],
                          ),
                        ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: BouncingWidget(
                      onPressed: () => Navigator.pop(context),
                      child: Image.asset(
                        'assets/images/close.png',
                        scale: 2,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CongrulationEndDialog extends StatelessWidget {
  const CongrulationEndDialog({
    super.key,
    required this.firstText,
    required this.homeOnTap,
  });
  final String firstText;

  final GestureTapCallback homeOnTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        height: 320,
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Image.asset(
                      'assets/images/wooden_six.png',
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.7,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, left: 30, right: 40),
                    child: Image.asset(
                      'assets/images/papersmall.png',
                      width: MediaQuery.of(context).size.width * 0.5,
                      fit: BoxFit.fill,
                      //scale: isPolicy ? 1.8 : 1.5,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: MediaQuery.of(context).size.width * 0.01,
                    right: 0,
                    child: Container(
                      width: 50,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/title_leaf.png',
                          ),
                        ),
                      ),
                      child: Container(
                        height: 70,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 55, vertical: 5),
                        child: const Center(
                          child: Text(
                            'အောင်မြင်ပါတယ်။',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 60, right: 60, top: 20),
                              child: Text("$firstText ပြီးပါပြီ။"),
                            ),
                            //  Text('၁.၁။ မြေဆီလွှာဆိုသည်မာ အဘယ်နည်း'),
                          ],
                        ),
                        ButtonImage(
                            width: 110,
                            height: 45,
                            onTap: homeOnTap,
                            buttonText: 'အိမ်သို့',
                            buttonImage:
                                'assets/images/button_orange_frame.png'),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: BouncingWidget(
                      onPressed: () => Navigator.pop(context),
                      child: Image.asset(
                        'assets/images/close.png',
                        scale: 2,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
