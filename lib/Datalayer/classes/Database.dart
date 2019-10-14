import 'package:edu_app/Datalayer/classes/paperShowcase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_app/Datalayer/classes/user.dart';
import 'package:edu_app/Datalayer/models/checkUser.dart';

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
        PaperShowcase paper = new PaperShowcase(
          f.data['url'],
          f.data['name'],
          f.data['number'],
          f.data['hTime'],
          f.data['mTime'],
        );
        list.add(paper);
      });
    });
    return list;
  }

  List<String> getUsers() {
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

  List<String> getQuestions() {
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

  void uploadPaperMarks() async {
    await databaseReference
        .collection("users")
        .document()
        .collection("paapers")
        .document()
        .setData({
      'title': 'Mastering Flutter',
      'description': 'Programming Guide for Dart'
    });

    DocumentReference ref = await databaseReference.collection("books").add({
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
    });
    print(ref.documentID);
  }

  Future<User> getUserDetails(currentUser) async {
    var document = databaseReference.collection('users').document(currentUser);
    await document.get().then((userSnapshot) {
      if (userSnapshot.exists) {
        User user = User(
          userSnapshot.data['name'],
          userSnapshot.data['register_date'],
          userSnapshot.data['total_score'],
        );
        return user;
      } else {
        return null;
      }
    });
    return null;
  }
}
