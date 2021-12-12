import 'package:b_h_d/models/user.dart';
import 'package:b_h_d/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum ApplicationLoginState { loggedIn, loggedOut, unknown }
enum StatusCode { ERROR, SUCCESS }

class Auth extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;

  MyUser? _user;

  MyUser? get user => _user;

  Auth() {
    print("init called");
    init();
  }

  Future<void> init() async {
    _auth.userChanges().listen((user) async {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
        // TODO build the userModel
        // _user = MyUser(uid: user.uid, email: user.email);
        _user = await MyDatabase().getUser(user.uid);
        print("user: ${_user!.fullName}");
        print("user: ${user.uid}");
      } else {
        _loginState = ApplicationLoginState.loggedOut;
        _user = null;
      }
      notifyListeners();
    });
  }

  Future<StatusCode> signOut() async {
    try {
      await _auth.signOut();
      _user = null;
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

      //TODO Add the user to the DB

      return StatusCode.SUCCESS;
    } catch (e) {
      print("Error signing user in. Error: $e");
      return StatusCode.ERROR;
    }
  }

  Future<StatusCode> createUserWithEmailAndPassword(String email, String password, String fullName) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      MyUser _user = MyUser(email: email, fullName: fullName, uid: credential.user?.uid);

      await MyDatabase().addUser(_user);

      return StatusCode.SUCCESS;
    } catch (e) {
      print("Error signing user in. Error: $e");
      return StatusCode.ERROR;
    }
  }
}
