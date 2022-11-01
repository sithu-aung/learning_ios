import 'package:flutter/material.dart';
import 'package:learning/src/auth/presentation/login.dart';
import 'package:learning/src/main_map/presentation/farmer_map.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String token = "";
  @override
  void initState() {
    super.initState();
    initial();
  }

  initial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("token") ?? "";
    });
    Future.delayed(const Duration(seconds: 2)).then((value) {
      token != "" ? FarmerMapScreen(fromModule: false) : const LoginScreen();
      if (token != "") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FarmerMapScreen(fromModule: false),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/app_back.jpg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.3,
              top: MediaQuery.of(context).size.height * 0.1,
            ),
            child: Image.asset(
              "assets/images/app_logo.png",
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.75,
            left: MediaQuery.of(context).size.width * 0.25,
            child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width * 0.5,
              animation: true,
              lineHeight: 20,
              animationDuration: 2000,
              percent: 1,
              center: const Text(
                "",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              barRadius: const Radius.circular(4),
              progressColor: const Color.fromARGB(255, 173, 201, 38),
              backgroundColor: const Color.fromARGB(255, 167, 114, 74),
            ),
          ),
        ],
      ),
    );
  }
}
