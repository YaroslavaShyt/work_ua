import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/colors.dart';

class BlueAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isBackButton;
  final String title;

  const BlueAppBar({super.key, required this.title, this.isBackButton = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isBackButton
          ? IconButton(
              color: whiteColor,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: whiteColor,
              ))
          : null,
      title: Text(
        title,
        style: const TextStyle(color: whiteColor),
      ),
      backgroundColor: blueColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
