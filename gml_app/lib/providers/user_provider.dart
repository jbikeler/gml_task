import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  int _points = 0;
  int get points => _points;
  
  void addPoints(int amount) {
    _points += amount;
    notifyListeners();
  }

  void removePoints(int amount) {
    _points -= amount;
    notifyListeners();
  }
}