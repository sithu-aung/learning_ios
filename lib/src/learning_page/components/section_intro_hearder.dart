import 'package:flutter/material.dart';

class SectionIntroHearder extends StatelessWidget {
  String title;
  Function? onBackButtonPressed;
  SectionIntroHearder(
      {super.key, required this.title, required this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              onBackButtonPressed?.call();
            },
            child: Image.asset(
              'assets/images/back.png',
              width: 42,
            ),
          ),
          Stack(
            children: [
              Image.asset(
                'assets/images/titlenoleaf.png',
                width: size.width * .65,
                fit: BoxFit.fill,
              ),
              Container(
                alignment: Alignment.center,
                width: size.width * .65,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
          IgnorePointer(
            child: Image.asset(
              'assets/images/ic_menu.png',
              height: 50,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionIntroHearderWithoutMenu extends StatelessWidget {
  String title;
  final Function? onTap;
  SectionIntroHearderWithoutMenu({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
              //  onTap?.call();
            },
            child: Image.asset(
              'assets/images/back.png',
              width: 42,
            ),
          ),
          Stack(
            children: [
              Image.asset(
                'assets/images/titlenoleaf.png',
                width: size.width * .45,
                fit: BoxFit.fill,
              ),
              Container(
                alignment: Alignment.center,
                width: size.width * .45,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            height: 50,
          )
        ],
      ),
    );
  }
}

class SectionIntroHearderWithoutMenuProgress extends StatelessWidget {
  String title;
  final Function? onTap;
  SectionIntroHearderWithoutMenuProgress({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 76,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
              // onTap?.call();
            },
            child: Image.asset(
              'assets/images/back.png',
              width: 42,
            ),
          ),
          Stack(
            children: [
              Image.asset(
                'assets/images/titlenoleaf.png',
                width: size.width * .5,
                fit: BoxFit.fill,
              ),
              Container(
                alignment: Alignment.center,
                width: size.width * .5,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            height: 50,
          )
        ],
      ),
    );
  }
}
