import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_city_app/presentation/components/button_comp.dart' as app_button;



void main() {
  group('ButtonComp Tests', () {
    testWidgets('Renders with the correct title', (WidgetTester tester) async {
      const String buttonTitle = 'Submit';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: app_button.ButtonComp(
              title: buttonTitle,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text(buttonTitle), findsOneWidget);
    });

    testWidgets('Calls onPressed callback when pressed', (WidgetTester tester) async {
      bool buttonPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: app_button.ButtonComp(
              title: 'Click Me',
              onPressed: () {
                buttonPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(buttonPressed, isTrue);
    });

    testWidgets('Applies default width when no width is provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: app_button.ButtonComp(
                title: 'Full Width Button',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      final SizedBox sizeBox = tester.widget(find.byType(SizedBox));
      expect(sizeBox.width, double.infinity);
    });

    testWidgets('Applies specific width when provided', (WidgetTester tester) async {
      const double customWidth = 200.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: app_button.ButtonComp(
              title: 'Custom Width Button',
              width: customWidth,
              onPressed: () {},
            ),
          ),
        ),
      );

      final SizedBox sizeBox = tester.widget(find.byType(SizedBox));
      expect(sizeBox.width, customWidth);
    });


  });
}