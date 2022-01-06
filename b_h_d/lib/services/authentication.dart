import 'dart:async';
import 'package:b_h_d/models/user.dart';
import 'package:b_h_d/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum ApplicationLoginState { loggedIn, loggedOut, unknown, emailVerified }
enum StatusCode { ERROR, SUCCESS, USER_DOES_NOT_EXIST }

class Auth extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;

  late MyUser _user;

  MyUser get user => _user;

  Auth() {
    init();
  }

  Future<void> init() async {
    _auth.userChanges().listen((user) async {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
        _user = await MyDatabase().getUser(user.uid);

        if (user.emailVerified) {
          _loginState = ApplicationLoginState.emailVerified;
        }
      } else {
        _loginState = ApplicationLoginState.loggedOut;
        _user = MyUser(accountCreated: Timestamp.now());
      }
      notifyListeners();
    });
  }

  Future<StatusCode> signOut() async {
    try {
      await _auth.signOut();
      _user = MyUser(accountCreated: Timestamp.now());
    } catch (e) {
      print(e);
      return StatusCode.ERROR;
    }

    notifyListeners();
    return StatusCode.SUCCESS;
  }

  Future<StatusCode> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return StatusCode.SUCCESS;
    } catch (e) {
      return StatusCode.ERROR;
    }
  }

  Future<StatusCode> createUserWithEmailAndPassword(String email, String password, String fullName) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      MyUser _user = MyUser(email: email, fullName: fullName, uid: credential.user!.uid, accountCreated: Timestamp.now());

      await MyDatabase().addUser(_user);

      await sendVerificationEmail();

      return StatusCode.SUCCESS;
    } catch (e) {
      print("Error signing user in. Error: $e");
      return StatusCode.ERROR;
    }
  }

  Future<StatusCode> sendForgottonPasswordEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print("Error sending the password reset email. Error: ${e.code}");
      if (e.code == "user-not-found") {
        return StatusCode.USER_DOES_NOT_EXIST;
      }
      return StatusCode.ERROR;
    }
    return StatusCode.SUCCESS;
  }

  Future<void> sendVerificationEmail() async {
    return await _auth.currentUser?.sendEmailVerification();
  }

  Future<StatusCode> reAuthUser(String email, String password) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } catch (e) {
      print("error on reauth. Error: $e");
      return StatusCode.ERROR;
    }

    return StatusCode.SUCCESS;
  }

  Future<String> updateUsersEmail(String email, String password, String newEmail) async {
    try {
      await reAuthUser(email, password);
      await _auth.currentUser!.updateEmail(newEmail);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print(e.message);
      if (e.code == "requires-recent-login") {
        return "An error occurred! Please check your details and try again.";
      }
      return e.message!;
    } catch (e) {
      return "An error occurred";
    }

    return "Success";
  }

  Future<String> changeUsersPassword(String password, String newPassword) async {
    try {
      await reAuthUser(_auth.currentUser!.email!, password);
      await _auth.currentUser!.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print(e.message);
      if (e.code == "requires-recent-login") {
        return "An error occurred! Please check your details and try again.";
      }
      return e.message!;
    } catch (e) {
      return "An error occurred";
    }

    return "Success";
  }

  Future<String> deleteUsersAccount(String password) async {
    try {
      StatusCode _response = await reAuthUser(_auth.currentUser!.email!, password);

      if (_response == StatusCode.SUCCESS) {
        String _deleteResponse = await MyDatabase().deleteUserData(_auth.currentUser!.uid);

        if (_deleteResponse == "Success") {
          await _auth.currentUser!.delete();
        }
      } else {
        return "An error occured!. Please try again.";
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print(e.message);
      if (e.code == "requires-recent-login") {
        return "An error occurred! Please check your details and try again.";
      }
      return e.message!;
    } catch (e) {
      return "An error occurred";
    }

    return "Success";
  }
}
