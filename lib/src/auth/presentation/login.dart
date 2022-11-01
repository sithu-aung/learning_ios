import 'dart:convert';
import 'dart:developer';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:learning/data/response/auth_response.dart';
import 'package:learning/src/auth/controller/auth_controller.dart';
import 'package:learning/src/auth/presentation/forgot_password_type.dart';
import 'package:learning/src/auth/presentation/register_name.dart';
import 'package:learning/src/common_widget/button_image.dart';
import 'package:learning/src/common_widget/common_error_dialog.dart';
import 'package:learning/src/common_widget/error_dialog.dart';
import 'package:learning/src/main_map/presentation/farmer_map.dart';
import 'package:learning/tool_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  int textFieldValue = 0;
  int passwordFieldValue = 0;
  String? fireToken = "";

  FocusNode focusNode = FocusNode(canRequestFocus: false);

  @override
  void initState() {
    super.initState();
   // getToken();
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
              FocusScope.of(context).unfocus();
              focusNode;
              textFieldValue = 0;
              passwordFieldValue = 0;
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
                if (textFieldValue == 1 || passwordFieldValue == 1)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    color: Colors.white,
                    child: TextField(
                      cursorColor: Colors.grey,
                      style: const TextStyle(color: Colors.grey),
                      controller: textFieldValue == 1
                          ? userNameController
                          : passwordFieldValue == 1
                              ? passwordController
                              : null,
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/wooden_four.png",
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.75,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Image.asset(
                          "assets/images/paper_medium_leafs.png",
                          width: MediaQuery.of(context).size.width * 0.42,
                          height: MediaQuery.of(context).size.height * 0.67,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.65,
                    top: 26,
                  ),
                  child: Image.asset(
                    "assets/images/app_logo.png",
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.53,
                    top: MediaQuery.of(context).size.height * 0.47,
                  ),
                  child: Image.asset(
                    "assets/images/wooden_small.png",
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.56,
                    top: MediaQuery.of(context).size.height * 0.49,
                  ),
                  child: Image.asset(
                    "assets/images/papersmall.png",
                    width: MediaQuery.of(context).size.width * 0.31,
                    height: 86,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.58,
                    top: MediaQuery.of(context).size.height * 0.51,
                  ),
                  child: ButtonImage(
                    width: MediaQuery.of(context).size.width * 0.26,
                    height: 70,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RegisterNameScreen()));
                    },
                    buttonText: 'Create New Account\nအကောင့်သစ်ဖွင့်မယ်။',
                    buttonImage: 'assets/images/button_green_round.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.48,
                    top: MediaQuery.of(context).size.height * 0.46,
                  ),
                  child: Image.asset(
                    "assets/images/wooden_ring_2.png",
                    width: 68,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.11,
                    top: MediaQuery.of(context).size.width * 0.06,
                  ),
                  child: ContainerImage(
                    width: MediaQuery.of(context).size.width * 0.39,
                    height: 70,
                    buttonText: 'Login/လော့ဂ်အင် ဝင်မယ်။',
                    buttonImage: 'assets/images/title_leaf.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.16,
                    top: MediaQuery.of(context).size.width * 0.15,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                    height: 42,
                    child: TextField(
                      onSubmitted: (value) {
                        setState(() {
                          textFieldValue = 0;
                        });
                      },
                      focusNode: focusNode,
                      onTap: () {
                        setState(() {
                          textFieldValue = 1;
                        });
                      },
                      keyboardType: TextInputType.text,
                      // style: const TextStyle(
                      //   height: 1.0,
                      //   color: Colors.black,
                      // ),

                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],
                      style: const TextStyle(color: Colors.black),
                      controller: userNameController,
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: "User Name/အသုံးပြုသူအမည်",
                        labelStyle: TextStyle(color: Colors.black),
                        counterText: "",
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                        contentPadding:
                            EdgeInsets.only(left: 8, top: 12, bottom: 12),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.16,
                    top: MediaQuery.of(context).size.width * 0.213,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                    height: 42,
                    child: TextField(
                      onSubmitted: (value) {
                        setState(() {
                          passwordFieldValue = 0;
                        });
                      },
                      onTap: () {
                        setState(() {
                          passwordFieldValue = 1;
                        });
                      },
                      keyboardType: TextInputType.text,
                      maxLength: 11,
                      style: const TextStyle(
                        height: 1.0,
                        color: Colors.black,
                      ),
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: "Password/လျှို့ဝှက်နံပါတ်",
                        labelStyle: TextStyle(color: Colors.black),
                        counterText: "",
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                        contentPadding:
                            EdgeInsets.only(left: 8, top: 12, bottom: 12),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.16,
                    top: MediaQuery.of(context).size.width * 0.28,
                  ),
                  child: Consumer(builder: (context, ref, _) {
                    return ButtonImage(
                      width: MediaQuery.of(context).size.width * 0.28,
                      height: 50,
                      onTap: () {
                        login(
                            context,
                            userNameController.text.toString(),
                            passwordController.text.toString(),
                            fireToken ?? "",
                            ref);
                      },
                      buttonText: 'Login/လော့ဂ်အင် ဝင်မယ်။',
                      buttonImage: 'assets/images/button_green_round.png',
                    );
                  }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15,
                    top: MediaQuery.of(context).size.width * 0.28,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ForgotPasswordTypeScreen()),
                      );
                    },
                    child: Container(
                      decoration: shadowDecorationWithBorderColor(
                          const Color.fromARGB(200, 113, 101, 45),
                          const Color.fromARGB(180, 113, 101, 45),
                          12),
                      margin: const EdgeInsets.only(top: 60),
                      width: MediaQuery.of(context).size.width * 0.28,
                      height: 52,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 12, top: 8),
                        child: Text(
                          "Forgot Password?\nလျှို့ဝှက်နံပါတ် မေ့နေလား။",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  login(BuildContext context, String name, String password, String fireToken,
      WidgetRef ref) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      'content-type': 'application/json',
    };

    log('https://wwf.360ed.com/api/login');
    final response = await http.post(
        Uri.parse('https://wwf.360ed.com/api/login'),
        headers: headers,
        body: jsonEncode(<String, String>{
          'username': name,
          'password': password,
          'device_token': fireToken
        }));
    log(jsonEncode(<String, String>{
      'username': name,
      'password': password,
      'device_token': fireToken
    }));
    log(response.statusCode.toString());
    print(response.body);
    final result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (result['code'] == 200) {
        AuthResponse data = AuthResponse.fromJson(jsonDecode(response.body));
        if (data.code == 200) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("token", data.apiToken.toString());
          if (data.user != null) {
            if (data.user!.userName != null) {
              prefs.setString("name", data.user!.userName!.toString());
            }
            if (data.user!.age != null) {
              prefs.setString("age", data.user!.age!.toString());
            }
            if (data.user!.phone != null) {
              prefs.setString("phone", data.user!.phone!.toString());
            }
            if (data.user!.email != null) {
              prefs.setString("email", data.user!.email!.toString());
            }
            if (data.user!.profession != null) {
              prefs.setString("profession", data.user!.profession!.toString());
            }
            if (data.user!.userType != null) {
              prefs.setString("user_type", data.user!.userType!.toString());
            }
            if (data.user!.state != null) {
              prefs.setString("state", data.user!.state!.toString());
            }
            if (data.user!.dob != null) {
              prefs.setString("dob", data.user!.dob!.toString());
            }
            if (data.user!.sId != null) {
              prefs.setString("s_id", data.user!.sId!.toString());
            }
            if (data.user!.createdAt != null) {
              prefs.setString("created_at", data.user!.createdAt!.toString());
            }
            if (data.user!.updatedAt != null) {
              prefs.setString("updated_at", data.user!.updatedAt!.toString());
            }
            if (data.user!.lastLogin != null) {
              prefs.setString("v", data.user!.lastLogin!.toString());
            }
            if (data.user!.isEmailVerified != null) {
              prefs.setString(
                  "is_email_verified", data.user!.isEmailVerified!.toString());
            }
          }
          ref.read(myTokenProvider.notifier).state = data.apiToken.toString();
          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  FarmerMapScreen(fromModule: false,)),
            );
          }
        }
      } else {
        showDialog(
            context: context, builder: (context) =>  ErrorDialog(message: result['message']));
      }
    }
  }
}
