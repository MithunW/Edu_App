import 'package:edu_app/Datalayer/classes/paperShowcase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_app/Datalayer/classes/user.dart';

class Database {
  // Access a Cloud Firestore instance from your Activity
  final databaseReference = Firestore.instance;

//fetch currently posted papers from database
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

//to get user details
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

//upload the answers and paper details to database
  Future<void> uploadAnswers(paper, answers, correct) async {
    Map<dynamic, dynamic> data =
        answers.map((k, v) => MapEntry(k.toString(), v));
    await databaseReference
        .collection("users")
        .document('0779195992')
        .collection("Papers")
        .document(paper.id)
        .setData({
      "paper_name": 'Paper ${paper.id}',
      "paper_URL": paper.url,
      "answers": data,
      "correct_answers": correct,
    });
  }

//Update leaderboard with paper marks. This is used by a paper object fucntion
  void updateLeaderboard(user, correct) async {
    var document = databaseReference.collection('leaderboard').document(user);
    await document.get().then(
      (userScore) async {
        if (userScore.exists) {
          int marks = userScore['score'];
          marks += correct;
          await databaseReference
              .collection("leaderboard")
              .document(user)
              .updateData({'score': marks});
        }
      },
    );
  }

//check if the user is trying paper for the first time.
  Future<bool> firstTime(user, paperid) async {
    var document = databaseReference
        .collection('leaderboard')
        .document(user)
        .collection("Papers")
        .document(paperid);
    await document.get().then((paper) {
      if (paper.exists) {
        return false;
      } else {
        return true;
      }
    });
    return null; //unreachable
  }
}
