import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ThirdLibrary extends StatelessWidget {
  const ThirdLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/thirdwallpaper.jpg';
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 2,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(image),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                color: Colors.white,
                child: Text(
                  'In publishing and graphic design, Lorem ipsum is a',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
