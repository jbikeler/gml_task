import 'package:flutter/material.dart';
import 'package:gml_app/data/database.dart';
import "package:drift/drift.dart" as drift;

class UserProvider extends ChangeNotifier {
  // int _points = 0;
  // int get points => _points;


  AppDatabase? _appDb;

  void initAppDb(AppDatabase db) async {
  _appDb = db;
  bool? hasPointsEntry = await _appDb?.doesRowExist(1);
  if (hasPointsEntry != null && !hasPointsEntry) { //if the entry does not exist
    const newEntry = UserPointsCompanion( //make a new entry
        points: drift.Value(0),
      );
    _appDb?.addPointsEntry(newEntry); //add it to the table (should now be entry with key: 1)
  }
  //if the table does have the entry at key:1 then that's the only entry we will need in the
  //and will only edit that entry
}

  int _userPoints = 0;
  int get userPoints => _userPoints;

  void getPointsStream() {
    _appDb?.getUserPointsStream()
      .listen((event) {
         //get the list of entries(which should only be one item at key:1 or in a list, the first item)
         //and set the _userpoints to watch the first entry for changes 
        _userPoints = event[0].points;
        notifyListeners();
      }); 
  }
  
  void addPoints(int amount) async {
    int currentPoints = 0;
    var pointsEntry = await _appDb?.getPoints(1);
    if (pointsEntry != null){
      currentPoints = pointsEntry.points + amount;
    }
    //make a new user UserPointsCompanion and load it with current points + new points
    final newPoints = UserPointsCompanion(
      points: drift.Value(currentPoints)
    );
    //update the UserPoints entry
    _appDb?.updatePointsEntry(newPoints);;
  }

  void removePoints(int amount) async{
    int currentPoints = 0;
    var pointsEntry = await _appDb?.getPoints(1);
    if (pointsEntry != null){
      currentPoints = pointsEntry.points - amount;
    }
    //make a new user UserPointsCompanion and load it with current points - new points
    final newPoints = UserPointsCompanion(
      points: drift.Value(currentPoints)
    );
    //update the UserPoints entry
    _appDb?.updatePointsEntry(newPoints);
  }
}