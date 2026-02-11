import 'package:flutter/material.dart';
import 'package:task_tracker/domain/entities/task.dart';

class TaskProvider extends ChangeNotifier {
  final taskListScrollController = ScrollController();

  List<TaskModel> tasksList = [
    TaskModel(id: 1, name: 'Curso 1', description: 'Realizar el curso 1'),
    TaskModel(id: 2, name: 'Curso 2'),
  ];

  Future<void> addTask(String name, String description) async {
    final id = tasksList.length + 1;
    tasksList.add(TaskModel(id: id, name: name, description: description));
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> removeTask(int id) async {
    tasksList.removeWhere((task) => task.id == id);

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> getTasks() async {
    notifyListeners();
    moveScrollToBottom();
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
