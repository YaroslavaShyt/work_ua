import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:work_ua/core/success_model.dart';
import 'package:work_ua/features/notifications/chat/datasource/chat_datasource.dart';
import 'package:work_ua/features/notifications/chat/domain/chat_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatDatasource datasource = ChatDatasource();
  ChatBloc() : super(ChatInitial()) {
    on<ChatEvent>(_onGetChats);
  }

  _onGetChats(event, emit) async {
    try {
      var chats = await datasource.getAllChats(event.userId);
      if (chats is List<ChatModel>) {
        emit(GetChatsSuccess(chats: chats));
      } else {
        emit(GetChatsFailure(model: chats));
      }
    } catch (error) {
      emit(GetChatsFailure(model: SuccessModel(false, error.toString(), 0)));
    }
  }
}
