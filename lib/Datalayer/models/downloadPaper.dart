//import 'package:flutter_downloader/flutter_downloader.dart';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

// Future<String> get _localPath async {
//   final directory =
//       await getExternalStorageDirectory();
//       //getApplicationDocumentsDirectory();
//   // For your reference print the AppDoc directory

//   return directory.path;
// }

// Future downloadPaper(url) async {
//   final taskId = await FlutterDownloader.enqueue(
//     url: url,
//     savedDir: await _localPath,
//     showNotification:
//         false, // show download progress in status bar (for Android)
//     openFileFromNotification:
//         false, // click on notification to open downloaded file (for Android)
//   );
// }
// void downloadPaper(url) {
//   HttpClient client = new HttpClient();
//   var _downloadData = StringBuffer();
//   var fileSave = new File('${_localPath.toString()}/paper1.json');
//   client.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
//     return request.close();
//   }).then((HttpClientResponse response) {
//     response.transform(utf8.decoder).listen((d) => _downloadData.write(d),
//         onDone: () {
//       fileSave.writeAsString(_downloadData.toString());
//     });
//   });
// }

HttpClient httpClient = new HttpClient();
Future<File> downloadFile(String url, String filename) async {
  var request = await httpClient.getUrl(Uri.parse(url));
  var response = await request.close();
  var bytes = await consolidateHttpClientResponseBytes(response);
  String dir = (await getExternalStorageDirectory()).path; //getApplicationDocumentsDirectory for internal one. can't see from file manager
  File file = new File('$dir/$filename');
  await file.writeAsBytes(bytes);
  return file;
}
