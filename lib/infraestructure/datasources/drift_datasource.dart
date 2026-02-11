import 'package:task_tracker/config/database/database.dart';
import 'package:task_tracker/domain/datasources/local_storage_datasource.dart';
import 'package:task_tracker/domain/entities/task.dart';
import 'package:drift/drift.dart';

class DriftDatasource extends LocalStorageDatasource {
  final AppDatabase database;

  DriftDatasource([AppDatabase? databaseToUse])
    : database = databaseToUse ?? db;

  @override
  Future<void> addTask(TaskModel task) async {
    await database
        .into(database.tasks)
        .insert(
          TasksCompanion.insert(
            title: task.name,
            description: task.description ?? '',
          ),
        );
  }

  @override
  Future<List<TaskModel>> loadTasks() async {
    final query = database.select(database.tasks);

    final taskRows = await query.get();

    final tasks = taskRows
        .map(
          (row) => TaskModel(
            id: row.id,
            name: row.title,
            description: row.description,
          ),
        )
        .toList();

    return tasks;
  }

  @override
  Future<void> deleteTask(int id) async {
    final query = database.delete(database.tasks)
      ..where((table) => table.id.equals(id));

    await query.go();
    return;
  }
}
