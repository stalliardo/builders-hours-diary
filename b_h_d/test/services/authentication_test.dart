import 'package:b_h_d/services/authentication.dart';
import 'package:b_h_d/services/test/firebaseTestHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'authentication_test.mocks.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseCore extends Mock implements Firebase {}

// class MockAuth extends Mock implements Auth {}

class MockUser extends Mock implements User {}

@GenerateMocks([Auth])
void main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();

  // setUpAll() async {

  // }

  final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
  final MockFirebaseCore mockFirebaseCore = MockFirebaseCore();
  final MockAuth mockAuth = MockAuth();
  final MockUser mockUser = MockUser();

  test("_loginState should default to ApplicationState.loggedOut", () async {
    final Auth auth = Auth();
    Auth _auth = Auth();

    expect(_auth.loginState, ApplicationLoginState.loggedOut);
  });

  // TODO research mocktail instead as this is buggy

  // test("user is signed out successfully", () async {
  //   when(
  //     await mockAuth.signOut(),
  //   ).thenAnswer((realInvocation) => Future<StatusCode>.value());

  //   expect(await mockAuth.signOut(), StatusCode.ERROR);
  //   // expect(mockUser, null);
  // });
}
