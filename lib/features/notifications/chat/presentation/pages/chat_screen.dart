import 'package:flutter/material.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/chat_appbar.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/message_input_field.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/message_left.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/message_right.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/messages_list.dart';

class ChatScreen extends StatefulWidget {
  static const id = "chat_screen";
  final String name;
  final String position;

  const ChatScreen({Key? key, required this.name, required this.position})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();
  final List messages = [
    MessageLeft(message: 'Message 1'),
    MessageRight(message: 'Message 2')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppbar(
        name: widget.name,
        position: widget.position,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true, // Показувати нові повідомлення вгорі
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: messages[index]);
                },
              ),
            ),
            SizedBox(
              height: 100,
              child: MessageInputField(
                controller: messageController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
