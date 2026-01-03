import 'package:flutter/material.dart';

void main() {
  runApp(const BmiApp());
}

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BmiScreen(),
    );
  }
}

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double height = 170;
  double weight = 65;
  double bmi = 0;

  Color bmiColor = Colors.blue;
  String emoji = "😐";
  String status = "Move sliders";

  void calculateBMI() {
    double h = height / 100;

    setState(() {
      bmi = weight / (h * h);

      if (bmi < 18.5) {
        bmiColor = Colors.orange;
        emoji = "😟";
        status = "Underweight";
      } else if (bmi < 25) {
        bmiColor = Colors.green;
        emoji = "😄";
        status = "Normal";
      } else {
        bmiColor = Colors.red;
        emoji = "😵";
        status = "Overweight";
      }
    });
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
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20,
                )
              ],
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

                Container(
                  // duration: const Duration(milliseconds: 400),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: bmiColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        bmi == 0 ? "--" : bmi.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        emoji,
                        style: const TextStyle(fontSize: 40),
                      ),
                      Text(
                        status,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
                    calculateBMI();
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
                  value: 0,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white30,
                  onChanged: (value) {
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> with SingleTickerProviderStateMixin {
  double _weight = 70;
  double _height = 170;
  String _lastChanged = '';
  bool _showExplanation = false;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  double get _bmi {
    final heightInMeters = _height / 100;
    return _weight / (heightInMeters * heightInMeters);
  }

  String get _category {
    if (_bmi < 18.5) return 'Underweight';
    if (_bmi < 25) return 'Normal';
    if (_bmi < 30) return 'Overweight';
    return 'Obese';
  }

  Color get _categoryColor {
    if (_bmi < 18.5) return Colors.blue;
    if (_bmi < 25) return Colors.green;
    if (_bmi < 30) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF0A0E27),
              const Color(0xFF5B21B6),
              const Color(0xFF0A0E27),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.fitness_center, color: Colors.purple[300], size: 48),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BMI Calculator',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Understanding setState in Flutter',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.purple[300],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Main Card
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: Colors.purple.withOpacity(0.3)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // BMI Display
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              _categoryColor.withOpacity(0.3),
                              _categoryColor.withOpacity(0.1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: _categoryColor.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.bolt, color: Colors.yellow[700], size: 16),
                                const SizedBox(width: 8),
                                Text(
                                  'Your BMI',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 300),
                              style: TextStyle(
                                fontSize: 72,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              child: Text(_bmi.toStringAsFixed(1)),
                            ),
                            const SizedBox(height: 8),
                            AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 300),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: _categoryColor,
                              ),
                              child: Text(_category),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Weight Slider
                      _buildSlider(
                        label: 'Weight',
                        value: _weight,
                        min: 30,
                        max: 200,
                        unit: 'kg',
                        isWeight: true,
                        onChanged: (value) {
                          setState(() {
                            _weight = value;
                            _lastChanged = 'weight';
                          });
                          _pulseController.forward(from: 0);
                        },
                      ),
                      const SizedBox(height: 24),

                      // Height Slider
                      _buildSlider(
                        label: 'Height',
                        value: _height,
                        min: 100,
                        max: 250,
                        unit: 'cm',
                        isWeight: false,
                        onChanged: (value) {
                          setState(() {
                            _height = value;
                            _lastChanged = 'height';
                          });
                          _pulseController.forward(from: 0);
                        },
                      ),
                      const SizedBox(height: 24),

                      // Explanation Button
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showExplanation = !_showExplanation;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7C3AED),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 8,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.code),
                            const SizedBox(width: 8),
                            Text(
                              _showExplanation ? 'Hide setState Explanation' : 'Show setState Explanation',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),

                      // Explanation Panel
                      if (_showExplanation)
                        Container(
                          margin: const EdgeInsets.only(top: 24),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.purple.withOpacity(0.2),
                                Colors.pink.withOpacity(0.2),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.purple.withOpacity(0.3)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '🎯 How setState Works Here:',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple[300],
                                ),
                              ),
                              const SizedBox(height: 16),
                              _buildExplanationStep('1', 'When you move a slider, setState() is called'),
                              _buildExplanationStep('2', 'This tells Flutter: "Hey! My data changed!"'),
                              _buildExplanationStep('3', 'Flutter recalculates BMI with new values'),
                              _buildExplanationStep('4', 'The UI rebuilds to show the new BMI'),
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.purple.withOpacity(0.2)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '// Flutter Code Example:',
                                      style: TextStyle(
                                        color: Colors.purple[300],
                                        fontFamily: 'monospace',
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'setState(() {\n  _weight = newValue;\n});',
                                      style: TextStyle(
                                        color: Colors.green[400],
                                        fontFamily: 'monospace',
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Without setState, values change but UI doesn\'t update!',
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // BMI Scale Reference
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.purple.withOpacity(0.2)),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'BMI Scale Reference',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          _buildScaleItem('< 18.5', 'Under', Colors.blue),
                          const SizedBox(width: 8),
                          _buildScaleItem('18.5-24.9', 'Normal', Colors.green),
                          const SizedBox(width: 8),
                          _buildScaleItem('25-29.9', 'Over', Colors.orange),
                          const SizedBox(width: 8),
                          _buildScaleItem('≥ 30', 'Obese', Colors.red),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSlider({
    required String label,
    required double value,
    required double min,
    required double max,
    required String unit,
    required bool isWeight,
    required ValueChanged<double> onChanged,
  }) {
    final isActive = (isWeight && _lastChanged == 'weight') ||
        (!isWeight && _lastChanged == 'height');

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.purple.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                '${value.toInt()} $unit',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[300],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SliderTheme(
            data: SliderThemeData(
              activeTrackColor: Colors.purple[400],
              inactiveTrackColor: Colors.grey[700],
              thumbColor: Colors.purple[300],
              overlayColor: Colors.purple.withOpacity(0.2),
              trackHeight: 8,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
            ),
            child: Slider(
              value: value,
              min: min,
              max: max,
              onChanged: onChanged,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${min.toInt()} $unit', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
              Text('${max.toInt()} $unit', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
            ],
          ),
          if (isActive)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.bolt, color: Colors.yellow[700], size: 14),
                  const SizedBox(width: 4),
                  Text(
                    'setState called! UI rebuilt',
                    style: TextStyle(
                      color: Colors.green[400],
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildExplanationStep(String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.purple[400],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScaleItem(String range, String label, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Text(
              range,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}