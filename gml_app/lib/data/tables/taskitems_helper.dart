//define queries for taskitems table here
import 'package:gml_app/data/database.dart';

Future<int> addTask(TaskItemsCompanion entry) {
  return into(taskItems).insert(entry);
}
