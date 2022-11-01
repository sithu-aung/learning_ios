import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learning/src/common_widget/common_dialog.dart';

class CommonErrorDialog extends StatelessWidget {
  const CommonErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      child: Column(
        children: [
          const Text(
            'တစ်စုံတစ်ခုမှားယွင်းသွားပါသည်!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BouncingWidget(
              duration: const Duration(milliseconds: 400),
              scaleFactor: 1,
              onPressed: () async {
                Navigator.pop(context);
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
                      "  OK",
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
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionErrorDialog extends StatelessWidget {
  const QuestionErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      child: Column(
        children: const [
          Icon(
            Icons.error,
          ),
          Text(
            'Incorrect Name and Date of Birth',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            'Please Enter',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            'Correct Name and Date of Birth',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
