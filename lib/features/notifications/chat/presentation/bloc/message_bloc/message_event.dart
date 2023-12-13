part of 'message_bloc.dart';

sealed class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

class InitiateSendMessage extends MessageEvent{
  final SendMessageModel message;
  const InitiateSendMessage({required this.message});
}

class InitiateGetMessages extends MessageEvent {
  final String chatId;
  final int offset;
  const InitiateGetMessages({required this.chatId, required this.offset});
}
