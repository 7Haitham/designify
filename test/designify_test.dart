import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:designify/designify.dart';

void main() {
  group('DesignifyText Tests', () {
    testWidgets('Displays correct text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DesignifyText('Test Text'),
          ),
        ),
      );
      expect(find.text('Test Text'), findsOneWidget);
    });
  });

  group('DesignifyElevatedButton Tests', () {
    testWidgets('Calls onPressed when tapped', (WidgetTester tester) async {
      bool wasPressed = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DesignifyElevatedButton(
              text: 'Click Me',
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DesignifyElevatedButton));
      await tester.pump();
      
      expect(wasPressed, isTrue);
    });
  });

  group('DesignifyInputField Tests', () {
    testWidgets('Displays label correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DesignifyInputField(
              label: 'Test Field',
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
            ),
          ),
        ),
      );
      
      expect(find.text('Test Field'), findsOneWidget);
    });
  });

  // Add more test cases for other components as needed
}
