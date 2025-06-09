import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_city_app/domain/dto/AuthResponse.dart';
import 'package:smart_city_app/presentation/screens/profile/ProfilePage.dart';

class MockGoRouter extends Mock implements GoRouter {}
class MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  late MockGoRouter mockGoRouter;
  late MockLocalStorage mockLocalStorage;

  setUp(() {
    mockGoRouter = MockGoRouter();
    mockLocalStorage = MockLocalStorage();

    // Setup mock data
    final mockUser = {
      'user': {
        'username': 'Test User',
        'email': 'test@example.com'
      }
    };

    when(() => mockLocalStorage.getItem('user'))
        .thenReturn(jsonEncode(mockUser));
  });

  testWidgets('ProfilePage displays user information correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ProfilePage(),
      ),
    );

    // Verify that user information is displayed
    expect(find.text('Profile'), findsOneWidget);
    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.byIcon(Icons.edit), findsOneWidget);

    // Verify text fields
    final nameFieldFinder = find.widgetWithText(TextFormField, 'Name');
    final emailFieldFinder = find.widgetWithText(TextFormField, 'Email');

    expect(nameFieldFinder, findsOneWidget);
    expect(emailFieldFinder, findsOneWidget);
  });

  testWidgets('Update button triggers logout and navigation',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ProfilePage(),
      ),
    );

    // Find and tap update button
    final updateButtonFinder = find.text('update');
    expect(updateButtonFinder, findsOneWidget);

    await tester.tap(updateButtonFinder);
    await tester.pumpAndSettle();

    // Verify localStorage was cleared
    verify(() => mockLocalStorage.clear()).called(1);
  });

  testWidgets('Edit profile button shows edit icon',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ProfilePage(),
      ),
    );

    final editButtonFinder = find.byIcon(Icons.edit);
    expect(editButtonFinder, findsOneWidget);

    await tester.tap(editButtonFinder);
    await tester.pumpAndSettle();
  });
}