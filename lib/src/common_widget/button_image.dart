import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

class ButtonImage extends StatelessWidget {
  final double width;
  final double height;
  final GestureTapCallback onTap;
  final String buttonText;
  final String buttonImage;
  final bool state;
  const ButtonImage({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.buttonText,
    required this.buttonImage,
    this.state = false,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      duration: const Duration(milliseconds: 400),
      scaleFactor: 1.5,
      onPressed: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(buttonImage), fit: BoxFit.fill)),
        child: state
            ? const CircularProgressIndicator()
            : Text(
                buttonText,
                style: const TextStyle(
                    height: 1.2,
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}

class ContainerImage extends StatelessWidget {
  final double width;
  final double height;
  final String buttonText;
  final String buttonImage;
  const ContainerImage({
    super.key,
    required this.width,
    required this.height,
    required this.buttonText,
    required this.buttonImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(buttonImage), fit: BoxFit.fill)),
      child: Text(
        buttonText,
        style: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
