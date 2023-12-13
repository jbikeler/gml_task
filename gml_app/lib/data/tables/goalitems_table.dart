import 'package:drift/drift.dart';

class GoalItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 0, max: 32)();
  IntColumn get points => integer()();
}