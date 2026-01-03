import 'package:flutter/material.dart';

class LightSwitch extends StatefulWidget {
  const LightSwitch({super.key});

  @override
  _LightSwitchState createState() => _LightSwitchState();
}

class _LightSwitchState extends State<LightSwitch> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isOn ? Colors.yellow : Colors.black,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              isOn = !isOn;
            });
          },
          child: Text(isOn ? "Turn OFF" : "Turn ON"),
        ),
      ),
    );
  }
}
