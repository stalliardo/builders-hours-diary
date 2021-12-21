import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  String? uid;
  String? email;
  String? fullName;
  Timestamp? accountCreated;
  bool? hasEnteredWageInfo;
  double? dayRate;
  double? hoursInWorkDay;
  double? retentionAmount;
  String? paymentFrequency;

  MyUser({
    this.uid,
    this.email,
    this.fullName,
    this.accountCreated,
    this.hasEnteredWageInfo,
  });

  MyUser.full({this.uid, this.email, this.fullName, this.accountCreated, this.hasEnteredWageInfo, this.dayRate, this.hoursInWorkDay, this.retentionAmount, this.paymentFrequency});
}
