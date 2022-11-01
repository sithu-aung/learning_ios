import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/src/auth/controller/auth_controller.dart';
import 'package:learning/src/common_widget/button_image.dart';

class ForgotPasswordWithEmail extends ConsumerStatefulWidget {
  const ForgotPasswordWithEmail({super.key});
  static const route = 'ForgotPasswordWithEmailRoute';

  @override
  ConsumerState<ForgotPasswordWithEmail> createState() =>
      _ForgotPasswordWithEmailState();
}

class _ForgotPasswordWithEmailState
    extends ConsumerState<ForgotPasswordWithEmail> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  int emailValue = 0;

  bool backButton = true;

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
              emailValue = 0;
              backButton = true;
              FocusScope.of(context).unfocus();
            });
          },
          child: Stack(
            children: [
              Image.asset(
                "assets/images/app_back.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
              if (emailValue == 1)
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.white,
                  child: TextField(
                    controller: _controller,
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
                  left: MediaQuery.of(context).size.width * 0.3,
                  top: MediaQuery.of(context).size.height * 0.32,
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/wooden_six.png",
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: MediaQuery.of(context).size.height * 0.64,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Image.asset(
                        "assets/images/paper_medium_leafs.png",
                        width: MediaQuery.of(context).size.width * 0.42,
                        height: MediaQuery.of(context).size.height * 0.64,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.3,
                  top: MediaQuery.of(context).size.height * 0.2,
                ),
                child: Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 80,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/title_leaf.png'),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'လျှို့၀ှက်နံပါတ်ပြောင်းမယ်',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Positioned.fill(
                top: 50,
                child: Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.28,
                    right: MediaQuery.of(context).size.width * 0.28,
                    top: MediaQuery.of(context).size.width * 0.14,
                    bottom: MediaQuery.of(context).size.height * 0.15,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'လျှို့ဝှက်နံပါတ်ပြောင်းမဲ့ အီးမေးလ်အကောင့်ကို ထည့်သွင်းပေးပါ။',
                          style: TextStyle(
                            height: 1.3,
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Material(
                            elevation: 2,
                            child: TextFormField(
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
                              style: const TextStyle(color: Colors.black),
                              controller: _controller,
                              decoration: const InputDecoration(
                                filled: true,
                                isDense: true,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ButtonImage(
                            width: 120,
                            height: 45,
                            onTap: () async {
                              await ref
                                  .read(authControllerProvider.notifier)
                                  .forgetPassword(
                                      type: ForgetPasswordType.email,
                                      email: _controller.text);
                            },
                            buttonText: 'ပို့မယ်။',
                            buttonImage: 'assets/images/button_green_round.png')
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
