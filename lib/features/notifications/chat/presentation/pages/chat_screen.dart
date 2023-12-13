import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:work_ua/core/api_datasource.dart';
import 'package:work_ua/core/services/shared_pref_user.dart';
import 'package:work_ua/features/authorization/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:work_ua/features/notifications/chat/domain/message_model.dart';
import 'package:work_ua/features/notifications/chat/domain/send_message_model.dart';
import 'package:work_ua/features/notifications/chat/presentation/bloc/message_bloc/message_bloc.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/chat_appbar.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/message_input_field.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/message_left.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/message_right.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:work_ua/features/notifications/chat/presentation/provider/chat_notifier.dart';

class ChatScreen extends StatefulWidget {
  static const id = "chat_screen";
  final String chatId;
  const ChatScreen({Key? key, required this.chatId}) : super(key: key);

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
  List<MessageModel> userMessages = [];
  int offset = 1;

  @override
  void initState() {
    context
        .read<MessageBloc>()
        .add(InitiateGetMessages(chatId: widget.chatId, offset: offset));
    connect();
    joinChat();
    handleNext();
    super.initState();
  }

  final ScrollController scrollController = ScrollController();

  void handleNext() {
    scrollController.addListener(() async {
      if (scrollController.hasClients) {
        if (scrollController.position.maxScrollExtent ==
            scrollController.position.pixels) {
          print('<<<<LOADING>>>>');

          if (messages.length > 12) {
            context.read<MessageBloc>().add(
                InitiateGetMessages(chatId: widget.chatId, offset: offset++));
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

  void sendMessage(String content, String chatId, String receiver) {
    SendMessageModel model =
        SendMessageModel(content: content, chatId: chatId, receiver: receiver);
    context.read<MessageBloc>().add(InitiateSendMessage(message: model));
    var state = context.read<MessageBloc>().state;
    if (state is SendMessageSuccess) {
      socket!.emit("new message", state.model);
      sendStopTypingEvent(widget.chatId);
      setState(() {
        messageController.clear();
        userMessages.insert(0, state.model);
      });
    }
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
          //chatNotifier.online.replaceRange(0, chatNotifier.online.length, [id]);
        });

        socket!.on('typing', (status) {
          //chatNotifier.typing = true;
        });

        socket!.on('stop typing', (status) {
          //chatNotifier.typing = false;
        });

        socket!.on('message received', (newMessageReceived) {
          sendStopTypingEvent(widget.chatId);
          MessageModel message = MessageModel.fromJson(newMessageReceived);
          if (message.sender.id != id) {
            setState(() {
              userMessages.insert(0, message);
            });
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatAppbar(
        name: 'test name',
        position: 'test position',
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: BlocBuilder<MessageBloc, MessageState>(
          builder: (context, state) {
            if (state is GetMessagesSuccess) {
              return Column(children: [
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    reverse: true,
                    itemCount: state.messages.length,
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
                        context.read<MessageBloc>().add(InitiateSendMessage(
                            message: SendMessageModel(
                                content: controller.text,
                                chatId: widget.chatId,
                                receiver: state.messages[0].receiver)));
                      });
                    },
                  ),
                ),
              ]);
            }
            if (state is GetMessagesFailure) {
              return Center(child: Text(state.model.message));
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
