import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';

class ChatListElement extends StatelessWidget {
  final String name;
  final String position;
  final String companyName;
  final int messagesQuantity;
  final bool hasMessage;
  const ChatListElement(
      {super.key,
      required this.name,
      required this.companyName,
      required this.position,
      required this.hasMessage,
      this.messagesQuantity = 2});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: dirtyWhiteColor,
      leading: const Icon(Icons.person),
      title: Text(position),
      subtitle: Text(name),
      trailing: hasMessage
          ? Container(
              padding: const EdgeInsets.all(6),
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: redColor),
              child: Text(
                "$messagesQuantity",
                style: const TextStyle(color: whiteColor, fontSize: 15),
              ),
            )
          : null,
    );
  }
}
