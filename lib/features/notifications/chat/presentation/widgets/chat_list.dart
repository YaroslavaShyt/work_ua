import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/features/notifications/chat/domain/chat_model.dart';
import 'package:work_ua/features/notifications/chat/presentation/bloc/message_bloc/message_bloc.dart';
import 'package:work_ua/features/notifications/chat/presentation/pages/chat_screen.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/chat_list_element.dart';

class ChatList extends StatelessWidget {
  final List<ChatModel> chats;
  const ChatList({super.key, required this.chats});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(ChatScreen.id, arguments: chats[index].id),
        child: ChatListElement(
          name: 'Mary',
          companyName: chats[index].companyName,
          position: chats[index].position,
        ),
      ),
    );
  }
}

/*
children: [
        
        GestureDetector(
          onTap: () {},
          child: const ChatListElement(
              name: 'Ярослава',
              companyName: 'Best prog',
              position: 'Flutter developer'),
        )
      ],
*/ 