import 'package:edu_app/Datalayer/classes/paper.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

HttpClient httpClient = new HttpClient();
Future<void> downloadFile(String url, String filename) async {
  var request = await httpClient.getUrl(Uri.parse(url));
  var response = await request.close();
  var bytes = await consolidateHttpClientResponseBytes(response);
  String dir = (await getApplicationDocumentsDirectory())
      .path; //getApplicationDocumentsDirectory getExternalStorageDirectory for internal one. can't see from file manager
  File file = new File('$dir/$filename');
  file.writeAsBytesSync(bytes, flush: true);
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

// Future<String> loadPaperAsset(paperName) async {
//   String path = await _localPath;
//   return await rootBundle.loadString('$path/$paperName');
// }
Future<String> loadPaperAsset(paperName) async {
  String path = await _localPath;
  File file1 = new File('$path/$paperName');
  return await file1.readAsString();
}

Future loadPaper(paperName) async {
  String jsonString = await loadPaperAsset(paperName);
  final jsonResponse = await json.decode(jsonString);
  Paper paper = new Paper.fromJson(jsonResponse);
  return (paper);
}
