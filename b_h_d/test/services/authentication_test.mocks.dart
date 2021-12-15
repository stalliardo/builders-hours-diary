// Mocks generated by Mockito 5.0.7 from annotations
// in b_h_d/test/services/authentication_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;
import 'dart:ui' as _i4;

import 'package:b_h_d/services/authentication.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

/// A class which mocks [Auth].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuth extends _i1.Mock implements _i2.Auth {
  MockAuth() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ApplicationLoginState get loginState =>
      (super.noSuchMethod(Invocation.getter(#loginState),
              returnValue: _i2.ApplicationLoginState.loggedIn)
          as _i2.ApplicationLoginState);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i3.Future<void> init() => (super.noSuchMethod(Invocation.method(#init, []),
      returnValue: Future<void>.value(null),
      returnValueForMissingStub: Future.value()) as _i3.Future<void>);
  @override
  _i3.Future<_i2.StatusCode> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
              returnValue: Future<_i2.StatusCode>.value(_i2.StatusCode.ERROR))
          as _i3.Future<_i2.StatusCode>);
  @override
  _i3.Future<_i2.StatusCode> signInWithEmailAndPassword(
          String? email, String? password) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithEmailAndPassword, [email, password]),
              returnValue: Future<_i2.StatusCode>.value(_i2.StatusCode.ERROR))
          as _i3.Future<_i2.StatusCode>);
  @override
  _i3.Future<_i2.StatusCode> createUserWithEmailAndPassword(
          String? email, String? password, String? fullName) =>
      (super.noSuchMethod(
              Invocation.method(
                  #createUserWithEmailAndPassword, [email, password, fullName]),
              returnValue: Future<_i2.StatusCode>.value(_i2.StatusCode.ERROR))
          as _i3.Future<_i2.StatusCode>);
  @override
  _i3.Future<_i2.StatusCode> sendForgottonPasswordEmail(String? email) => (super
          .noSuchMethod(Invocation.method(#sendForgottonPasswordEmail, [email]),
              returnValue: Future<_i2.StatusCode>.value(_i2.StatusCode.ERROR))
      as _i3.Future<_i2.StatusCode>);
  @override
  _i3.Future<void> sendVerificationEmail() =>
      (super.noSuchMethod(Invocation.method(#sendVerificationEmail, []),
          returnValue: Future<void>.value(null),
          returnValueForMissingStub: Future.value()) as _i3.Future<void>);
  @override
  void addListener(_i4.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i4.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
}
