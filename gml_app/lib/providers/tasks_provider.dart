import 'package:flutter/material.dart';
import 'package:gml_app/models/task_model.dart';

class TasksProvider extends ChangeNotifier {
  List<Task> _tasklist = [];
  List<Task> get tasklist => _tasklist;
  
  void addTask(String title) {
    Task newTask = Task(title);
    _tasklist.add(newTask);
    notifyListeners();
  }

  void deleteTask(int taskId) {
    _tasklist.removeAt(taskId);
    notifyListeners();
  }
}