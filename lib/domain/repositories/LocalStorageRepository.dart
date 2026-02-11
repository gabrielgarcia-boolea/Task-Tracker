import 'package:task_tracker/domain/entities/task.dart';

abstract class LocalStorageRepository {
  Future<List<TaskModel>> getTasks();

  Future<void> addTask(TaskModel task);

  Future<void> removeTask(int id);
}
