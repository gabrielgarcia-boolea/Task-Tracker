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
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Image(image: AssetImage('assets/books.jpg')),
            title: Text(
              task.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              (task.description?.isEmpty ?? true)
                  ? 'Sin descripción'
                  : task.description!,
            ),
            trailing: _ButtonWithDialog(taskProvider: taskProvider, task: task),
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
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      child: Text('Borrar tarea'),
    );
  }
}
