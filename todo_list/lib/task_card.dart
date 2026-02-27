import 'package:flutter/material.dart';
import 'task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final Function(bool?) onChanged;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const TaskCard({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onDelete,
    required this.onEdit,
  });

  Color priorityColor() {
    switch (task.priority) {
      case Priority.high:
        return Colors.red;
      case Priority.medium:
        return Colors.orange;
      case Priority.low:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Checkbox(
          value: task.isDone,
          onChanged: onChanged,
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration:
                task.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (task.description.isNotEmpty)
              Text(task.description),
            const SizedBox(height: 4),
            Text(
              task.priority.name.toUpperCase(),
              style: TextStyle(color: priorityColor()),
            ),
          ],
        ),
        trailing: Wrap(
          children: [
            IconButton(icon: const Icon(Icons.edit), onPressed: onEdit),
            IconButton(icon: const Icon(Icons.delete), onPressed: onDelete),
          ],
        ),
      ),
    );
  }
}