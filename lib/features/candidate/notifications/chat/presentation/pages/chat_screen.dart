import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:work_ua/core/api_datasource.dart';
import 'package:work_ua/core/services/shared_pref_user.dart';
import 'package:work_ua/features/candidate/notifications/chat/domain/message_model.dart';
import 'package:work_ua/features/candidate/notifications/chat/domain/send_message_model.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/bloc/message_bloc/message_bloc.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/widgets/chat_appbar.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/widgets/message_input_field.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/widgets/message_left.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/widgets/message_right.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  static const id = "chat_screen";
  final String chatId;
  //final JobModel jobModel;
  const ChatScreen({
    Key? key,
    required this.chatId,
    // /required this.jobModel
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  IO.Socket? socket;
  late String userId;
  final TextEditingController messageController = TextEditingController();
  List messages = [];
  List<MessageModel> userMessages = [];
  int offset = 1;
  late String sendTo;
  bool isTyping = false;
  bool personOnline = false;

  @override
  void initState() {
    initUserId();
    context.read<ChatBloc>().add(InitiateGetChatEvent(chatId: widget.chatId));
    context
        .read<MessageBloc>()
        .add(InitiateGetMessages(chatId: widget.chatId, offset: offset));
    connect();
    joinChat();
    handleNext();
    super.initState();
  }

  @override
  void dispose() {
    socket!.close();
    super.dispose();
  }

  void initUserId() async {
    userId = await getUserFieldNamed('id');
    print('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< $userId');
  }

  final ScrollController scrollController = ScrollController();

  void handleNext() {
    scrollController.addListener(() async {
      if (scrollController.hasClients) {
        if (scrollController.position.maxScrollExtent ==
            scrollController.position.pixels) {
          print('<<<<LOADING>>>>');

          if (messages.length > 12) {
            // context.read<MessageBloc>().add(
            //     InitiateGetMessages(chatId: widget.chatId, offset: offset++));
            setState(() {});
          }
        }
      }
    });
  }

  void sendTypingEvent(String status) {
    socket!.emit('typing', status);
  }

  void sendStopTypingEvent(String status) {
    socket!.emit('stop typing', status);
  }

  void joinChat() {
    // var chatNotifier = Provider.of<ChatNotifier>(context, listen: true);
    socket!.emit('join chat', widget.chatId);
  }

  void connect() async {
    //var chatNotifier = Provider.of<ChatNotifier>(context, listen: true);
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
          setState(() {
            isTyping = true;
          });
        });

        socket!.on('stop typing', (status) {
          setState(() {
            isTyping = false;
          });
        });

        socket!.on('message received', (newMessageReceived) {
          //sendStopTypingEvent(widget.chatId);
          print('\n\nmessage received on frontend:\n\n$newMessageReceived');

          messageController.clear();
          if (this.mounted) {
            setState(() {
              messages.add(MessageLeft(message: newMessageReceived, time: DateFormat('hh:mm a').format(DateTime.now())));
            });
          }
        });

        socket!.on("joined chat", (room) {
          setState(() {
            personOnline = true;
          });
        });

        socket!.on("left chat", (room) {
          setState(() {
            personOnline = false;
          });
        });
      });
    }
  }

  void sendMessage(String content, String chatId, String receiver) async {
    SendMessageModel model =
        SendMessageModel(content: content, chatId: chatId, receiver: receiver);

    context.read<MessageBloc>().add(InitiateSendMessage(message: model));

    await Future.delayed(const Duration(seconds: 2));
    var state = context.read<MessageBloc>().state;

    if (state is SendMessageSuccess) {
      print(state.model.toJson());
      var id = await getUserFieldNamed('id');
      socket!.emit(
          "new message",
          MessageModel(
              id: '',
              sender: id,
              content: content,
              receiver: receiver,
              chat: chatId,
              readBy: [],
              v: 1));
      sendStopTypingEvent(widget.chatId);
      print('MESSAGES before add: ${messages[messages.length - 1].message}');

      print('MESSAGES after add: ${messages[messages.length - 1].message}');
      setState(() {
        messages.add(MessageRight(
          message: content,
          time: DateFormat('hh:mm a').format(DateTime.now()),
        ));
      });
      print('MESSAGES after: ${messages[messages.length - 1].message}');
      messageController.clear();
    } else {
      print("error socket send message");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        if (state is GetChatSuccess) {
          sendTo = state.chat.user[1]["_id"];
          return Scaffold(
            appBar: ChatAppbar(
              isTyping: isTyping,
              isOnline: personOnline,
              name: state.chat.position,
              position: state.chat.companyName,
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: BlocBuilder<MessageBloc, MessageState>(
                builder: (context, state) {
                  if (state is GetMessagesSuccess) {
                    messages
                        .clear(); // Clear existing messages before adding new ones
                    for (var i = 0; i < state.messages.length; i++) {
                      if (state.messages[i].receiver == userId) {
                        messages.add(MessageLeft(
                          message: state.messages[i].content,
                          time: 'пізніше',
                        ));
                      } else {
                        messages.add(MessageRight(
                          message: state.messages[i].content,
                          time: 'пізніше',
                        ));
                      }
                    }
                  }
                  if (state is GetMessagesFailure) {
                    return Center(child: Text(state.model.message));
                  }
                  return Column(children: [
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        reverse:
                            true, // Set reverse to true for bottom-to-top scrolling
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          // Ensure the index is within the valid range
                          if (index >= 0 && index < messages.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: messages[messages.length - index - 1],
                            );
                          } //else {
                          //    return Container(); // Return an empty container or handle it as needed
                          //  }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: MessageInputField(
                        chatId: widget.chatId,
                        onComplete: sendStopTypingEvent,
                        onChanged: sendTypingEvent,
                        controller: messageController,
                        function: (messageController) {
                          sendMessage(
                              messageController.text, widget.chatId, sendTo);
                          //  messageController.clear();
                        },
                      ),
                    ),
                  ]);
                },
              ),
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
