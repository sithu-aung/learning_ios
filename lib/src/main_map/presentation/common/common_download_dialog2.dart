// import 'dart:developer';
// import 'dart:io';
// import 'dart:ui';

// import 'package:archive/archive.dart';
// import 'package:bouncing_widget/bouncing_widget.dart';
// import 'package:download_assets/download_assets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:learning/src/common_widget/common_dialog.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'dart:isolate';

// import 'package:shared_preferences/shared_preferences.dart';

// class DownloadDialog2 extends StatefulWidget {
//   String moduleName;
//   String moduleDisplayName;
//   DownloadDialog2(
//       {super.key, required this.moduleName, required this.moduleDisplayName});

//   @override
//   State<DownloadDialog2> createState() =>
//       _DownloadDialog2State(moduleName, moduleDisplayName);
// }

// class _DownloadDialog2State extends State<DownloadDialog2> {
//   bool downloading = false;
//   int dataProgress = 0;
//   bool downloaded = false;
//   List<TaskInfo> taskList = [];
//   final ReceivePort _port = ReceivePort();
//   String moduleName;
//   String moduleDisplayName;
//   bool clickable = true;
//   _DownloadDialog2State(this.moduleName, this.moduleDisplayName);

//   final downloadAssetsController = DownloadAssetsController();

