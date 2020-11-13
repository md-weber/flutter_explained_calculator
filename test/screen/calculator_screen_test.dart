import 'package:flutter/material.dart';
import 'package:flutter_explained_calculator/screen/calculator_screen.dart';
import 'package:flutter_explained_calculator/services/calculation_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCalculationService extends Mock implements CalculationService {
  @override
  double add(double a, double b) {
    return 13;
  }
}

void main() {
  group("Calculator Screen", () {
    testWidgets('should contain the whole Keyboard',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        createSubjectWidget(),
      );

      // Verify that our keyboard is visible
      expect(find.text("0"), findsNWidgets(2));
      expect(find.text("1"), findsOneWidget);
      expect(find.text("2"), findsOneWidget);
      expect(find.text("3"), findsOneWidget);
      expect(find.text("4"), findsOneWidget);
      expect(find.text("5"), findsOneWidget);
      expect(find.text("6"), findsOneWidget);
      expect(find.text("7"), findsOneWidget);
      expect(find.text("8"), findsOneWidget);
      expect(find.text("9"), findsOneWidget);
      expect(find.text("x"), findsOneWidget);
      expect(find.text("AC"), findsOneWidget);
      expect(find.text("+/-"), findsOneWidget);
      expect(find.text("="), findsOneWidget);
      expect(find.text("+"), findsOneWidget);
      expect(find.text("-"), findsOneWidget);
    });
  });

  testWidgets("should be calculating", (tester) async {
    await tester.pumpWidget(createSubjectWidget());

    await tester.tap(find.text("5"));
    await tester.tap(find.text("+"));
    await tester.tap(find.text("8"));
    await tester.tap(find.text("="));
    await tester.pump();

    expect(find.text("13.0"), findsOneWidget);
  });

  testWidgets("should render correctly", (tester) async {
    await tester.pumpWidget(createSubjectWidget());
    await expectLater(
        find.byType(CalculatorScreen), matchesGoldenFile('calculator.png'));
  });
}

MaterialApp createSubjectWidget() {
  return MaterialApp(
    home: CalculatorScreen(
      calculation: MockCalculationService(),
    ),
  );
}
