import 'package:flutter/material.dart';
/* ===========================
   SCREEN 1: INPUT
=========================== */

class BmiInputScreen extends StatefulWidget {
  const BmiInputScreen({super.key});

  @override
  State<BmiInputScreen> createState() => _BmiInputScreenState();
}

class _BmiInputScreenState extends State<BmiInputScreen> {
  double height = 170;
  double weight = 65;
  double bmi = 0;

  void calculateAndNavigate() {
    double h = height / 100;
    bmi = weight / (h * h);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BmiResultScreen(bmi: bmi),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            width: 330,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "BMI Calculator",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 25),

                Text(
                  "Height: ${height.toInt()} cm",
                  style: const TextStyle(color: Colors.white),
                ),
                Slider(
                  min: 140,
                  max: 200,
                  value: height,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white30,
                  onChanged: (value) {
                    setState(() {
                      height = value;
                    });
                  },
                ),

                const SizedBox(height: 10),

                Text(
                  "Weight: ${weight.toInt()} kg",
                  style: const TextStyle(color: Colors.white),
                ),
                Slider(
                  min: 40,
                  max: 120,
                  value: weight,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white30,
                  onChanged: (value) {
                    setState(() {
                      weight = value;
                    });
                  },
                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    calculateAndNavigate();
                  },
                  child: const Text(
                    "CALCULATE 🚀",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* ===========================
   SCREEN 2: RESULT
=========================== */

class BmiResultScreen extends StatelessWidget {
  final double bmi;

  const BmiResultScreen({super.key, required this.bmi});

  Color getColor() {
    if (bmi < 18.5) return Colors.orange;
    if (bmi < 25) return Colors.green;
    return Colors.red;
  }

  String getEmoji() {
    if (bmi < 18.5) return "😟";
    if (bmi < 25) return "😄";
    return "😵";
  }

  String getStatus() {
    if (bmi < 18.5) return "Underweight";
    if (bmi < 25) return "Normal";
    return "Overweight";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: getColor(),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                getEmoji(),
                style: const TextStyle(fontSize: 80),
              ),
              const SizedBox(height: 20),
              Text(
                bmi.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                getStatus(),
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 15),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("GO BACK 🔙"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

