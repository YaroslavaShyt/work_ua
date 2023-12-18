import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';

class ChatAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String position;
  final bool isTyping;
  final bool isOnline;
  const ChatAppbar(
      {super.key,
      required this.name,
      required this.position,
      required this.isOnline,
      required this.isTyping});

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
                position,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 13.0, color: darkGrayColor),
              ),
              Text(
                isTyping ? 'Пише' : '',
                style: const TextStyle(fontSize: 13.0, color: darkGrayColor),
              )
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Icon(Icons.person, color: isOnline ? greenColor : blackColor,),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
