import 'package:flutter/material.dart';
import 'package:gml_app/models/goal_model.dart';

class GoalsProvider extends ChangeNotifier {
  List<Goal> _goallist = [
    Goal(title: 'Goal 1', points: 150),
    Goal(title: 'Goal 2', points: 500),
    Goal(title: 'Goal 3', points: 100),
  ];
  List<Goal> get goallist => _goallist;
  
  void addGoal(String title, int points) {
    Goal newGoal = Goal(title: title, points: points);
    _goallist.add(newGoal);
    notifyListeners();
  }

  void deleteGoal(int goalId) {
    _goallist.removeAt(goalId);
    notifyListeners();
  }
}