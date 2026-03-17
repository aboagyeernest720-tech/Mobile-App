import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  List<String> _tasks = ["Task 1", "Task 2", "Task 3"];
  bool _isLoading = false;

  List<String> get tasks => _tasks;
  bool get isLoading => _isLoading;

  void addTask(String title) {
    _tasks.add(title);
    notifyListeners();
  }

  Future<void> fetchTasksFromApi() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    _tasks = ["API Task A", "API Task B", "API Task C"];
    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteOptimistically(int index) async {
    final removedItem = _tasks[index];
    _tasks.removeAt(index);
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));
      // Random fail simulation
      if (DateTime.now().second % 2 == 0) {
        throw Exception("Server Error");
      }
    } catch (e) {
      _tasks.insert(index, removedItem);
      notifyListeners();
    }
  }
} // <--- Make sure this is the ONLY brace at the very bottom