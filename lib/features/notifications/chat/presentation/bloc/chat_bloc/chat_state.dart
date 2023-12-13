part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

final class GetChatsSuccess extends ChatState {
  final List<ChatModel> chats;
  const GetChatsSuccess({required this.chats});
}

final class GetChatsFailure extends ChatState {
  final SuccessModel model;
  const GetChatsFailure({required this.model});
}

final class GetChatSuccess extends ChatState {
  final ChatModel chat;
  const GetChatSuccess({required this.chat});
}

final class GetChatFailure extends ChatState {
  final SuccessModel model;
  const GetChatFailure({required this.model});
}
