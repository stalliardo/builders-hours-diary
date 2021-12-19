import 'package:b_h_d/models/user.dart';
import 'package:b_h_d/services/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyDatabase {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<StatusCode> addUser(MyUser user) async {
    try {
      await _firestore.collection("users").doc(user.uid).set({
        "fullName": user.fullName,
        "email": user.email,
        "accountCreated": Timestamp.now(),
      });
    } catch (e) {
      print("Error adding user to the DB. Error: $e");
      return StatusCode.ERROR;
    }

    return StatusCode.SUCCESS;
  }

  Future<MyUser> getUser(String uid) async {
    MyUser user = MyUser();

    try {
      DocumentSnapshot _doc = await _firestore.collection("users").doc(uid).get();

      Map<String, dynamic> data = _doc.data() as Map<String, dynamic>;

      user.uid = uid;
      user.fullName = data["fullName"];
      user.email = data["email"];
      user.accountCreated = data["accountCreated"];
      user.hasEneteredWageInfo = data["hasEneteredWageInfo"];
    } catch (e) {
      print(e);
    }

    return user;
  }
}
