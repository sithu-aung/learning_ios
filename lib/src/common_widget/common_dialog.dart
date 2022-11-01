import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    super.key,
    required this.child,
    this.isChapter = false,
    this.title,
    this.isPolicy = false,
  });
  final Widget child;
  final bool isChapter;
  final String? title;
  final bool isPolicy;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        height: 350,
        width: isPolicy ? MediaQuery.of(context).size.width * 0.7 : 500,
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
                      width: isPolicy
                          ? MediaQuery.of(context).size.width * 0.8
                          : MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.7,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, left: 30, right: 40),
                    child: Image.asset(
                      'assets/images/papersmall.png',
                      width: isPolicy
                          ? MediaQuery.of(context).size.width * 0.5
                          : MediaQuery.of(context).size.width * 0.4,
                      fit: BoxFit.fill,
                      //scale: isPolicy ? 1.8 : 1.5,
                    ),
                  ),
                  if (title != null)
                    Positioned(
                      top: 0,
                      left: size.width * 0.01,
                      right: 0,
                      child: Container(
                        width: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/title_leaf.png'),
                          ),
                        ),
                        child: Container(
                          height: isPolicy
                              ? 50
                              : isChapter
                                  ? 80
                                  : 100,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 55, vertical: 5),
                          child: Center(
                            child: Text(
                              title ?? '...',
                              style: const TextStyle(
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
                    margin: EdgeInsets.only(
                        top: isPolicy ? 60 : 90, bottom: isPolicy ? 15 : 0),
                    child: child,
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
// Stack(
//                         children: [
//                           Image.asset(
//                             'assets/images/title_leaf.png',
//                             scale: 2.5,
//                             // width: size.width * 0.3,
//                           ),
//                           Positioned(
//                             left: size.width * 0.05,
//                             top: size.height * 0.055,
//                             child: SizedBox(
//                               child: Text(
//                                 title ?? '...',
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                     color: Colors.white),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),