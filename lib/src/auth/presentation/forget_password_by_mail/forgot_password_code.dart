import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learning/src/auth/presentation/common/pwd_change_email_reusable_scaffold.dart';
import 'package:learning/src/auth/presentation/password_change.dart';

class ForgotPasswordCode extends StatelessWidget {
  const ForgotPasswordCode({super.key});

  @override
  Widget build(BuildContext context) {
    return PwdChangeEmailScaffold(
      child: Column(
        children: [
          const Text(
            'Code ထည့်သွင်းပေးပါ ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Material(
              elevation: 2,
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          BouncingWidget(
            duration: const Duration(milliseconds: 400),
            scaleFactor: 1.5,
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PasswordChange(),
                ),
              );
            },
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/button_green_round.png",
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: 50,
                  fit: BoxFit.fill,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 42,
                  ),
                  child: Text(
                    "Next",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
