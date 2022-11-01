import 'dart:developer';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/common_widget/common_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DownloadDialog3 extends StatefulWidget {
  String moduleName;
  String moduleDisplayName;
  DownloadDialog3(
      {super.key, required this.moduleName, required this.moduleDisplayName});

  @override
  State<DownloadDialog3> createState() =>
      _DownloadDialog3State(moduleName, moduleDisplayName);
}

class _DownloadDialog3State extends State<DownloadDialog3> {
  bool downloading = false;
  String dataProgress = "0%";
  bool downloaded = false;
  String moduleName;
  String moduleDisplayName;
  bool clickable = true;
  _DownloadDialog3State(this.moduleName, this.moduleDisplayName);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: Text(
              downloaded
                  ? "ဒေါင်းလုပ်ဆွဲပြီးပါပြီ။"
                  : dataProgress == "-1"
                      ? "ဒေါင်းလုပ် ပြန်လုပ်မယ်။"
                      : moduleDisplayName == "Module 1"
                          ? 'သင်ခန်းစာ (၁) အ‌ခြေခံမြေဆီလွှာနှင့် ကောင်းမွန်သော မြေဆီလွှာအကြောင်း ကို ဒေါင်းလုပ်ဆွဲမှာလား။'
                          : moduleDisplayName == "Module 3"
                              ? 'သင်ခန်းစာ (၃) ရေကို အကျိုးရှိစွာ အသုံးပြုခြင်း ကို ဒေါင်းလုပ်ဆွဲမှာလား။'
                              : moduleDisplayName == "Module 5"
                                  ? 'သင်ခန်းစာ (၅) လယ်ယာစီမံခန့်ခွဲမှု ကို ဒေါင်းလုပ်ဆွဲမှာလား။'
                                  : '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: 20, top: 12, left: downloading ? 100 : 0),
            child: downloading
                ? SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width * 0.36,
                          animation: false,
                          lineHeight: 12,
                          animationDuration: 1000,
                          percent: double.parse(
                                  dataProgress.replaceAll("%", "").toString()) /
                              100,
                          barRadius: const Radius.circular(4),
                          progressColor: Colors.green,
                          backgroundColor: Colors.white,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child:
                              Text('${(dataProgress)} ဒေါင်းလုပ်ဆွဲပြီးပါပြီ။'),
                        ),
                      ],
                    ),
                  )
                : downloaded
                    ? BouncingWidget(
                        duration: const Duration(milliseconds: 400),
                        scaleFactor: 1,
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/button_green_round.png",
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: 50,
                              fit: BoxFit.fill,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 16,
                                left: 42,
                              ),
                              child: Text(
                                "Close",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  height: 1.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BouncingWidget(
                            duration: const Duration(milliseconds: 400),
                            scaleFactor: 1,
                            onPressed: () async {
                              setState(() {
                                downloading = true;
                              });
                              if (clickable) {
                                setState(() {
                                  clickable = false;
                                });
                                _requestDownload(
                                    "https://wwf-contents.fra1.digitaloceanspaces.com/subject1/$moduleName.zip");
                              }
                            },
                            child: Stack(
                              children: [
                                Image.asset(
                                  "assets/images/button_green_round.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height: 50,
                                  fit: BoxFit.fill,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top: 16,
                                    left: 42,
                                  ),
                                  child: Text(
                                    "  Yes",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          BouncingWidget(
                            duration: const Duration(milliseconds: 400),
                            scaleFactor: 1,
                            onPressed: () async {},
                            child: Stack(
                              children: [
                                Image.asset(
                                  "assets/images/button_orange_frame.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height: 50,
                                  fit: BoxFit.fill,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top: 16,
                                    left: 42,
                                  ),
                                  child: Text(
                                    " No",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
          ),
        ],
      ),
    );
  }

  Future<void> _requestDownload(String url) async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      String? dir;
      if (Platform.isAndroid) {
        await getExternalStorageDirectory().then((value) {
          dir = value!.path;
        });
      } else if (Platform.isIOS) {
        dir = (await getApplicationDocumentsDirectory()).absolute.path;
      } //From path_provider package
      var localPath = dir!;
      print('local path => $localPath');
      final savedDir = Directory(localPath);
      await savedDir.create(recursive: true).then((value) async {
        await Dio().download(url, "$localPath/$moduleName.zip",
            options: Options(headers: {HttpHeaders.acceptEncodingHeader: "*"}),
            // disable gzip
            onReceiveProgress: (received, total) async {
          if (total != -1) {
            if (!downloaded) {
              setState(() {
                dataProgress =
                    "${(received / total * 100).toStringAsFixed(0)}%";
              });
              log("${(received / total * 100).toStringAsFixed(0)}%");
              if (dataProgress == "100%") {
                setState(() {
                  downloading = false;
                  downloaded = true;
                });
              }
            }
          } else {
            setState(() {
              dataProgress = "-1";
            });
          }
        });
        saveDownloadContent("$moduleName.zip");
      });
    } else {
      log('permission denined');
    }
  }

  /* Hive */
  void saveDownloadContent(String fileName) async {
    String? dir;
    if (Platform.isAndroid) {
      await getExternalStorageDirectory().then((value) {
        dir = value!.path;
      });
    } else if (Platform.isIOS) {
      dir = (await getApplicationDocumentsDirectory()).absolute.path;
    }

    String downloadedPath = '$dir/$fileName';
    log(downloadedPath);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    log("Module Name $moduleName \n Storage -  $dir/out/$moduleName ");
    prefs.setString(moduleName, "$dir/out/$moduleName");
    setState(() {
      clickable = true;
    });

    // Read the Zip file from disk.
    final bytes = File(downloadedPath).readAsBytesSync();
    // Decode the Zip file
    final archive = ZipDecoder().decodeBytes(bytes);
    // Extract the contents of the Zip archive to disk.
    for (final file in archive) {
      final filename = file.name;
      log("File Name $filename");
      if (file.isFile) {
        final data = file.content as List<int>;
        File('$dir/out/$filename')
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        log("File Name $filename");
        Directory('$dir/out/$filename').create(recursive: true);
      }
    }
  }
}
