import 'package:flutter/material.dart';
import 'package:learning/src/common_widget/button_image.dart';
import 'package:learning/src/menu_list_detail/menu_list_text_widget.dart';

class ContactWithEmail extends StatelessWidget {
  const ContactWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuListTextWidget(
      title: 'Help',
      text: 'text',
      widgetStatus: true,
      widget: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '360edsupport@gmail.com',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Expanded(
              child: TextField(
                maxLines: 8,
                decoration: InputDecoration(
                  isDense: true,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: ButtonImage(
                width: 150,
                height: 50,
                onTap: () {},
                buttonText: 'Sent',
                buttonImage: 'assets/images/button_green_round.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
