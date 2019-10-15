import 'dart:convert';
import 'dart:io';

import 'package:edu_app/Datalayer/classes/paper.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class PaperShowcase {
  String id;
  String url;
  String name;
  int number;
  int hTime;
  int mTime;
  PaperShowcase(
    this.url,
    this.name,
    this.number,
    this.hTime,
    this.mTime,
  );
  Future<void> downloadFile(String url, String filename) async {
    HttpClient httpClient = new HttpClient();
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

  Future<bool> checkPaper(paperName) async {
    bool paperexists;
    String path = await _localPath;
    File file1 = new File('$path/$paperName');
    if (await file1.exists()) {
      paperexists = true;
    } else {
      paperexists = false;
    }
    return paperexists;
  }
}
