import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondLibrary extends StatelessWidget {
  const SecondLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/secondwallpaper.jpg';
    return GridView.builder(shrinkWrap: true,
      itemCount: 3,
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
         const   SizedBox(height: 10),
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
