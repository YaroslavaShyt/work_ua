import 'package:flutter/material.dart';
import 'package:work_ua/features/notifications/chat/presentation/pages/chat_screen.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/chat_list_element.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(ChatScreen.id),
          child: const ChatListElement(
              name: 'Ярослава',
              companyName: 'Best prog',
              position: 'Flutter developer'),
        ),
        GestureDetector(
          onTap: () {},
          child: const ChatListElement(
              name: 'Ярослава',
              companyName: 'Best prog',
              position: 'Flutter developer'),
        )
      ],
    );
  }
}
