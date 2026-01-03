import 'package:flutter/material.dart';

class BmiDemo extends StatefulWidget {
  const BmiDemo({super.key});

  @override
  State<BmiDemo> createState() => _BmiDemoState();
}

class _BmiDemoState extends State<BmiDemo> {
  // Inputs
  double height = 180;
  double weight = 75;

  // Outputs
  double bmi = 0;
  String bmiCategory = "_______";
  String bmiEmoji = "_______";
  Color bmiColor = Colors.red;

  void calculateBmi() {
    double h = height / 100;
    setState(() {
      bmi = weight / (h * h);
      if (bmi < 18.5) {
        bmiCategory = "Underweight";
        bmiEmoji = "😟";
        bmiColor = Colors.yellow;
      } else if (bmi < 24.9) {
        bmiCategory = "Normal weight";
        bmiEmoji = "😊";
        bmiColor = Colors.green;
      } else if (bmi < 29.9) {
        bmiCategory = "Overweight";
        bmiEmoji = "😐";
        bmiColor = Colors.orange;
      } else {
        bmiCategory = "Obesity";
        bmiEmoji = "😟";
        bmiColor = Colors.red;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "BMI Calculator",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: bmiColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        bmi.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        bmiEmoji,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        bmiCategory,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Height: ${height.toInt()} cm",
                  style: TextStyle(color: Colors.white),
                ),
                Slider(
                  min: 140,
                  max: 210,
                  value: height,
                  onChanged: (value) {
                    setState(() {
                      height = value;
                    });
                    calculateBmi();
                  },
                ),
                SizedBox(height: 10),
                Text(
                  "Weight:  ${weight.toInt()} kg",
                  style: TextStyle(color: Colors.white),
                ),
                Slider(min: 40, max: 175, value: weight, onChanged: (value) {
                  setState(() {
                    weight = value;
                  });
                  calculateBmi();
                }),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
