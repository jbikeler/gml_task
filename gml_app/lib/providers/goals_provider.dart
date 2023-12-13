import 'package:flutter/material.dart';
import 'package:gml_app/data/database.dart';
import "package:drift/drift.dart" as drift;

class GoalsProvider extends ChangeNotifier {

  AppDatabase? _appDb;

  void initAppDb(AppDatabase db) {
    _appDb = db;
  }

  List<GoalItem> _goalListStream = [];
  List<GoalItem> get goalListStream => _goalListStream;

//Needs the be removed vvv
  // List<Goal> _goallist = [
  //   Goal(title: 'Goal 1', points: 10),
  //   Goal(title: 'Goal 2', points: 5),
  //   Goal(title: 'Goal 3', points: 100),
  // ];
  // List<Goal> get goallist => _goallist;
//Needs the be removed ^^^
  
  void getGoalsStream() {
    _appDb?.getGoalsStream()
      .listen((event) {
        _goalListStream = event;
        notifyListeners();
      }); 
  }

  void addGoal(String title, int points) {
    final newGoal = GoalItemsCompanion(
      title: drift.Value(title),
      points: drift.Value(points),
    );
    _appDb?.addGoal(newGoal);
    notifyListeners();
  }

  void deleteGoal(int goalId) {
      _appDb?.deleteGoal(goalId);
      notifyListeners();
  }
}