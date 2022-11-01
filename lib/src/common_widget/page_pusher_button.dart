import 'package:flutter/material.dart';

class PagePusherButton extends StatelessWidget {
  const PagePusherButton({
    super.key,
    required this.forward,
    required this.onTap,
  });
  final bool forward;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: forward ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Container(
        height: 60,
        width: 60,
        margin: EdgeInsets.only(
            bottom: 8, right: forward ? 8 : 0, left: !forward ? 8 : 0),
        child: GestureDetector(
          child: Image.asset(
            forward
                ? "assets/images/arrow_right.png"
                : "assets/images/back.png",
            width: 20,
          ),
          onTap: () {
            onTap?.call();
          },
        ),
      ),
    );
  }
}
