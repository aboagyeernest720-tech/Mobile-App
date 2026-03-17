class Task {
  final String title;
  final String courseCode; // This fixes the 'courseCode' error
  final DateTime dueDate;  // This fixes the 'dueDate' error
  bool isComplete;         // This fixes the 'isComplete' error

  Task({
    required this.title,
    required this.courseCode,
    required this.dueDate,
    this.isComplete = false, // Defaults to false
  });
}