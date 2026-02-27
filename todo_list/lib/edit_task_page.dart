import 'package:flutter/material.dart';
import 'task.dart';

class EditTaskPage extends StatefulWidget {
  final Task task;
  const EditTaskPage({super.key, required this.task});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  late TextEditingController controller;
  late Priority priority;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.task.title);
    priority = widget.task.priority;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Task')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Task title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButton<Priority>(
              value: priority,
              isExpanded: true,
              items: Priority.values.map((p) {
                return DropdownMenuItem(
                  value: p,
                  child: Text(p.name.toUpperCase()),
                );
              }).toList(),
              onChanged: (v) {
                setState(() {
                  priority = v!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.task.title = controller.text;
                widget.task.priority = priority;
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}