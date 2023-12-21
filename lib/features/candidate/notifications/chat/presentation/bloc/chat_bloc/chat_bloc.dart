import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:work_ua/core/data/success_model.dart';
import 'package:work_ua/features/candidate/notifications/chat/datasource/chat_datasource.dart';
import 'package:work_ua/features/candidate/notifications/chat/datasource/message_datasource.dart';
import 'package:work_ua/features/candidate/notifications/chat/domain/chat_model.dart';
import 'package:work_ua/features/candidate/notifications/chat/domain/message_model.dart';
import 'package:work_ua/features/candidate/notifications/chat/domain/send_message_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatDatasource datasource = ChatDatasource();
  final MessageDatasource messageDatasource = MessageDatasource();

  ChatBloc() : super(ChatInitial()) {
    on<InitiateGetChatsEvent>(_onGetChats);
    on<InitiateCreateChatEvent>(_onCreateChats);
    on<InitiateGetChatEvent>(_onGetChat);
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
        var res = await messageDatasource.sendMessage(SendMessageModel(
            content: event.initMessage.content,
            chatId: chat.id,
            receiver: event.initMessage.receiver));
        if (res is MessageModel) {
          emit(CreateChatSuccess(chat: chat));
        } else {
          emit(CreateChatFailure(model: res));
        }
      } else {
        emit(CreateChatFailure(model: chat));
      }
    } catch (error) {
      emit(CreateChatFailure(model: SuccessModel(false, error.toString(), 0)));
    }
  }

  _onGetChat(event, emit) async {
    try {
      var chat = await datasource.getChat(event.chatId);
      if (chat is ChatModel) {
        emit(GetChatSuccess(chat: chat));
      } else {
        emit(GetChatFailure(model: chat));
      }
    } catch (error) {
      emit(GetChatFailure(model: SuccessModel(false, error.toString(), 0)));
    }
  }
}
