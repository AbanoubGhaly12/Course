import 'package:flutter/material.dart';

class ScrollDemo extends StatelessWidget {
  const ScrollDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scroll Demo')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
            subtitle:  Text('Subtitle for item $index'),
            leading: Icon(Icons.access_alarm),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
          );
        },
        itemCount: 100,
      ),
    );
  }
}

// SingleChildScrollView
// ListView
// ListView.builder
// ListView.separated
