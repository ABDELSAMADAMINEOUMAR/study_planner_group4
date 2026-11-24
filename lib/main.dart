import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// STATIC
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

// STATIC
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // LOGIC
  // CONNECTION 1: will be loaded from the database in Phase 5
  List<Map<String, dynamic>> goals = [
    {'subject': 'Mathematics', 'hours': 10, 'done': false},
    {'subject': 'Physics', 'hours': 8, 'done': false},
    {'subject': 'Dart & Flutter', 'hours': 12, 'done': true},
  ];

  // LOGIC
  // CONNECTION 2: will also update the database in Phase 5
  void toggleDone(int index) {
    setState(() {
      bool current = goals[index]['done'];
      goals[index]['done'] = !current;
    });
  }

  // LOGIC
  void deleteGoal(int index) {
    setState(() {
      goals.removeAt(index);
    });
  }

  // LOGIC
  void addSampleGoal() {
    setState(() {
      int number = goals.length + 1;
      goals.add({
        'subject': 'Sample goal $number',
        'hours': 2,
        'done': false,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // STATIC
      appBar: AppBar(
        title: const Text('My Study Planner'),
      ),

      // STATIC
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'My Goals',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          // Expanded makes the list fill the space under the heading
          Expanded(
            child: ListView.builder(
              itemCount: goals.length,
              itemBuilder: (context, index) {
                // LOGIC
                Map<String, dynamic> goal = goals[index];
                bool isDone = goal['done'];

                return Card(
                  child: ListTile(
                    onTap: () {
                      toggleDone(index);
                    },
                    leading: Checkbox(
                      value: isDone,
                      onChanged: (value) {
                        toggleDone(index);
                      },
                    ),
                    title: Text(
                      goal['subject'],
                      style: TextStyle(
                        decoration: isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    subtitle: Text('${goal['hours']} hours'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        deleteGoal(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // STATIC
      floatingActionButton: FloatingActionButton(
        onPressed: addSampleGoal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
