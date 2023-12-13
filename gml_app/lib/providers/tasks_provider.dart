import 'package:flutter/material.dart';
import 'package:gml_app/data/database.dart';
import "package:drift/drift.dart" as drift;

class TasksProvider extends ChangeNotifier {

  AppDatabase? _appDb;

  void initAppDb(AppDatabase db) {
    _appDb = db;
  }

  List<TaskItem> _taskListStream = [];
  List<TaskItem> get taskListStream => _taskListStream;

//Needs the be removed vvv
  // List<Task> _tasklist = [
  //   Task(title: 'Task 1', points: 10),
  //   Task(title: 'Task 2', points: 5),
  //   Task(title: 'Task 3', points: 100),
  // ];
  // List<Task> get tasklist => _tasklist;
//Needs the be removed ^^^
  
  void getTasksStream() {
    _appDb?.getTasksStream()
      .listen((event) {
        _taskListStream = event;
        notifyListeners();
      }); 
  }

  void addTask(String title, int points) {
    final newTask = TaskItemsCompanion(
      title: drift.Value(title),
      points: drift.Value(points),
    );
    _appDb?.addTask(newTask);
  }

  void deleteTask(int taskId) {
      _appDb?.deleteTask(taskId);
  }
}