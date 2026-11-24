import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

// STATIC: root of the app. MaterialApp sets up the theme and navigation.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

// STATIC: the main screen. Scaffold gives us the AppBar, body and button slots.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // STATIC: app title in the top bar
      appBar: AppBar(
        title: const Text('My Study Planner'),
      ),

      body: Column(
        children: [
          // STATIC: heading above the list
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'My Goals',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          // STATIC: goal card 1
          const Card(
            child: ListTile(
              leading: Icon(Icons.book),
              title: Text('Mathematics'),
              subtitle: Text('10 hours'),
            ),
          ),

          // STATIC: goal card 2
          const Card(
            child: ListTile(
              leading: Icon(Icons.science),
              title: Text('Physics'),
              subtitle: Text('8 hours'),
            ),
          ),

          // STATIC: goal card 3
          const Card(
            child: ListTile(
              leading: Icon(Icons.code),
              title: Text('Dart & Flutter'),
              subtitle: Text('12 hours'),
            ),
          ),
        ],
      ),

      // STATIC: button that does nothing yet (we wire it up in Phase 4)
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add)
      ),
    );
  }
}
