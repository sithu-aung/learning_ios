// import 'package:flutter/material.dart';
// import 'package:pdfx/pdfx.dart';

// class PDFViewer extends StatefulWidget {
//   String fileName;
//   PDFViewer({Key? key, required this.fileName}) : super(key: key);

//   @override
//   _PDFViewerState createState() => _PDFViewerState();
// }

// class _PDFViewerState extends State<PDFViewer> {
//   static const int _initialPage = 0;
//   int _actualPageNumber = _initialPage, _allPagesCount = 0;
//   bool isSampleDoc = true;
//   late PdfControllerPinch _pdfController;

//   @override
//   void initState() {
//     _pdfController = PdfControllerPinch(
//       document: PdfDocument.openAsset(widget.fileName),
//       initialPage: _initialPage,
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _pdfController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: Stack(
//           children: [
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               child: PdfViewPinch(
//                 controller: _pdfController,
//                 onDocumentLoaded: (document) {
//                   setState(() {
//                     _allPagesCount = document.pagesCount;
//                   });
//                 },
//                 onPageChanged: (page) {
//                   setState(() {
//                     _actualPageNumber = page;
//                   });
//                 },
//               ),
//             ),
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               child: Align(
//                 alignment: Alignment.topRight,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     IconButton(
//                       icon: const Icon(
//                         Icons.navigate_before,
//                         size: 24,
//                       ),
//                       onPressed: () {
//                         _pdfController.previousPage(
//                           curve: Curves.ease,
//                           duration: const Duration(milliseconds: 100),
//                         );
//                       },
//                     ),
//                     Container(
//                       alignment: Alignment.topCenter,
//                       margin: const EdgeInsets.only(top: 6),
//                       child: Text(
//                         '$_actualPageNumber/$_allPagesCount',
//                         style: const TextStyle(fontSize: 22),
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(
//                         Icons.navigate_next,
//                         size: 24,
//                       ),
//                       onPressed: () {
//                         _pdfController.nextPage(
//                           curve: Curves.ease,
//                           duration: const Duration(milliseconds: 100),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
// }
