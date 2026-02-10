import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/ui/presentation/add_task_screen.dart';
import 'package:task_tracker/ui/providers/task_provider.dart';
import 'package:task_tracker/ui/widgets/appBar/app_bar_task.dart';
import 'package:task_tracker/ui/widgets/tasklist/task_container.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTask(title: 'Tasks list'),
      body: _TaskList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
        },
        backgroundColor: Colors.grey,
        child: const Icon(Icons.add),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: taskProvider.taskListScrollController,
                itemCount: taskProvider.tasksList.length,
                itemBuilder: (context, index) {
                  final task = taskProvider.tasksList[index];
                  return MyTask(task: task);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
