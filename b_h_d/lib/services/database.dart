import 'package:b_h_d/models/user.dart';
import 'package:b_h_d/services/authentication.dart';
import 'package:b_h_d/utils/stringFormatting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyDatabase {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<StatusCode> addUser(MyUser user) async {
    try {
      await _firestore.collection("users").doc(user.uid).set({
        "fullName": StringFormatting.toTitleCase(user.fullName!),
        "email": user.email,
        "accountCreated": Timestamp.now(),
        "dayRate": 0.0,
        "hoursInWorkDay": 0.0,
        "retentionAmount": 0.0,
        "paymentFrequency": "Weekly",
        "hasEnteredWageInfo": false
      });
    } catch (e) {
      print("Error adding user to the DB. Error: $e");
      return StatusCode.ERROR;
    }

    return StatusCode.SUCCESS;
  }

  // Convert below to a stream

  Future<MyUser> getUser(String uid) async {
    MyUser user = MyUser();

    try {
      DocumentSnapshot _doc = await _firestore.collection("users").doc(uid).get();

      Map<String, dynamic> data = _doc.data() as Map<String, dynamic>;

      user.uid = uid;
      user.fullName = data["fullName"];
      user.email = data["email"];
      user.accountCreated = data["accountCreated"];
      user.hasEnteredWageInfo = data["hasEnteredWageInfo"];
      user.dayRate = data["dayRate"].toDouble();
      user.hoursInWorkDay = data["hoursInWorkDay"].toDouble();
      user.retentionAmount = data["retentionAmount"].toDouble();
      user.paymentFrequency = data["paymentFrequency"];
    } catch (e) {
      print(e);
    }

    return user;
  }

  Future<StatusCode> addInitialUserWageInfo(String uid, String paymentFrequency, double dayRate, double hoursInWorkDay, double retentionAmount) async {
    print("addinitial called");
    try {
      await _firestore
          .collection("users")
          .doc(uid)
          .update({"dayRate": dayRate, "paymentFrequency": paymentFrequency, "hoursInWorkDay": hoursInWorkDay, "retentionAmount": retentionAmount, "hasEnteredWageInfo": true});
    } catch (e) {
      return StatusCode.ERROR;
    }
    return StatusCode.SUCCESS;
  }

  MyUser userDataFromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return MyUser.full(
      uid: snapshot.id, //?
      fullName: data["fullName"],
      email: data["email"],
      hasEnteredWageInfo: data["hasEnteredWageInfo"],
      dayRate: data["dayRate"].toDouble(),
      hoursInWorkDay: data["hoursInWorkDay"].toDouble(),
      retentionAmount: data["retentionAmount"].toDouble(),
      paymentFrequency: data["paymentFrequency"],
    );
  }

  // Get user doc stream
  Stream<MyUser> userData(String uid) {
    return _firestore.collection("users").doc(uid).snapshots().map(userDataFromSnapshot);
  }
}
