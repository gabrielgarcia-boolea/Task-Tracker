import 'package:flutter/material.dart';
import 'package:task_tracker/domain/entities/task.dart';

class MyTask extends StatelessWidget {
  final TaskModel task;

  const MyTask({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(task.name, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(
          (task.description?.isEmpty ?? true)
              ? 'Sin descripción'
              : task.description!,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
