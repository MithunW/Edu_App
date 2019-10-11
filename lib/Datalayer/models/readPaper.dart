import 'package:edu_app/Datalayer/paper.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getExternalStorageDirectory();
  return directory.path;
}

Future<String> loadPaperAsset(paperName) async {
  String path = await _localPath;
  return await rootBundle.loadString('$path/$paperName');
}

Future loadPaper(paperName) async {
  String jsonString = await loadPaperAsset(paperName);
  final jsonResponse = await json.decode(jsonString);
  Paper paper = new Paper.fromJson(jsonResponse);
  return (paper);
}

// bool checkforPaper(name) {
//   String path = _localPath.toString();
//   try {
//     String paperasset = rootBundle.loadString('$path/$name').toString();
//   } on Exception catch (_) {
//     return false;
//   }
//   return true;
// }
