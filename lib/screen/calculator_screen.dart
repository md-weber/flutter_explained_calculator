import 'package:flutter/material.dart';

enum Calculation { Divide, Multiply, Add, Subtract, None }

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String result = "0";
  String firstValue = "";
  String secondValue = "";
  Calculation activeCalculation = Calculation.None;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 300,
          padding: EdgeInsets.only(bottom: 8, right: 8),
          width: double.infinity,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              secondValue != ""
                  ? secondValue
                  : firstValue != ""
                      ? firstValue
                      : result,
              style: TextStyle(fontSize: 48),
            ),
          ),
          decoration: BoxDecoration(color: Colors.amberAccent),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CalculatorButtons(
              text: "AC",
              background: Colors.grey,
              onTap: () {
                setState(() {
                  result = "0";
                  firstValue = "";
                  secondValue = "";
                  activeCalculation = Calculation.None;
                });
              },
            ),
            CalculatorButtons(
              text: "+/-",
              background: Colors.grey,
              onTap: () {
                setState(() {
                  firstValue != ""
                      ? firstValue = (double.parse(firstValue) * -1).toString()
                      : result = (double.parse(result) * -1).toString();
                });
              },
            ),
            CalculatorButtons(
              text: "%",
              background: Colors.grey,
              onTap: () {
                firstValue != ""
                    ? firstValue = percent(double.parse(firstValue)).toString()
                    : result = percent(double.parse(firstValue)).toString();
              },
            ),
            CalculatorButtons(
              text: "÷",
              isActive: activeCalculation == Calculation.Divide,
              onTap: () {
                setActiveCalculation(Calculation.Divide);
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CalculatorButtons(
              text: "7",
              background: Colors.blueGrey,
              onTap: () {
                addNumber("7");
              },
            ),
            CalculatorButtons(
              text: "8",
              background: Colors.blueGrey,
              onTap: () {
                addNumber("8");
              },
            ),
            CalculatorButtons(
              text: "9",
              background: Colors.blueGrey,
              onTap: () {
                addNumber("9");
              },
            ),
            CalculatorButtons(
              text: "x",
              isActive: activeCalculation == Calculation.Multiply,
              onTap: () {
                setActiveCalculation(Calculation.Multiply);
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CalculatorButtons(
              text: "4",
              background: Colors.blueGrey,
              onTap: () {
                addNumber("4");
              },
            ),
            CalculatorButtons(
                text: "5",
                background: Colors.blueGrey,
                onTap: () {
                  addNumber("5");
                }),
            CalculatorButtons(
                text: "6",
                background: Colors.blueGrey,
                onTap: () {
                  addNumber("6");
                }),
            CalculatorButtons(
              text: "-",
              isActive: activeCalculation == Calculation.Subtract,
              onTap: () {
                setActiveCalculation(Calculation.Subtract);
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CalculatorButtons(
              text: "1",
              background: Colors.blueGrey,
              onTap: () {
                addNumber("1");
              },
            ),
            CalculatorButtons(
                text: "2",
                background: Colors.blueGrey,
                onTap: () {
                  addNumber("2");
                }),
            CalculatorButtons(
                text: "3",
                background: Colors.blueGrey,
                onTap: () {
                  addNumber("3");
                }),
            CalculatorButtons(
              text: "+",
              onTap: () {
                setActiveCalculation(Calculation.Add);
              },
              isActive: activeCalculation == Calculation.Add,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CalculatorButtons(
              text: "",
              background: Colors.blueGrey,
              onTap: () {
                addNumber("0");
              },
            ),
            CalculatorButtons(
              text: "0",
              background: Colors.blueGrey,
              onTap: () {
                addNumber("0");
              },
            ),
            CalculatorButtons(
              text: ",",
              background: Colors.blueGrey,
              onTap: () {
                addNumber(",");
              },
            ),
            CalculatorButtons(
              text: "=",
              onTap: () {
                setState(() {
                  calculateResult(activeCalculation);
                  firstValue = "";
                  secondValue = "";
                  activeCalculation = Calculation.None;
                });
              },
            ),
          ],
        )
      ],
    ));
  }

  void addNumber(String number) {
    setState(() {
      activeCalculation == Calculation.None
          ? firstValue = "$firstValue$number"
          : secondValue = "$secondValue$number";
    });
  }

  void setActiveCalculation(Calculation calculation) {
    setState(() {
      activeCalculation == calculation
          ? activeCalculation = Calculation.None
          : activeCalculation = calculation;
    });
  }

  String calculateResult(Calculation activeCalculation) {
    double a = result != "0" ? double.parse(result) : double.parse(firstValue);
    double b = double.parse(secondValue);

    if (activeCalculation == Calculation.Add) result = add(a, b).toString();
    if (activeCalculation == Calculation.Subtract)
      result = subtract(a, b).toString();
    if (activeCalculation == Calculation.Multiply)
      result = multiply(a, b).toString();
    if (activeCalculation == Calculation.Divide)
      result = divide(a, b).toString();

    return result;
  }
}

class CalculatorButtons extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isActive;
  final Color background;

  const CalculatorButtons({
    this.text,
    this.onTap,
    this.isActive = false,
    this.background = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      onTap: text == "" ? null : onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 24, color: isActive ? Colors.white : Colors.black),
          ),
        ),
        width: 75,
        height: 75,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: text == ""
                ? Colors.white
                : isActive
                    ? Colors.blue
                    : background,
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(1, 3),
              ),
            ]),
      ),
    );
  }
}
