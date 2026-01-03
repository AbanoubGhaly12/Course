import 'package:flutter/material.dart';

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  double sum2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Calculator')),
      body: Column(
        children: [
          TextFormField(
            controller: _controller1,
            decoration: const InputDecoration(labelText: 'Enter First number'),
            keyboardType: TextInputType.number,
          ),

          TextFormField(
            controller: _controller2,
            decoration: const InputDecoration(labelText: 'Enter Second number'),
            keyboardType: TextInputType.number,
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                double num1 = double.parse(_controller1.text);
                double num2 = double.parse(_controller2.text);
                sum2 = num1 + num2;
              });

            },
            child: const Text('Calculate Sum'),
          ),

          SizedBox(
            height: 20,
          ),

          Text('The sum is $sum2'),
        ],
      ),
    );
  }
}
