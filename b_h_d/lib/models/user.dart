import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  String? uid;
  String? email;
  String? fullName;
  Timestamp? accountCreated;
  bool? hasEneteredWageInfo;
  double? dayRate;
  double? hoursInWorkDay;
  double? retentionAmount;
  String? paymentFrequency;

  MyUser({
    this.uid,
    this.email,
    this.fullName,
    this.accountCreated,
    this.hasEneteredWageInfo,
  });
}
