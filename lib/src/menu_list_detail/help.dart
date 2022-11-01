import 'package:flutter/material.dart';
import 'package:learning/src/menu_list_detail/contact_with_email.dart';
import 'package:learning/src/menu_list_detail/menu_list_text_widget.dart';
import 'package:learning/src/menu_list_detail/most_question.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuListTextWidget(
      title: 'အကူအညီ',
      text: 'text',
      widgetStatus: true,
      widget: Container(
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
        child: Column(
          children: [
            const Text(
              'သင်ဘာအကူအညီလိုအပ်ပါသလဲ။',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 300,
              height: 55,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MostQuestion(),
                      ));
                },
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/button_green_round.png',
                      width: 300,
                      height: 55,
                      fit: BoxFit.fill,
                    ),
                    const Positioned(
                      top: 12,
                      left: 60,
                      child: Text(
                        'အမေးများသောမေးခွန်းများ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 55,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContactWithEmail(),
                      ));
                },
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/button_green_round.png',
                      width: 300,
                      height: 55,
                      fit: BoxFit.fill,
                    ),
                    const Positioned(
                      top: 12,
                      left: 60,
                      child: Text(
                        'အီးမေးလ်နှင့်ဆက်သွယ်ရန်',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
