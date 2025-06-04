import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_city_app/presentation/components/CustomPasswordField.dart';


void main() {
  group('CustomPasswordField Tests', () {
    testWidgets('Renders with label and hint text', (WidgetTester tester) async {
      const String labelText = 'Password';
      const String hintText = 'Enter your password';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomPasswordField(
              label: labelText,
              hint: hintText,
            ),
          ),
        ),
      );

      // Vérifie que le libellé et le texte d'indication sont présents
      expect(find.text(labelText), findsOneWidget);
      expect(find.text(hintText), findsOneWidget);
    });

    testWidgets('Toggles password visibility when eye icon is pressed', (WidgetTester tester) async {
      final TextEditingController controller = TextEditingController(text: 'secret');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomPasswordField(
              label: 'Password',
              hint: 'Enter password',
              controller: controller,
            ),
          ),
        ),
      );

      // Le champ doit être obscurci au départ
      final TextField textField = tester.widget(find.byType(TextField));
      expect(textField.obscureText, isTrue);

      // Appuie sur l'icône de l'œil
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump(); // Rebuild the widget after state change

      // Le champ ne doit plus être obscurci
      final TextField newTextField = tester.widget(find.byType(TextField));
      expect(newTextField.obscureText, isFalse);

      // Appuie à nouveau sur l'icône de l'œil
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      // Le champ doit être obscurci à nouveau
      final TextField finalTextField = tester.widget(find.byType(TextField));
      expect(finalTextField.obscureText, isTrue);
    });

  });
}