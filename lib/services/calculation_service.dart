class CalculationService {
  double add(double a, double b) {
    return a + b;
  }

  double subtract(double a, double b) {
    return a - b;
  }

  double multiply(double a, double b) {
    return a * b;
  }

  double divide(double a, double b) {
    if (b == 0) throw ArgumentError("Dividing through 0 is not possible");
    return a / b;
  }

  double percent(double a) {
    return a / 100;
  }

  double changeSymbol(double a) {
    return a * -1;
  }
}
