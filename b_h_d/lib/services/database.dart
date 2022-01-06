import 'package:b_h_d/models/user.dart';
import 'package:b_h_d/services/authentication.dart';
import 'package:b_h_d/utils/stringFormatting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyDatabase {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<StatusCode> addUser(MyUser user) async {
    try {
      await _firestore.collection("users").doc(user.uid).set({
        "fullName": StringFormatting.toTitleCase(user.fullName),
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

  Future<MyUser> getUser(String uid) async {
    MyUser user = MyUser(accountCreated: Timestamp.now());

    try {
      DocumentSnapshot _doc = await _firestore.collection("users").doc(uid).get();

      Map<String, dynamic> data = _doc.data() as Map<String, dynamic>;

      user.uid = uid;
      user.fullName = data["fullName"] ?? "";
      user.email = data["email"] ?? "";
      user.accountCreated = data["accountCreated"] ?? Timestamp.now();
      user.hasEnteredWageInfo = data["hasEnteredWageInfo"] ?? false;
      user.dayRate = data["dayRate"].toDouble() ?? 0.0;
      user.hoursInWorkDay = data["hoursInWorkDay"].toDouble() ?? 0.0;
      user.retentionAmount = data["retentionAmount"].toDouble() ?? 0.0;
      user.paymentFrequency = data["paymentFrequency"] ?? "";
    } catch (e) {
      print(e);
    }

    return user;
  }

  Future<StatusCode> addInitialUserWageInfo(String uid, String paymentFrequency, double dayRate, double hoursInWorkDay, double retentionAmount) async {
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

  Future<StatusCode> updateSingleField(String uid, Map<String, Object> data) async {
    try {
      await _firestore.collection("users").doc(uid).update(data);
    } catch (e) {
      print("eeorr: $e");
      return StatusCode.ERROR;
    }
    return StatusCode.SUCCESS;
  }

  MyUser userDataFromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>;

    if (snapshot.data() != null) {
      return MyUser.full(
        uid: snapshot.id,
        fullName: data["fullName"] ?? "",
        email: data["email"] ?? "",
        hasEnteredWageInfo: data["hasEnteredWageInfo"] ?? false,
        dayRate: data["dayRate"].toDouble() ?? 0.0,
        hoursInWorkDay: data["hoursInWorkDay"].toDouble() ?? 0.0,
        retentionAmount: data["retentionAmount"].toDouble() ?? 0.0,
        paymentFrequency: data["paymentFrequency"] ?? "",
        accountCreated: data["accountCreated"] ?? Timestamp.now(),
      );
    } else {
      return MyUser(accountCreated: Timestamp.now());
    }
  }

  Stream<MyUser> userData(String uid) {
    return _firestore.collection("users").doc(uid).snapshots().map(userDataFromSnapshot);
  }

  Future<String> deleteUserData(uid) async {
    try {
      await _firestore.collection("users").doc(uid).delete();
    } catch (e) {
      return "Error";
    }

    return "Success";
  }
}
