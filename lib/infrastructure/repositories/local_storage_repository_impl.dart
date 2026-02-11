import 'package:task_tracker/domain/datasources/local_storage_datasource.dart';
import 'package:task_tracker/domain/entities/task.dart';
import 'package:task_tracker/domain/repositories/LocalStorageRepository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);

  @override
  Future<void> addTask(TaskModel task) {
    return datasource.addTask(task);
  }

  @override
  Future<List<TaskModel>> loadTasks() {
    return datasource.loadTasks();
  }

  @override
  Future<void> deleteTask(int id) {
    return datasource.deleteTask(id);
  }
}
