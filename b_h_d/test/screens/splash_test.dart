import 'package:b_h_d/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// check for app bar title
// check for text widget

void main() {
  testWidgets('splash screen has the correct text values', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SplashScreen(),
    ));
    final textFinder = find.text("loading.....");
    final appBarTitleFinder = find.text("Splash Screen");

    expect(textFinder, findsOneWidget);
    expect(appBarTitleFinder, findsOneWidget);
  });
}
