part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

final class GetChatsSuccess extends ChatState {
  final List<ChatModel> chats;
  GetChatsSuccess({required this.chats}) {
    print('in get chats>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    print(chats);
  }
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

final class CreateChatSuccess extends ChatState {
  final ChatModel chat;
  const CreateChatSuccess({required this.chat});
}

final class CreateChatFailure extends ChatState {
  final SuccessModel model;
  const CreateChatFailure({required this.model});
}
