import 'package:flutter/material.dart';

class BookItemWidget extends StatelessWidget {
  const BookItemWidget({
    super.key,
    required this.title,
    required this.index,
    required this.onTap,
    required this.image,
  });
  final String? title;
  final String? index;
  final Function? onTap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, right: 10, left: 12),
            // width: MediaQuery.of(context).size.width * 0.23,
            height: 120,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(image),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, right: 10, left: 12),
            width: MediaQuery.of(context).size.width * 0.25,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.white.withOpacity(0.2),
            ),
            child: Center(
              child: Text(
                title ?? '...',
                style: const TextStyle(color: Colors.black, fontSize: 12),
                textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
