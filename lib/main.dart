import 'package:couse_1/home_screen.dart';
import 'package:couse_1/person.dart';
import 'package:couse_1/session_3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: SingleChildWidgetsDemo(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isDark = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
      isDark = !isDark;
    });
  }
  // isDark ? ThemeData.dark() : ThemeData.light(),
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home:  Scaffold(
        appBar: AppBar(
          backgroundColor:isDark?Colors.black:Colors.amber,
          title: Text("Kareem"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Hello Kareem , press add button :'),
              Text(
                '$_counter',
                style: TextStyle(
                  fontSize: 24
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.ac_unit),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class ExpandableTaskButtons extends StatefulWidget {
//   const ExpandableTaskButtons({Key? key}) : super(key: key);
//
//   @override
//   State<ExpandableTaskButtons> createState() => _ExpandableTaskButtonsState();
// }
//
// class _ExpandableTaskButtonsState extends State<ExpandableTaskButtons>
//     with SingleTickerProviderStateMixin {
//   bool isExpanded = false;
//   late AnimationController _animationController;
//   late Animation<double> _expandAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//     _expandAnimation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   void toggleExpanded() {
//     setState(() {
//       isExpanded = !isExpanded;
//       if (isExpanded) {
//         _animationController.forward();
//       } else {
//         _animationController.reverse();
//       }
//     });
//   }
//
//   void handleSingleTask() {
//     print('Single Task clicked');
//     // Add your navigation or logic here
//     toggleExpanded();
//   }
//
//   void handleTaskList() {
//     print('Task List clicked');
//     // Add your navigation or logic here
//     toggleExpanded();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header with buttons and icons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Left side - Add Tasks button group
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Add Tasks Button
//                       ElevatedButton.icon(
//                         onPressed: toggleExpanded,
//                         icon: const Icon(Icons.add, size: 20),
//                         label: const Text(
//                           'Add Tasks',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.black,
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 20,
//                             vertical: 12,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           elevation: 0,
//                         ),
//                       ),
//
//                       // Expandable buttons underneath
//                       SizeTransition(
//                         sizeFactor: _expandAnimation,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox(height: 8),
//                             // Single Task Button
//                             ElevatedButton(
//                               onPressed: handleSingleTask,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.black,
//                                 foregroundColor: Colors.white,
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 20,
//                                   vertical: 12,
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(25),
//                                 ),
//                                 elevation: 0,
//                               ),
//                               child: const Text(
//                                 'Single Task',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             // Task List Button
//                             ElevatedButton(
//                               onPressed: handleTaskList,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.black,
//                                 foregroundColor: Colors.white,
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 20,
//                                   vertical: 12,
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(25),
//                                 ),
//                                 elevation: 0,
//                               ),
//                               child: const Text(
//                                 'Task List',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   // Right side - Bell and Menu icons
//                   Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           print('Notifications clicked');
//                         },
//                         icon: const Icon(Icons.notifications_outlined),
//                         iconSize: 28,
//                       ),
//                       const SizedBox(width: 8),
//                       IconButton(
//                         onPressed: () {
//                           print('Menu clicked');
//                         },
//                         icon: const Icon(Icons.menu),
//                         iconSize: 28,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 24),
//
//               // Calendar Section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           _buildDateItem('Sun', '11', false),
//                           _buildDateItem('Mon', '12', true),
//                           _buildDateItem('Tue', '13', false),
//                           _buildDateItem('Wed', '14', false),
//                           _buildDateItem('Thu', '15', false),
//                           _buildDateItem('Fri', '...', false),
//                           _buildDateItem('Sat', '16', false),
//                         ],
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.arrow_forward_ios),
//                     iconSize: 20,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDateItem(String day, String date, bool isSelected) {
//     return Container(
//       margin: const EdgeInsets.only(right: 16),
//       child: Column(
//         children: [
//           Text(
//             day,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: isSelected ? Colors.black : Colors.transparent,
//               shape: BoxShape.circle,
//             ),
//             child: Center(
//               child: Text(
//                 date,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: isSelected ? Colors.white : Colors.black,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Usage in main.dart
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Expandable Task Buttons',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         useMaterial3: true,
//       ),
//       home: const ExpandableTaskButtons(),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class ExpandableTaskButtons extends StatefulWidget {
//   const ExpandableTaskButtons({Key? key}) : super(key: key);
//
//   @override
//   State<ExpandableTaskButtons> createState() => _ExpandableTaskButtonsState();
// }
//
// class _ExpandableTaskButtonsState extends State<ExpandableTaskButtons>
//     with SingleTickerProviderStateMixin {
//   bool isExpanded = false;
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 250),
//     );
//     _fadeAnimation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );
//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, -0.2),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeOut,
//     ));
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   void toggleExpanded() {
//     setState(() {
//       isExpanded = !isExpanded;
//       if (isExpanded) {
//         _animationController.forward();
//       } else {
//         _animationController.reverse();
//       }
//     });
//   }
//
//   void handleSingleTask() {
//     print('Single Task clicked');
//     // Add your navigation or logic here
//     toggleExpanded();
//   }
//
//   void handleTaskList() {
//     print('Task List clicked');
//     // Add your navigation or logic here
//     toggleExpanded();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: ElevatedButton.icon(
//           onPressed: toggleExpanded,
//           icon: const Icon(Icons.add, size: 20),
//           label: const Text(
//             'Add Tasks',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.black,
//             foregroundColor: Colors.white,
//             padding: const EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 12,
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(25),
//             ),
//             elevation: 0,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               print('Notifications clicked');
//             },
//             icon: const Icon(Icons.notifications_outlined),
//             iconSize: 28,
//             color: Colors.black,
//           ),
//           IconButton(
//             onPressed: () {
//               print('Menu clicked');
//             },
//             icon: const Icon(Icons.menu),
//             iconSize: 28,
//             color: Colors.black,
//           ),
//           const SizedBox(width: 8),
//         ],
//       ),
//       body: Stack(
//         children: [
//           // Main content
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 16),
//                 // Calendar Section
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             _buildDateItem('Sun', '11', false),
//                             _buildDateItem('Mon', '12', true),
//                             _buildDateItem('Tue', '13', false),
//                             _buildDateItem('Wed', '14', false),
//                             _buildDateItem('Thu', '15', false),
//                             _buildDateItem('Fri', '...', false),
//                             _buildDateItem('Sat', '16', false),
//                           ],
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.arrow_forward_ios),
//                       iconSize: 20,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//
//           // Overlay buttons
//           if (isExpanded)
//             GestureDetector(
//               onTap: toggleExpanded,
//               child: Container(
//                 color: Colors.black.withOpacity(0.3),
//                 width: double.infinity,
//                 height: double.infinity,
//               ),
//             ),
//
//           // Floating buttons
//           Positioned(
//             top: 16,
//             left: 16,
//             child: FadeTransition(
//               opacity: _fadeAnimation,
//               child: SlideTransition(
//                 position: _slideAnimation,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Single Task Button
//                     Material(
//                       elevation: 8,
//                       borderRadius: BorderRadius.circular(25),
//                       child: ElevatedButton(
//                         onPressed: handleSingleTask,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.black,
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 20,
//                             vertical: 12,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           elevation: 0,
//                         ),
//                         child: const Text(
//                           'Single Task',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     // Task List Button
//                     Material(
//                       elevation: 8,
//                       borderRadius: BorderRadius.circular(25),
//                       child: ElevatedButton(
//                         onPressed: handleTaskList,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.black,
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 20,
//                             vertical: 12,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           elevation: 0,
//                         ),
//                         child: const Text(
//                           'Task List',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDateItem(String day, String date, bool isSelected) {
//     return Container(
//       margin: const EdgeInsets.only(right: 16),
//       child: Column(
//         children: [
//           Text(
//             day,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: isSelected ? Colors.black : Colors.transparent,
//               shape: BoxShape.circle,
//             ),
//             child: Center(
//               child: Text(
//                 date,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: isSelected ? Colors.white : Colors.black,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Usage in main.dart
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Expandable Task Buttons',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         useMaterial3: true,
//       ),
//       home: const ExpandableTaskButtons(),
//     );
//   }
// }