import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/domain/entities/task.dart';
import 'package:task_tracker/ui/providers/task_provider.dart';

class MyTask extends StatelessWidget {
  final TaskModel task;

  const MyTask({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.read<TaskProvider>();
    final assets = ['assets/books.jpg', 'assets/embed.jpg'];
    final finalAsset = assets[Random().nextInt(assets.length)];

    return Card(
      child: Column(
        children: [
          ListTile(
            leading: _ButtonWithDialog(taskProvider: taskProvider, task: task),
            title: Text(task.name),
            subtitle: Text(
              (task.description?.isEmpty ?? true)
                  ? 'Sin descripción'
                  : task.description!,
            ),
            trailing: Image(image: AssetImage(finalAsset)),
          ),
        ],
      ),
    );
  }
}

class _ButtonWithDialog extends StatelessWidget {
  final TaskProvider taskProvider;
  final TaskModel task;

  const _ButtonWithDialog({required this.taskProvider, required this.task});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext dialogContext) => AlertDialog(
          title: const Text('Eliminar tarea'),
          content: const Text('¿Estás seguro?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                taskProvider.removeTask(task.id!);
                Navigator.pop(dialogContext);
              },
              child: const Text('Sí'),
            ),
          ],
        ),
      ),
      child: Text('Borrar tarea'),
    );
  }
}
