import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_city_app/presentation/components/CustomTextField.dart';

void main() {
  testWidgets('CustomTextField displays label and hint text',
      (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            label: 'Test Label',
            hint: 'Test Hint',
            controller: controller,
          ),
        ),
      ),
    );

    expect(find.text('Test Label'), findsOneWidget);
    expect(find.text('Test Hint'), findsOneWidget);
  });

  testWidgets('CustomTextField updates when typing',
      (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            label: 'Test Label',
            hint: 'Test Hint',
            controller: controller,
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField), 'Test Input');
    expect(controller.text, equals('Test Input'));
  });
}