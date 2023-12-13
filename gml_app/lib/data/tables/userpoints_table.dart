import 'package:drift/drift.dart';

class UserPoints extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get points => integer()();
}