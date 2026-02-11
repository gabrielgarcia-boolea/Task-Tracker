import 'package:flutter/material.dart';

class AppBarTask extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarTask({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [Switch(value: false, onChanged: null)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
