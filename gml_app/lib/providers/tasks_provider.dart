import 'package:flutter/material.dart';
import 'package:gml_app/data/database.dart';
import 'package:gml_app/models/task_model.dart';

class TasksProvider extends ChangeNotifier {

  AppDatabase? _appDb;

  void initAppDb(AppDatabase db) {
    _appDb = db;
  }

  List<TaskItem> _taskListStream = [];

  List<Task> _tasklist = [
    Task(title: 'Task 1', points: 10),
    Task(title: 'Task 2', points: 5),
    Task(title: 'Task 3', points: 100),
  ];
  List<Task> get tasklist => _tasklist;
  
  void getTasksStream() {
    _appDb?.getTasksStream()
      .listen((event) {
        _taskListStream = event;
        notifyListeners();
      }); 
  }

  void addTask(String title, int points) {
    Task newTask = Task(title: title, points: points);
    _tasklist.add(newTask);
    notifyListeners();
  }

  void deleteTask(int taskId) {
    _tasklist.removeAt(taskId);
    notifyListeners();
  }
}