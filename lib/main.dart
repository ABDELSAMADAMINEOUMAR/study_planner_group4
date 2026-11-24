import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

// root of the app
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

// the main screen and thenScaffold gives us the AppBar body and then  button
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app title in the top bar
      appBar: AppBar(
        title: const Text('My Study Planner'),
      ),

      body: Column(
        children: [
          //heading above the list: after the list it makes a heading
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'My Goals',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          // card 1: in that contained goals details
          const Card(
            child: ListTile(
              leading: Icon(Icons.book),
              title: Text('Mathematics'),
              subtitle: Text('10 hours'),
            ),
          ),

          // card 2: same as the first card
          const Card(
            child: ListTile(
              leading: Icon(Icons.science),
              title: Text('Physics'),
              subtitle: Text('8 hours'),
            ),
          ),

          // card 3: same as all the previous cards
          const Card(
            child: ListTile(
              leading: Icon(Icons.code),
              title: Text('Dart & Flutter'),
              subtitle: Text('12 hours'),
            ),
          ),
        ],
      ),

      // button that does nothing yet
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add)
      ),
    );
  }
}
