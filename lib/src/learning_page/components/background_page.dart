import 'package:flutter/material.dart';

class BackgroundPage extends StatelessWidget {
  String backImage;
  BackgroundPage({Key? key, required this.backImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        backImage,
        fit: BoxFit.fill,
      ),
    );
  }
}
