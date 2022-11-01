// import 'package:bouncing_widget/bouncing_widget.dart';
// import 'package:download_assets/download_assets.dart';
// import 'package:flutter/material.dart';
// import 'package:learning/src/common_widget/common_dialog.dart';

// class DownloadDialog extends StatefulWidget {
//   const DownloadDialog({super.key});

//   @override
//   State<DownloadDialog> createState() => _DownloadDialogState();
// }

// class _DownloadDialogState extends State<DownloadDialog> {
//   bool downloading = false;
//   double progress = 0;
//   bool downloaded = false;

//   final downloadAssetsController = DownloadAssetsController();

//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   Future _init() async {
//     await downloadAssetsController.init();
//     downloaded = await downloadAssetsController.assetsDirAlreadyExists();
//   }

//   Future _downloadAssets() async {
//     try {
//       await downloadAssetsController.startDownload(
//         assetsUrl:
//             "https://wwf-contents.fra1.digitaloceanspaces.com/subject1/module1.zip",
//         onProgress: (progressValue) {
//           downloading = true;
//           downloaded = false;
//           setState(() {
//             if (progressValue < 100) {
//               setState(() {
//                 progress = progressValue / 100;
//               });
//             } else {
//               downloading = false;
//               downloaded = true;
//             }
//           });
//         },
//       );
//     } on DownloadAssetsException catch (e) {
//       print(e.toString());
//       setState(() {
//         downloading = false;
//         downloaded = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CommonDialog(
//       child: Column(
//         children: [
//           const Text(
//             'Do you want to download Module 1 ?',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 20, top: 12),
//             child: downloading
//                 ? SizedBox(
//                     width: 100,
//                     child: Column(
//                       children: [
//                         CircularProgressIndicator(
//                           strokeWidth: 3,
//                           value: progress,
//                           backgroundColor: Colors.white,
//                           color: Colors.red,
//                         ),
//                         Text('${(progress * 100).toStringAsFixed(0)}%'),
//                       ],
//                     ),
//                   )
//                 : downloaded
//                     ? const Text('downloaded ')
//                     : Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           BouncingWidget(
//                             duration: const Duration(milliseconds: 400),
//                             scaleFactor: 1,
//                             onPressed: () async {
//                               _downloadAssets();
//                             },
//                             child: Stack(
//                               children: [
//                                 Image.asset(
//                                   "assets/images/button_green_round.png",
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.15,
//                                   height: 50,
//                                   fit: BoxFit.fill,
//                                 ),
//                                 const Padding(
//                                   padding: EdgeInsets.only(
//                                     top: 16,
//                                     left: 42,
//                                   ),
//                                   child: Text(
//                                     "  Yes",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 15,
//                                       height: 1.2,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           BouncingWidget(
//                             duration: const Duration(milliseconds: 400),
//                             scaleFactor: 1,
//                             onPressed: () async {
//                               Navigator.pop(context);
//                             },
//                             child: Stack(
//                               children: [
//                                 Image.asset(
//                                   "assets/images/button_orange.png",
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.15,
//                                   height: 50,
//                                   fit: BoxFit.fill,
//                                 ),
//                                 const Padding(
//                                   padding: EdgeInsets.only(
//                                     top: 16,
//                                     left: 42,
//                                   ),
//                                   child: Text(
//                                     " No",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 15,
//                                       height: 1.2,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//           ),
//         ],
//       ),
//     );
//   }
// }
