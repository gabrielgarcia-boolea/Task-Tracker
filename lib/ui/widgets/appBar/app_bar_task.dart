import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/ui/providers/theme_provider.dart';

class AppBarTask extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarTask({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();

    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        Switch(
          value: themeProvider.isDarkMode,
          onChanged: (_) => themeProvider.changeTheme(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
