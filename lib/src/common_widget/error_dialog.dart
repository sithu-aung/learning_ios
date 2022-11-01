import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/common_widget/common_dialog.dart';

class ErrorDialog extends StatelessWidget {
  String message;
  ErrorDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            padding: const EdgeInsets.only(left: 1, right: 12),
            child: Text(
              message,
              maxLines: 6,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
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
