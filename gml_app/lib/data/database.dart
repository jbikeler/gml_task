import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
//Tables
import 'package:gml_app/data/tables/taskitems_table.dart';

part 'database.g.dart';


@DriftDatabase(tables: [TaskItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

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
  
}


LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}