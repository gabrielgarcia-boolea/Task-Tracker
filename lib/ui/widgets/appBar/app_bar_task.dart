import 'package:flutter/material.dart';

class AppBarTask extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarTask({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
