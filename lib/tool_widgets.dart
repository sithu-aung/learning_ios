import 'package:flutter/material.dart';

BoxDecoration shadowDecoration(Color color) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.white, width: 1),
    boxShadow: const [
      BoxShadow(
        color: Color(0x0c000000),
        blurRadius: 10,
        offset: Offset(2, 2),
      ),
      BoxShadow(
        color: Color(0x0c000000),
        blurRadius: 10,
        offset: Offset(-2, -2),
      ),
    ],
    color: color,
  );
}

BoxDecoration shadowDecorationOnlyTop(Color color) {
  return BoxDecoration(
    borderRadius: const BorderRadius.only(
        topRight: Radius.circular(12), topLeft: Radius.circular(12)),
    border: Border.all(color: Colors.white, width: 1),
    boxShadow: const [
      BoxShadow(
        color: Color(0x0c000000),
        blurRadius: 10,
        offset: Offset(2, 2),
      ),
      BoxShadow(
        color: Color(0x0c000000),
        blurRadius: 10,
        offset: Offset(-2, -2),
      ),
    ],
    color: color,
  );
}

BoxDecoration shadowDecorationWithBorderColor(
    Color color, Color borderColor, double borderRadius) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadius),
    border: Border.all(color: borderColor, width: 1),
    boxShadow: const [
      BoxShadow(
        color: Color(0x0c000000),
        blurRadius: 10,
        offset: Offset(2, 2),
      ),
      BoxShadow(
        color: Color(0x0c000000),
        blurRadius: 10,
        offset: Offset(-2, -2),
      ),
    ],
    color: color,
  );
}

String backIcon = 'assets/images/back.png';
