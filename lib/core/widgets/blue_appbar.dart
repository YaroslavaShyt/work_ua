import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';

class BlueAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const BlueAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: whiteColor),
      ),
      backgroundColor: blueColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
