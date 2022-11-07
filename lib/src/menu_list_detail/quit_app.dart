import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuitApplication extends StatelessWidget {
  const QuitApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 200,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/wooden_four.png',
                fit: BoxFit.fill,
              ),
            ),
            Positioned.fill(
              child: Container(
                margin: const EdgeInsets.fromLTRB(30, 10, 50, 10),
                child: Image.asset(
                  'assets/images/papersmall.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              right: 30,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Image.asset(
                  'assets/images/close.png',
                  width: 50,
                ),
              ),
            ),
            Positioned.fill(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Application မှ ထွက်မည်လား။',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/button_orange.png',
                            width: 120,
                            height: 40,
                          ),
                          const SizedBox(
                            width: 120,
                            height: 40,
                            child: Center(
                              child: Text(
                                'No',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () => SystemNavigator.pop(),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/button_green.png',
                            width: 120,
                            height: 40,
                          ),
                          const SizedBox(
                            width: 120,
                            height: 40,
                            child: Center(
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
