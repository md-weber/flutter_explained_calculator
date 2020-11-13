import 'package:flutter/material.dart';
import 'package:flutter_explained_calculator/screen/calculator_screen.dart';
import 'package:flutter_explained_calculator/services/calculation_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(
        calculation: CalculationService(),
      ),
    );
  }
}
