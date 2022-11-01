import 'package:flutter/material.dart';

class LibraryHearder extends StatelessWidget {
  const LibraryHearder({
    super.key,
    required this.image,
    required this.hearder,
    this.icon,
    required this.backOnTap,
      this.endActionOnTap,
  });
  final String image;
  final String? hearder;
  final IconData? icon;
  final Function? backOnTap;
  final Function? endActionOnTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 60,
      color: Colors.grey[850], // Color(0xff0c000000),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              backOnTap?.call();
            },
            child: Image.asset(
              image,
              scale: 2.5,
            ),
          ),
          Text(
            hearder ?? '...',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          icon == null
              ? const SizedBox.shrink()
              : Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: IconButton(
                    onPressed: () {
                      endActionOnTap?.call();
                    },
                    icon: Icon(
                      icon,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
