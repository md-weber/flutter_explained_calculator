import 'package:flutter_explained_calculator/services/calculation_service.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late CalculationService subject;

  setUp(() {
    subject = CalculationService();
  });

  group("add", () {
    test("should do add two numbers", () {
      final result = subject.add(100, 200);
      expect(result, 300);
    });

    test("should add negative numbers", () {
      final result = subject.add(-100, -200);
      expect(result, -300);
    });

    test("should add 0", () {
      final result = subject.add(0, 0);
      expect(result, 0);
    });

    test("what about doubles?", () {
      expect(subject.add(0.2, 0.3), 0.5);
    });
  });

  group("subtract", () {
    test("should subtract two numbers", () {
      final result = subject.subtract(100, 200);
      expect(result, -100);
    });

    test("should subtract 0", () {
      final result = subject.subtract(0, 0);
      expect(result, 0);
    });

    test("should subtract negative numbers", () {
      final result = subject.subtract(-100, -200);
      expect(result, 100);
    });
  });

  group("multiply", () {
    test("should multiply two numbers", () {
      final result = subject.multiply(100, 30);
      expect(result, 3000);
    });

    test("should multiply 0", () {
      final result = subject.multiply(0, 0);
      expect(result, 0);
    });

    test("should multiply negative numbers", () {
      final result = subject.multiply(-100, -200);
      expect(result, 20000);
    });
  });

  group("divide", () {
    test("should divide two numbers", () {
      final result = subject.divide(5, 10);
      expect(result, 0.5);
    });

    test("should divide 0", () {
      expect(() => subject.divide(500, 0), throwsArgumentError);
    });

    test("should divide negative numbers", () {
      final result = subject.multiply(-100, -200);
      expect(result, 20000);
    });
  });

  group("percent", () {
    test("should divide two numbers", () {
      final result = subject.percent(5);
      expect(result, 0.05);
    });

    test("should divide two numbers", () {
      final result = subject.percent(-5);
      expect(result, -0.05);
    });
  });

  group("changeSymbol", () {
    test("should change symbol", () {
      final result = subject.changeSymbol(5);
      expect(result, -5);
    });

    test("should change symbol negative number", () {
      expect(subject.changeSymbol(-500), 500);
    });
  });
}
