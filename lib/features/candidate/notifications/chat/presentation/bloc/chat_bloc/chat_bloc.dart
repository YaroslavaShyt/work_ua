import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:work_ua/core/success_model.dart';
import 'package:work_ua/features/candidate/notifications/chat/datasource/chat_datasource.dart';
import 'package:work_ua/features/candidate/notifications/chat/domain/chat_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatDatasource datasource = ChatDatasource();
  ChatBloc() : super(ChatInitial()) {
    on<InitiateGetChatsEvent>(_onGetChats);
    on<InitiateCreateChatEvent>(_onCreateChats);
  }

  _onGetChats(event, emit) async {
    try {
      var chats = await datasource.getAllChats();
      if (chats is List<ChatModel>) {
        emit(GetChatsSuccess(chats: chats));
      } else {
        emit(GetChatsFailure(model: chats));
      }
    } catch (error) {
      emit(GetChatsFailure(model: SuccessModel(false, error.toString(), 0)));
    }
  }

  _onCreateChats(event, emit) async {
    try {
      var chat = await datasource.createChat(event.model);
      if (chat is ChatModel) {
        emit(CreateChatSuccess(chat: chat));
      } else {
        emit(CreateChatFailure(model: chat));
      }
    } catch (error) {
      emit(CreateChatFailure(model: SuccessModel(false, error.toString(), 0)));
    }
  }
}
