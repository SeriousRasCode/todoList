import 'package:flutter/material.dart';
import 'task.dart';
import 'task_card.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.nightlight_round),
            onPressed: () => MyApp.of(context).toggleTheme(),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: const [
                Text(
                  'Today',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              readOnly: true,
              onTap: () async {
                final result =
                    await Navigator.pushNamed(context, '/add');
                if (result != null) {
                  setState(() {
                    tasks.add(result as Task);
                  });
                }
              },
              decoration: InputDecoration(
                filled: true,
                hintText: 'Add a new task',
                prefixIcon: const Icon(Icons.add),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  task: tasks[index],
                  onChanged: (v) {
                    setState(() {
                      tasks[index].isDone = v!;
                    });
                  },
                  onDelete: () {
                    setState(() {
                      tasks.removeAt(index);
                    });
                  },
                  onEdit: () async {
                    await Navigator.pushNamed(
                      context,
                      '/edit',
                      arguments: tasks[index],
                    );
                    setState(() {});
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}