enum Priority { high, medium, low }

class Task {
  String title;
  bool isDone;
  Priority priority;

  Task({
    required this.title,
    this.isDone = false,
    this.priority = Priority.medium,
  });
}