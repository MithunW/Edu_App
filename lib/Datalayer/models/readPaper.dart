import 'package:edu_app/Datalayer/paper.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<String> loadPaperAsset() async {
  return await rootBundle.loadString('assets/papers/paper_01.json');
}

Future loadPaper() async {
  String jsonString = await loadPaperAsset();
  final jsonResponse = await json.decode(jsonString);
  Paper paper = new Paper.fromJson(jsonResponse);
  return (paper);
}
