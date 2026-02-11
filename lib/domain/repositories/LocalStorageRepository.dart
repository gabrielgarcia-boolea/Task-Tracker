import 'package:task_tracker/domain/entities/task.dart';

abstract class LocalStorageRepository {
  Future<List<TaskModel>> loadTasks();

  Future<void> addTask(TaskModel task);

  Future<void> deleteTask(int id);
}
