import 'package:flutter/material.dart';
import 'package:task_tracker/domain/entities/task.dart';
import 'package:task_tracker/domain/repositories/LocalStorageRepository.dart';
import 'package:task_tracker/infraestructure/datasources/drift_datasource.dart';
import 'package:task_tracker/infraestructure/repositories/local_storage_repository.dart';

class TaskProvider extends ChangeNotifier {
  final taskListScrollController = ScrollController();
  final localStorageRepository = LocalStorageRepositoryImpl(DriftDatasource());

  /* List<TaskModel> tasksList = [
    TaskModel(id: 1, name: 'Curso 1', description: 'Realizar el curso 1'),
    TaskModel(id: 2, name: 'Curso 2'),
  ];*/

  Future<void> addTask(String name, String description) async {
    localStorageRepository.addTask(
      TaskModel(name: name, description: description),
    );
    //tasksList.add(TaskModel(id: id, name: name, description: description));
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> removeTask(int id) async {
    localStorageRepository.deleteTask(id);

    //tasksList.removeWhere((task) => task.id == id);

    notifyListeners();
    moveScrollToBottom();
  }

  Future<List<TaskModel>> getTasks() async {
    return localStorageRepository.loadTasks();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    taskListScrollController.animateTo(
      taskListScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