//   @override
//   void initState() {
//     _bindBackgroundIsolate();
//     FlutterDownloader.registerCallback(downloadCallback);
//     _prepare();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CommonDialog(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             downloaded
//                 ? "Successfully Downloaded $moduleDisplayName !"
//                 : dataProgress.isNegative
//                     ? "Retry to Download $moduleDisplayName ?"
//                     : 'Do you want to download $moduleDisplayName ?',
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//                 bottom: 20,
//                 top: 12,
//                 left: downloading && !dataProgress.isNegative ? 100 : 0),
//             child: downloading && !dataProgress.isNegative
//                 ? SizedBox(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         LinearPercentIndicator(
//                           width: MediaQuery.of(context).size.width * 0.36,
//                           animation: false,
//                           lineHeight: 12,
//                           animationDuration: 1000,
//                           percent:
//                               dataProgress.isNegative ? 0 : dataProgress / 100,
//                           barRadius: const Radius.circular(4),
//                           progressColor: Colors.green,
//                           backgroundColor: Colors.white,
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 50),
//                           child: Text('${(dataProgress)}% Downloaded'),
//                         ),
//                       ],
//                     ),
//                   )
//                 : downloaded
//                     ? BouncingWidget(
//                         duration: const Duration(milliseconds: 400),
//                         scaleFactor: 1,
//                         onPressed: () async {
//                           Navigator.pop(context);
//                         },
//                         child: Stack(
//                           children: [
//                             Image.asset(
//                               "assets/images/button_green_round.png",
//                               width: MediaQuery.of(context).size.width * 0.15,
//                               height: 50,
//                               fit: BoxFit.fill,
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.only(
//                                 top: 16,
//                                 left: 42,
//                               ),
//                               child: Text(
//                                 "Close",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 15,
//                                   height: 1.2,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     : Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           BouncingWidget(
//                             duration: const Duration(milliseconds: 400),
//                             scaleFactor: 1,
//                             onPressed: () async {
//                               setState(() {
//                                 downloading = true;
//                               });
//                               if (clickable) {
//                                 setState(() {
//                                   clickable = false;
//                                 });
//                                 _requestDownload(taskList[0]);
//                               }
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
//                             onPressed: () async {},
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

//   void _bindBackgroundIsolate() {
//     bool isSuccess = IsolateNameServer.registerPortWithName(
//         _port.sendPort, 'downloader_send_port3');
//     if (!isSuccess) {
//       _unbindBackgroundIsolate();
//       _bindBackgroundIsolate();
//       return;
//     }
//     _port.listen((dynamic data) {
//       if (true) {
//         print('UI Isolate Callback: $data');
//       }
//       String? id = data[0];
//       DownloadTaskStatus? status = data[1];
//       int? progress = data[2];

//       if (taskList.isNotEmpty) {
//         final task = taskList[0];
//         setState(() {
//           task.status = status!;
//           task.progress = progress!;
//           downloading = true;
//           downloaded = false;
//           setState(() {
//             if (progress < 100) {
//               setState(() {
//                 dataProgress = progress;
//               });
//             } else {
//               downloading = false;
//               downloaded = true;
//               saveDownloadContent(task);
//             }
//           });
//         });
//         if (task.status == DownloadTaskStatus.complete) {
//           downloading = false;
//           downloaded = true;
//         } else if (task.status == DownloadTaskStatus.failed) {
//           setState(() {
//             clickable = true;
//           });
//         }
//       }
//     });
//   }

//   void _unbindBackgroundIsolate() {
//     IsolateNameServer.removePortNameMapping('downloader_send_port3');
//   }

//   static void downloadCallback(
//       String id, DownloadTaskStatus status, int progress) {
//     if (true) {
//       print(
//           'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
//     }
//     final SendPort send =
//         IsolateNameServer.lookupPortByName('downloader_send_port3')!;
//     send.send([id, status, progress]);
//   }

//   void _prepare() async {
//     final tasks = await FlutterDownloader.loadTasks();
//     taskList.add(TaskInfo(
//         name: "$moduleName.zip",
//         link:
//             "https://wwf-contents.fra1.digitaloceanspaces.com/subject1/$moduleName.zip"));
//     for (var task in tasks!) {
//       for (TaskInfo info in taskList) {
//         if (info.link == task.url) {
//           info.taskId = task.taskId;
//           info.status = task.status;
//           info.progress = task.progress;
//         }
//       }
//     }
//     setState(() {});
//   }

//   Future<void> _requestDownload(TaskInfo task) async {
//     final status = await Permission.storage.request();

//     if (status.isGranted) {
//       String? dir;
//       if (Platform.isAndroid) {
//         await getExternalStorageDirectory().then((value) {
//           dir = value!.path;
//         });
//       } else if (Platform.isIOS) {
//         dir = (await getApplicationDocumentsDirectory()).absolute.path;
//       } //From path_provider package
//       var localPath = dir!;
//       print('local path => $localPath');
//       final savedDir = Directory(localPath);
//       await savedDir.create(recursive: true).then((value) async {
//         task.taskId = (await FlutterDownloader.enqueue(
//           url: task.link,
//           fileName: task.name,
//           savedDir: localPath,
//           showNotification: true,
//           openFileFromNotification: false,
//         ))!;
//         print(task.taskId);
//       });
//     } else {
//       print('permission denined');
//     }
//   }

//   Future<void> _retryDownload(TaskInfo task) async {
//     String? newTaskId = await FlutterDownloader.retry(taskId: task.taskId);
//     task.taskId = newTaskId!;
//   }

//   Future<void> _removeDownload(TaskInfo task) async {
//     log("Removed${task.taskId}");
//     await FlutterDownloader.remove(taskId: task.taskId);
//   }

//   /* Hive */
//   void saveDownloadContent(TaskInfo task) async {
//     String? dir;
//     if (Platform.isAndroid) {
//       await getExternalStorageDirectory().then((value) {
//         dir = value!.path;
//       });
//     } else if (Platform.isIOS) {
//       dir = (await getApplicationDocumentsDirectory()).absolute.path;
//     }

//     String downloadedPath = '$dir/${task.name}';
//     log(downloadedPath);
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     log("Module Name $moduleName \n Storage -  $dir/out/$moduleName ");
//     prefs.setString(moduleName, "$dir/out/$moduleName");
//     setState(() {
//       clickable = true;
//     });

//     // Read the Zip file from disk.
//     final bytes = File(downloadedPath).readAsBytesSync();
//     // Decode the Zip file
//     final archive = ZipDecoder().decodeBytes(bytes);
//     // Extract the contents of the Zip archive to disk.
//     for (final file in archive) {
//       final filename = file.name;
//       log("File Name $filename");
//       if (file.isFile) {
//         final data = file.content as List<int>;
//         File('$dir/out/$filename')
//           ..createSync(recursive: true)
//           ..writeAsBytesSync(data);
//       } else {
//         log("File Name $filename");
//         Directory('$dir/out/$filename').create(recursive: true);
//       }
//     }
//   }
// }

// class TaskInfo {
//   final String name;
//   final String link;

//   String taskId = '';
//   int progress = 0;
//   DownloadTaskStatus status = DownloadTaskStatus.undefined;

//   TaskInfo({required this.name, required this.link});
// }
