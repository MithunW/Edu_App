import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_app/Datalayer/classes/Database.dart';
import 'package:edu_app/Datalayer/classes/user.dart';

Database db = Database();
String number = '0779195992';

String getCurrentUser() {
  return number;
}

User checkUser() {
  // User user = db.getUserDetails(getCurrentUser());
  return null;
}
