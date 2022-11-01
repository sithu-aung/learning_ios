import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class LibraryMenuList extends StatelessWidget {
  const LibraryMenuList({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.textThree,
    required this.firstOnTap,
    required this.secOnTap,
    required this.thirdOnTap,
  });
  final String? textOne;
  final String? textTwo;
  final String? textThree;

  final Function? firstOnTap;
  final Function? secOnTap;
  final Function? thirdOnTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 50,
            color: Colors.white,
            child: Text(
              textOne ?? '...',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 45,
            color: Colors.white,
            child: Text(
              textTwo ?? '...',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 45,
            color: Colors.white,
            child: Text(
              textThree ?? '...',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
