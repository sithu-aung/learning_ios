import 'package:flutter/material.dart';
import 'package:learning/src/components/book_item_widget.dart';
import 'package:learning/src/components/book_list_model.dart';
import 'package:learning/src/components/pdf_view.dart';

class BookItemsPage extends StatelessWidget {
  BookItemsPage({
    super.key,
    required this.list,
  });
  List<BookListModel> list;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
          itemCount: list.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return BookItemWidget(
              title: list[index].name,
              index: '',
              image: list[index].image,
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: ((context) => PDFViewer(
                //               fileName: "assets/module${index + 1}.pdf",
                //             ))));
              },
            );
          }),
    );
  }
}
