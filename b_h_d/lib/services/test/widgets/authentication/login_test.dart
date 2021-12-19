import 'package:b_h_d/screens/authentication.dart/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('the text "Log in" is found in a container', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Login()));

    expect(find.widgetWithText(Container, "Log in"), findsOneWidget);
  });

  testWidgets('one button with the text "Log in found"', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Login()));

    expect(find.widgetWithText(ElevatedButton, "Log in"), findsOneWidget);
  });

  testWidgets('there are two inputs on the screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Login()));

    expect(find.byType(TextField), findsNWidgets(2));
  });

  testWidgets('has the correct welcome message ', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Login()));

    final titleFinder = find.text("Welcome back! We've missed you :)");

    expect(titleFinder, findsOneWidget);
  });
}
