import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/ui/presentation/task_list_screen.dart';
import 'package:task_tracker/ui/providers/task_provider.dart';
import 'package:task_tracker/ui/providers/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      title: 'Task Tracker',
      theme: themeProvider.theme,
      home: TaskListScreen(),
    );
  }
}
