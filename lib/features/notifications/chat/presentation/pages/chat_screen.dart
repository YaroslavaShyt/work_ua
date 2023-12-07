import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/api_datasource.dart';
import 'package:work_ua/core/services/shared_pref_user.dart';
import 'package:work_ua/features/authorization/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/chat_appbar.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/message_input_field.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/message_left.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/message_right.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

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
  IO.Socket? socket;

  final TextEditingController messageController = TextEditingController();
  final List messages = const [
    MessageLeft(message: 'Message 1'),
    MessageRight(message: 'Message 2')
  ];

  void connect() {
    socket = IO.io(APIDatasource.url, <String, dynamic>{
      'transport': ['websocket'],
      'autoConnect': false,
    });
    // діставати юзерайді з шеред преференсес
    //var data = getUserData(model);
    socket!.emit("setup", );
  }

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
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: messages[messages.length - index - 1]);
                },
              ),
            ),
            SizedBox(
              height: 100,
              child: MessageInputField(
                controller: messageController,
                function: (controller) {
                  setState(() {
                    messages.add(MessageRight(message: controller.text));
                    controller.clear();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
