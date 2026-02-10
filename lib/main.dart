import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/ui/presentation/task_list_screen.dart';
import 'package:task_tracker/ui/providers/task_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TaskProvider())],
      child: MaterialApp(
        title: 'Task Tracker',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: TaskListScreen(),
      ),
    );
  }
}
