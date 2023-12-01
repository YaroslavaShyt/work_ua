import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';

class ChatAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String position;
  const ChatAppbar({super.key, required this.name, required this.position});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0, top: 10.0),
          child: Column(
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                position,
                style: const TextStyle(fontSize: 13.0, color: darkGrayColor),
              )
            ],
          ),
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Icon(Icons.person),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
