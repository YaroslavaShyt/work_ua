import 'package:flutter/material.dart';
import 'package:work_ua/core/data/api_datasource.dart';
import 'package:work_ua/core/widgets/colors.dart';
import 'package:work_ua/core/services/shared_preferences/shared_pref_user.dart';
import 'package:work_ua/features/candidate/notifications/chat/domain/chat_model.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/pages/chat_screen.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/widgets/chat_list_element.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatList extends StatefulWidget {
  final List<ChatModel> chats;
  const ChatList({super.key, required this.chats});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  IO.Socket? socket;
  List<String> hasMessages = [];
  String id = '';
  bool enteredChat = false;
  @override
  void initState() {
    connect();
    super.initState();
  }

  void joinChat() {
    // var chatNotifier = Provider.of<ChatNotifier>(context, listen: true);
    print("JOINING ID: $id");
    socket!.emit('join chat', id);
  }

  void connect() async {
    //var chatNotifier = Provider.of<ChatNotifier>(context, listen: true);
    socket = IO.io(APIDatasource.url, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'timeout': 5000
    });
    // діставати юзерайді з шеред преференсес
    id = await getUserFieldNamed('id');
    //print("GOTTEN FROM SHARED PREF: $id");
    socket!.connect();

    socket!.onConnect((_) {
      print("Connected to frontend in chats");
      socket!.on('message received over chat', (newMessageReceived) {
        //print(
        //'\n\nmessage received on frontend in chats page:\n\n$newMessageReceived');
        if (!enteredChat) {
          hasMessages.add(newMessageReceived);
          //if (this.mounted) {
          setState(() {});
        }

        // }
      });

      socket!.onConnectError((error) {
        print("Connection error: $error");
      });

      socket!.onConnectTimeout((data) {
        print("Connection timeout: $data");
      });
    });
    joinChat();
  }

  bool containsElement<T>(List<String> list, String targetElement) {
    for (var i = 0; i < list.length; i++) {
      if (list[i] == targetElement) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.chats.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          setState(() {
            hasMessages.clear();
            enteredChat = true;
          });
          Navigator.of(context)
              .pushNamed(ChatScreen.id, arguments: widget.chats[index].id);
        },
        child: Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: lightGrayColor)),
          child: ChatListElement(
            messagesQuantity: hasMessages.length,
            name: widget.chats[index].user[0]["name"] ?? '<no name>',
            companyName: widget.chats[index].companyName,
            position: widget.chats[index].position,
            hasMessage: containsElement(hasMessages, widget.chats[index].id),
          ),
        ),
      ),
    );
  }
}
