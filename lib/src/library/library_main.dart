import 'package:flutter/material.dart';
import 'package:learning/src/learning_page/components/library_hearder.dart';
import 'package:learning/src/library/first_library.dart';
import 'package:learning/src/library/library_menu.dart';
import 'package:learning/src/library/second_library.dart';
import 'package:learning/src/library/third_library.dart';
import 'package:learning/tool_widgets.dart';

List libraryTitle = [
  'Title 1',
  'Title 2',
  'Title 3',
];

class LibraryMain extends StatefulWidget {
  const LibraryMain({super.key});

  @override
  State<LibraryMain> createState() => _LibraryMainState();
}

class _LibraryMainState extends State<LibraryMain> {
  int select = 1;
  int initalPage = 1;

  String image = 'assets/images/wallpaper.jpeg';
  PageController pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 46, 67, 100),
      body: Column(
        children: [
          LibraryHearder(
            image: backIcon,
            hearder: 'Library',
            icon: Icons.menu,
            backOnTap: () {},
            endActionOnTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LibraryMenu(),
              ));
            },
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: libraryTitle.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      select = index;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(5),
                    width: 200,
                    height: 40,
                    color: select == index ? Colors.white : Colors.grey,
                    child: Text(
                      libraryTitle[index],
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.grey[850],
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: select == 0
                  ? const SecondLibrary()
                  : select == 1
                      ? const FirstLibrary()
                      : const ThirdLibrary(),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
    // Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Library'),
    //     actions: [
    //       IconButton(
    //         onPressed: () {
    //           Navigator.of(context).push(MaterialPageRoute(
    //             builder: (context) => LibraryMenu(),
    //           ));
    //         },
    //         icon: Icon(Icons.menu),
    //       ),
    //     ],
    //   ),
    //   body: Column(
    //     children: [
    //       Container(
    //         alignment: Alignment.center,
    //         width: double.infinity,
    //         height: 50,
    //         color: Colors.amber,
    //         child: ListView.builder(
    //           shrinkWrap: true,
    //           scrollDirection: Axis.horizontal,
    //           itemCount: libraryTitle.length,
    //           itemBuilder: (context, index) {
    //             return InkWell(
    //               onTap: () {
    //                 setState(() {
    //                   select = index;
    //                 });
    //               },
    //               child: Container(
    //                 alignment: Alignment.center,
    //                 margin: const EdgeInsets.all(5),
    //                 width: 200,
    //                 height: 40,
    //                 color: select == index ? Colors.white : Colors.grey,
    //                 child: Text(
    //                   libraryTitle[index],
    //                   style: const TextStyle(color: Colors.black),
    //                 ),
    //               ),
    //             );
    //           },
    //         ),
    //       ),
    //       SizedBox(height: 10),
    //       Expanded(
    //         child: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: select == 0
    //               ? SecondLibrary()
    //               : select == 1
    //                   ? FirstLibrary()
    //                   : ThirdLibrary(),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
