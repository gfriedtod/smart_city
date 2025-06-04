import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_city_app/presentation/components/CustomTextField.dart';


void main() {
  group('CustomTextField Tests', () {
    testWidgets('Renders with label and hint text', (WidgetTester tester) async {
      const String labelText = 'Username';
      const String hintText = 'Enter your username';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              label: labelText,
              hint: hintText,
            ),
          ),
        ),
      );

      expect(find.text(labelText), findsOneWidget);
      expect(find.text(hintText), findsOneWidget);
    });

    testWidgets('Uses the provided TextEditingController', (WidgetTester tester) async {
      final TextEditingController controller = TextEditingController();
      const String testText = 'Hello World';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              label: 'Test',
              hint: 'Enter text',
              controller: controller,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), testText);
      await tester.pump();

      expect(controller.text, testText);
    });

    testWidgets('Sets keyboardType correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              label: 'Email',
              hint: 'Enter email',
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ),
      );

      final TextField textField = tester.widget(find.byType(TextField));
      expect(textField.keyboardType, TextInputType.emailAddress);
    });

    testWidgets('Sets readOnly property correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              label: 'Read Only Field',
              hint: 'Cannot edit',
              readOnly: true,
            ),
          ),
        ),
      );

      final TextField textField = tester.widget(find.byType(TextField));
      expect(textField.readOnly, isTrue);

      await tester.enterText(find.byType(TextField), 'Some text');
      await tester.pump();

    });

  });
}