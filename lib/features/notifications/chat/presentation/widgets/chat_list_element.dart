import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';

class ChatListElement extends StatelessWidget {
  final String name;
  final String position;
  final String companyName;
  final int messagesQuantity;
  const ChatListElement(
      {super.key,
      required this.name,
      required this.companyName,
      required this.position,
      this.messagesQuantity = 2});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: dirtyWhiteColor,
      leading: const Icon(Icons.person),
      title: Text(name),
      subtitle: Text(position),
      trailing: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(shape: BoxShape.circle, color: redColor),
        child: Text(
          "$messagesQuantity",
          style: TextStyle(color: whiteColor, fontSize: 15),
        ),
      ),
    );
  }
}
