import 'package:flutter/material.dart';
import 'package:learning/src/responsive.dart';

class Chapter1TextPopUpWidget extends StatelessWidget {
  const Chapter1TextPopUpWidget({
    super.key,
    required this.text,
    required this.scrollController,
    required this.closeOnTap,
  });

  final String? text;

  final ScrollController scrollController;

  final GestureTapCallback? closeOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.2,
          right: MediaQuery.of(context).size.width * 0.2),
      color: Colors.black.withOpacity(0.7),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.14,
              bottom: Responsive.isMobile(context)
                  ? 12
                  : MediaQuery.of(context).size.height * 0.26),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/paper_medium_leafs.png'),
                fit: BoxFit.fill),
          ),
          // decoration: shadowDecorationWithBorderColor(
          //     const Color.fromARGB(255, 255, 216, 95),
          //     const Color.fromARGB(255, 255, 216, 95),
          //     12),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 50),
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: closeOnTap,
                  // setState(() {
                  //   textpopUpVisible = false;
                  // });

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/close.png",
                      width: Responsive.isMobile(context) ? 32 : 38,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 60, top: 30, bottom: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  margin: const EdgeInsets.only(left: 12),
                  padding:
                      const EdgeInsets.only(left: 30, bottom: 16, right: 50),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: SingleChildScrollView(
                      child: Text(
                        text ?? '...',
                        style: TextStyle(
                            height: 1.8,
                            color: Colors.black,
                            fontSize: Responsive.isMobile(context) ? 16 : 19),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
