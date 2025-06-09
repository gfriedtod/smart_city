import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_city_app/presentation/screens/login/SigninPage.dart';

void main() {
  group('Login Page Widget Tests', () {
    testWidgets('Login page shows email and password fields',
            (WidgetTester tester) async {
          await tester.pumpWidget(const MaterialApp(home: SignInPage()));

          expect(find.byType(TextFormField), findsNWidgets(2));
          expect(find.byType(ElevatedButton), findsOneWidget);
        });

    testWidgets('Shows error on empty email field',
            (WidgetTester tester) async {
          await tester.pumpWidget(const MaterialApp(home: SignInPage()));

          await tester.tap(find.byType(ElevatedButton));
          await tester.pump();

          expect(find.text('Email is required'), findsOneWidget);
        });

    testWidgets('Shows error on invalid email format',
            (WidgetTester tester) async {
          await tester.pumpWidget(const MaterialApp(home: SignInPage()));

          await tester.enterText(
              find
                  .byType(TextFormField)
                  .first, 'invalid-email');
          await tester.tap(find.byType(ElevatedButton));
          await tester.pump();

          expect(find.text('Enter a valid email'), findsOneWidget);
        });

    testWidgets('Shows error on empty password field',
            (WidgetTester tester) async {
          await tester.pumpWidget(const MaterialApp(home: SignInPage()));

          await tester.enterText(
              find
                  .byType(TextFormField)
                  .first, 'test@example.com');
          await tester.tap(find.byType(ElevatedButton));
          await tester.pump();

          expect(find.text('Password is required'), findsOneWidget);
        });
  });
}