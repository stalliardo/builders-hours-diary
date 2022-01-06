import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  String uid;
  String email;
  String fullName;
  Timestamp accountCreated;
  bool hasEnteredWageInfo;
  double dayRate = 0.0;
  double hoursInWorkDay = 0.0;
  double retentionAmount = 0.0;
  String paymentFrequency = "";

  MyUser({
    this.uid = "",
    this.email = "",
    this.fullName = "",
    required this.accountCreated,
    this.hasEnteredWageInfo = false,
  });

  MyUser.full({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.accountCreated,
    required this.hasEnteredWageInfo,
    required this.dayRate,
    required this.hoursInWorkDay,
    required this.retentionAmount,
    required this.paymentFrequency,
  });
}
