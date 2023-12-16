import 'package:flutter/material.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/widgets/message_left.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/widgets/message_right.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: MessageLeft(
            message: 'This is a stupid message',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: MessageRight(
            message: 'This is another message',
          ),
        )
      ],
    );
  }
}
