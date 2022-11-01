import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learning/src/menu_list_detail/menu_list_text_widget.dart';

class OtherApp extends StatelessWidget {
  const OtherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuListTextWidget(
      widgetStatus: true,
      title: 'Other Application',
      text: 'text',
      widget: Container(
        margin: const EdgeInsets.fromLTRB(80, 30, 80, 10),
        child: GridView.builder(
            itemCount: 5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.8,
              crossAxisSpacing: 0,
              mainAxisSpacing: 50,
            ),
            itemBuilder: (context, index) {
              return Image.asset(
                'assets/images/game.png',
                width: 150,
                height: 150,
              );
            }),
      ),
    );
  }
}
