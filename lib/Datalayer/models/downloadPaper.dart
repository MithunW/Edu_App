import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

HttpClient httpClient = new HttpClient();
Future<File> downloadFile(String url, String filename) async {
  var request = await httpClient.getUrl(Uri.parse(url));
  var response = await request.close();
  var bytes = await consolidateHttpClientResponseBytes(response);
  String dir = (await getExternalStorageDirectory())
      .path; //getApplicationDocumentsDirectory for internal one. can't see from file manager
  File file = new File('$dir/$filename');
  await file.writeAsBytes(bytes);
  return file;
}

