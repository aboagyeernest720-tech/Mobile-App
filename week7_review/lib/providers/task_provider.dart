import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  // 1. Internal list of tasks
  final List<Task> _tasks = [
    Task(title: "Complete Flutter Midsem"), // Default starting task
  ];

  // 2. Getter to access tasks from UI
  List<Task> get tasks => _tasks;

  // 3. Logic to add a task
  void addTask(String title) {
    if (title.isNotEmpty) {
      _tasks.add(Task(title: title));
      notifyListeners(); // This tells the UI to rebuild!
    }
  }

  // 4. Logic to mark task as done/undone
  void toggleTaskStatus(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }

  // 5. Logic to delete a task
  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}