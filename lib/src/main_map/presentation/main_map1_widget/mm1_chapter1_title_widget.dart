import 'package:flutter/material.dart';

class MM1Chapter1TitleWidget extends StatelessWidget {
  const MM1Chapter1TitleWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.selected,
  });
  final String? title;
  final Function? onTap;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: selected ? Colors.green : Colors.black12,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        width: size.width * 0.4,
        height: 44,
        child: Text(
          title ?? '...',
          style: TextStyle(
            height: 1.4,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
