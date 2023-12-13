part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class InitiateGetChatsEvent extends ChatEvent {
  final String userId;
  const InitiateGetChatsEvent({required this.userId});
}

class InitiateGetChatEvent extends ChatEvent {
  final String chatId;
  const InitiateGetChatEvent({required this.chatId});
}
