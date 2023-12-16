part of 'message_bloc.dart';

sealed class MessageState extends Equatable {
  const MessageState();

  @override
  List<Object> get props => [];
}

final class MessageInitial extends MessageState {}

class SendMessageSuccess extends MessageState {
  final MessageModel model;
  const SendMessageSuccess({required this.model});
}

class SendMessageFailure extends MessageState {
  final String message;
  const SendMessageFailure({required this.message});
}

class GetMessagesSuccess extends MessageState {
  final List<MessageModel> messages;
  const GetMessagesSuccess({required this.messages});
}

class GetMessagesFailure extends MessageState {
  final SuccessModel model;
  const GetMessagesFailure({required this.model});
}
