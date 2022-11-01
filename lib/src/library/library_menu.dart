import 'package:flutter/material.dart';
import 'package:learning/tool_widgets.dart';
import 'package:learning/src/learning_page/components/library_hearder.dart';

class LibraryMenu extends StatelessWidget {
  const LibraryMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
          LibraryHearder(
            image: backIcon,
            hearder: 'Lists',
            backOnTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
