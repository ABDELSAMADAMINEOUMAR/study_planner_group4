import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
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
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> goals = [
    {'subject': 'Mathematics', 'hours': 10, 'done': false},
    {'subject': 'Physics', 'hours': 8, 'done': false},
    {'subject': 'Dart & Flutter', 'hours': 12, 'done': true},
    {'subject': 'Coding', 'hours': 8, 'done': false},

  ];

  int get totalHours {
    return goals.fold(0, (sum, goal) => sum + (goal['hours'] as int));
  }
  int get completedCount {
    return goals.where((goal) => goal['done'] == true).length;
  }
  int get remainingCount {
    return goals.where((goal) => goal['done'] == false).length;
  }
  void toggleDone(int index) {
    setState(() {
      goals[index]['done'] = !goals[index]['done'];
    });
  }
  void deleteGoal(int index) {
    setState(() {
      goals.removeAt(index);
    });
  }
  void addSampleGoal() {
    setState(() {
      goals.add({'subject': 'Sample goal', 'hours': 2, 'done': false});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Study Planner')),

      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: StatCard(title: 'Total hours', value: '$totalHours')),
              Expanded(child: StatCard(title: 'Completed', value: '$completedCount')),
              Expanded(child: StatCard(title: 'Remaining', value: '$remainingCount')),
            ],
          ),

          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'My Goals',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          // LOGIC: empty message or the list
          Expanded(
            child: goals.isEmpty
                ? const Center(child: Text('No goals yet. Tap + to add one.'))
                : ListView.builder(
                    itemCount: goals.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> goal = goals[index];
                      bool isDone = goal['done'];

                      return Card(
                        child: ListTile(
                          onTap: () => toggleDone(index),
                          leading: Checkbox(
                            value: isDone,
                            onChanged: (value) => toggleDone(index),
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
                            onPressed: () => deleteGoal(index),
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

class StatCard extends StatelessWidget {
  const StatCard({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(title),
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}