import 'package:edu_app/Datalayer/classes/paperShowcase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  // Access a Cloud Firestore instance from your Activity
  final databaseReference = Firestore.instance;

  Future<List> getPapers() async {
    List list = new List<PaperShowcase>();
    await databaseReference
        .collection("papers")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        PaperShowcase paper = new PaperShowcase();
        paper.setName(f.data['name']);
        paper.setUrl(f.data['url']);
        list.add(paper);
      });
    });
    return list;
  }

  static List<String> getUsers() {
    List list = new List<String>();
    int counter = 15;
    int count = counter;
    do {
      int user = (count + 1) - counter;
      list.add('User $user ');
      counter--;
    } while (counter > 0);

    return list;
  }

  static List<String> getQuestions() {
    List list = new List<String>();
    int counter = 10;
    int count = counter;
    do {
      int q = (count + 1) - counter;
      list.add('ප්‍රශ්න $q ');
      counter--;
    } while (counter > 0);

    return list;
  }
}
