import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
//Tables
import 'package:gml_app/data/tables/taskitems_table.dart';
import 'package:gml_app/data/tables/goalitems_table.dart';
import 'package:gml_app/data/tables/userpoints_table.dart';

part 'database.g.dart';


@DriftDatabase(tables: [TaskItems, GoalItems, UserPoints])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //TaskItems Db Helpers
  Future<List<TaskItem>> getTasks() async {
    return await select(taskItems).get();
  }

  Stream<List<TaskItem>> getTasksStream() {
    return select(taskItems).watch();
  }

  Future<TaskItem> getTaskItem(int id) async { 
    return await (select(taskItems)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<bool> updateTask(TaskItemsCompanion entity) async {
  return await update(taskItems).replace(entity);
  }

  Future<int> addTask(TaskItemsCompanion entry) async {
  return await into(taskItems).insert(entry);
  }
  
  Future<int> deleteTask(int id) async {
  return await (delete(taskItems)..where((tbl) => tbl.id.equals(id))).go();
  }

  // GoalItems Db Helpers
  Future<List<GoalItem>> getGoals() async {
    return await select(goalItems).get();
  }

  Stream<List<GoalItem>> getGoalsStream() {
    return select(goalItems).watch();
  }

  Future<GoalItem> getGoalItem(int id) async {
    return await (select(goalItems)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<bool> updateGoal(GoalItemsCompanion entity) async {
  return await update(goalItems).replace(entity);
  }

  Future<int> addGoal(GoalItemsCompanion entry) async {
  return await into(goalItems).insert(entry);
  }
  
  Future<int> deleteGoal(int id) async {
  return await (delete(goalItems)..where((tbl) => tbl.id.equals(id))).go();
  }
  
  //UserPoints Db Helpers
  Future<List<UserPoint>> getUserPoints() async {
    return await select(userPoints).get();
  }

  Stream<List<UserPoint>> getUserPointsStream() {
    return select(userPoints).watch();
  }

  Future<int> addPointsEntry(UserPointsCompanion entry) async {
  return await into(userPoints).insert(entry);
  }

  Future<UserPoint> getPoints(int id) async { 
    return await (select(userPoints)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<bool> updatePointsEntry(UserPointsCompanion entry) async {
    // Update the row at position 1 with the provided entity
    final updatedRows = await (update(userPoints)
          ..where((tbl) => tbl.id.equals(1))) // Specify the condition for row 1 here
        .write(entry);

    return updatedRows > 0; // Return true if at least one row was updated, otherwise false
  }

  Future<bool> doesRowExist(int key) async {
    final result = await customSelect('SELECT COUNT(*) FROM user_points WHERE id = ?', 
      variables: [Variable.withInt(key)]).getSingle();
    final count = result.data.values.first as int; // Retrieve the count value
    return count > 0; // Return true if row with key exists, otherwise false
  }

}


LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}