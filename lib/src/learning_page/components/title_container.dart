import 'package:flutter/material.dart';

class TitleContianer extends StatelessWidget {
  const TitleContianer({
    super.key,
    required this.onTap,
    required this.bgColor,
    required this.title,
    required this.fontSize,
    required this.isSelected,
  });
  final String? title;
  final Function? onTap;
  final Color? bgColor;
  final double? fontSize;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Transform.scale(
        scale: isSelected ? 1.1 : 1,
        child: InkWell(
          onTap: () {
            onTap?.call();
          },
          child: Container(
            height: 64,
            margin: const EdgeInsets.only(left: 16),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/title_leaf.png',
                ),
              ),
            ),
            alignment: Alignment.center,
            width: double.infinity,
            // color: bgColor,
            child: Text(
              title ?? '...',
              style: TextStyle(
                fontSize: fontSize,
                height: 1.3,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
