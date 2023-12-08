import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:work_ua/core/api_datasource.dart';
import 'package:work_ua/core/services/shared_pref_user.dart';
import 'package:work_ua/features/authorization/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/chat_appbar.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/message_input_field.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/message_left.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/message_right.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:work_ua/features/notifications/chat/presentation/provider/chat_notifier.dart';

class ChatScreen extends StatefulWidget {
  static const id = "chat_screen";
  final String name;
  final String position;
  // add chat id
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

  @override
  void initState() {
    connect();
    super.initState();
  }

  void sendTypingEvent(String status){
    socket!.emit('typing', status);

  }

  void joinChat(){
    socket!.emit('join chat',); // add chat id
  }


  void connect() async {
    var chatNotifier = Provider.of<ChatNotifier>(context, listen: true);
    socket = IO.io(APIDatasource.url, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    // діставати юзерайді з шеред преференсес
    var id = await getUserFieldNamed('id');
    if (id.isNotEmpty) {
      socket!.emit("setup", id);
      socket!.connect();
      socket!.onConnect((_) {
        print("Connected to frontend");
        socket!.on('online-users', (id) {});
        socket!.on('typing', (status) {
          chatNotifier.online.replaceRange(0, chatNotifier.online.length, [id]);
        });

        socket!.on('typing', (status) {
          chatNotifier.typing = true;
        });

        socket!.on('stop typing', (status) {
          chatNotifier.typing = false;
        });

        socket!.on('message received', (newMessageReceived){

        });
      });
    }
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
