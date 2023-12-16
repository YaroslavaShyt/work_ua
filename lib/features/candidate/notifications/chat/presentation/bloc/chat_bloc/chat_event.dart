part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class InitiateGetChatsEvent extends ChatEvent {
  //final String userId;
  const InitiateGetChatsEvent();
}

class InitiateGetChatEvent extends ChatEvent {
  final String chatId;
  const InitiateGetChatEvent({required this.chatId});
}

class InitiateCreateChatEvent extends ChatEvent {
  final ChatModel model;
  const InitiateCreateChatEvent({required this.model});
}


