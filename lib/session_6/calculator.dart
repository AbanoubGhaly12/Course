import 'package:flutter/material.dart';


class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  // State variables
  String output = "0"; // The value displayed on the screen
  String _output = "0"; // The internal value being built
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = ""; // The operation (+, -, *, /)

  // --- Core Logic for Calculation ---
  void buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "÷" || buttonText == "x") {
      // Store the first number and the operand
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      // Prevent multiple decimals
      if (_output.contains(".")) {
        return;
      }
      _output = _output + buttonText;
    } else if (buttonText == "=") {
      num2 = double.parse(_output);

      // Perform the calculation based on the stored operand
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "÷") {
        _output = (num1 / num2).toString();
      }

      // Reset for the next calculation
      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else {
      // Handle number input
      if (_output == "0") {
        _output = buttonText;
      } else {
        _output = _output + buttonText;
      }
    }

    // Update the UI state
    setState(() {
      // Ensure the output is formatted nicely (e.g., "1.0" becomes "1")
      if (_output.endsWith(".0")) {
        output = _output.substring(0, _output.length - 2);
      } else {
        output = _output;
      }
    });
  }

  // --- Button Widget Builder ---
  Widget buildButton(String buttonText, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(24.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  // --- UI Layout ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: <Widget>[
          // 1. Display Area
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
            child: Text(
              output,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Expanded(
            child: Divider(), // Separator line
          ),
          // 2. Button Grid
          Column(
            children: [
              // Row 1: CLEAR, ÷
              Row(
                children: [
                  buildButton("CLEAR", Colors.redAccent),
                  buildButton("÷", Colors.orange),
                ],
              ),
              // Row 2: 7, 8, 9, x
              Row(
                children: [
                  buildButton("7", Colors.blueGrey.shade700),
                  buildButton("8", Colors.blueGrey.shade700),
                  buildButton("9", Colors.blueGrey.shade700),
                  buildButton("x", Colors.orange),
                ],
              ),
              // Row 3: 4, 5, 6, -
              Row(
                children: [
                  buildButton("4", Colors.blueGrey.shade700),
                  buildButton("5", Colors.blueGrey.shade700),
                  buildButton("6", Colors.blueGrey.shade700),
                  buildButton("-", Colors.orange),
                ],
              ),
              // Row 4: 1, 2, 3, +
              Row(
                children: [
                  buildButton("1", Colors.blueGrey.shade700),
                  buildButton("2", Colors.blueGrey.shade700),
                  buildButton("3", Colors.blueGrey.shade700),
                  buildButton("+", Colors.orange),
                ],
              ),
              // Row 5: 0, ., =
              Row(
                children: [
                  buildButton("0", Colors.blueGrey.shade700),
                  buildButton(".", Colors.blueGrey.shade700),
                  buildButton("=", Colors.green),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}