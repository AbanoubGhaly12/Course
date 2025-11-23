import 'package:flutter/material.dart';

class SingleChildWidgetsDemo extends StatelessWidget {
  const SingleChildWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Session 4'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'I\'m a Container!',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'I\'m a Container!',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'I\'m a Container!',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'I\'m a Container!',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'I\'m a Container!',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Section Header
            _buildSectionHeader('1. LAYOUT & SPACING'),

            // Container Example
            _buildExampleTitle('Container - Styled box with everything'),
            Container(
              width: 200,
              height: 100,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'I\'m a Container!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            SizedBox(height: 10),

            // SizedBox Example
            _buildExampleTitle('SizedBox - Fixed size spacing'),
            Container(
              color: Colors.amber.shade100,
              child: Column(
                children: [
                  Text('Text 1'),
                  SizedBox(height: 30), // Spacing
                  Text('Text 2'),
                  SizedBox(height: 50), // More spacing
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: Container(
                      color: Colors.orange,
                      child: Center(child: Text('Fixed Size')),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Padding Example
            _buildExampleTitle('Padding - Space around child'),
            Container(
              color: Colors.green.shade100,
              // EdgeInsets.all(double value)
              // EdgeInsets.symmetric(horizontal: double h, vertical: double v)
              // EdgeInsets.only({left, top, right, bottom})
              child: Padding(
                padding: EdgeInsets.only(left: 5, top: 50, right: 15, bottom: 24),
                child: Text(
                  'I have 24px padding all around!',
                  style: TextStyle(backgroundColor: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Align Example
            _buildExampleTitle('Align - Position child'),
            Container(
              height: 120,
              color: Colors.purple.shade50,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.purple,
                  child: Text('Bottom Right!', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Center Example
            _buildExampleTitle('Center - Centers child'),
            Container(
              height: 100,
              color: Colors.pink.shade50,
              child: Center(
                child: Text('I\'m centered!', style: TextStyle(fontSize: 18)),
              ),
            ),

            SizedBox(height: 30),

            // Section 2
            _buildSectionHeader('2. VISUAL EFFECTS'),

            // Opacity Example
            _buildExampleTitle('Opacity - Transparency'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Opacity(
                  opacity: 1.0,
                  child: _buildColorBox('100%', Colors.red),
                ),
                Opacity(
                  opacity: 0.5,
                  child: _buildColorBox('50%', Colors.red),
                ),
                Opacity(
                  opacity: 0.2,
                  child: _buildColorBox('20%', Colors.red),
                ),
              ],
            ),

            SizedBox(height: 20),

            // DecoratedBox Example
            _buildExampleTitle('DecoratedBox - Add decoration'),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.white, Colors.black],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Gradient Background!',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            SizedBox(height: 20),

            // ClipRRect Example
            _buildExampleTitle('ClipRRect - Rounded corners'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Without clip
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.orange,
                  child: Center(child: Text('No clip')),
                ),
                // With clip
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: 80,
                    height: 80,
                    color: Colors.orange,
                    child: Center(child: Text('Clipped')),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Transform Example
            _buildExampleTitle('Transform - Rotate/Scale'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Transform.rotate(
                  angle: 3.14 * 2 ,
                  child: _buildColorBox('Rotated', Colors.teal),
                ),
                Transform.scale(
                  scale: 2,
                  child: _buildColorBox('Scaled', Colors.indigo),
                ),
              ],
            ),

            SizedBox(height: 30),

            // Section 3
            _buildSectionHeader('3. INTERACTION'),

            // GestureDetector Example
            _buildExampleTitle('GestureDetector - Detect touches'),
            GestureDetector(
              onTap: () {
                print('Tapped! from GestureDetector');
              },
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.blue.shade100,
                child: Text('Tap me! (check console)'),
              ),
            ),

            SizedBox(height: 20),

            // InkWell Example
            _buildExampleTitle('InkWell - Touch with ripple'),
            InkWell(
              onTap: () {
                print('InkWell tapped!');
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Tap to see ripple effect!'),
              ),
            ),

            SizedBox(height: 30),

            // Section 4
            _buildSectionHeader('4. SCROLLING & CONSTRAINTS'),

            // ConstrainedBox Example
            _buildExampleTitle('ConstrainedBox - Size limits'),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 200,
                minHeight: 100,
              ),
              child: Container(
                color: Colors.deepOrange.shade100,
                child: Center(
                  child: Text('Max width: 200px\nMin height: 60px'),
                ),
              ),
            ),

            SizedBox(height: 20),

            // FittedBox Example
            _buildExampleTitle('FittedBox - Scale to fit'),
            Container(
              width: 150,
              height: 50,
              color: Colors.yellow.shade100,
              child: FittedBox(
                child: Text(
                  'This text scales to fit!',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),

            SizedBox(height: 30),

            // Final note
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '💡 Tip: Try combining these widgets! For example:\nContainer + Padding + GestureDetector = Styled, tappable button',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue.shade700,
        ),
      ),
    );
  }

  Widget _buildExampleTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8, top: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }

  Widget _buildColorBox(String text, Color color) {
    return Container(
      width: 70,
      height: 70,
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}