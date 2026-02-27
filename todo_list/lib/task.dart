enum Priority { high, medium, low }

class Task {
  String title;
  String description;
  bool isDone;
  Priority priority;

  Task({
    required this.title,
    this.description = '',
    this.isDone = false,
    this.priority = Priority.medium,
  });
}