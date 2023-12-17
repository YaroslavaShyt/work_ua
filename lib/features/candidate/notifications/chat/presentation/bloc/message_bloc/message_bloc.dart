import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:work_ua/core/success_model.dart';
import 'package:work_ua/features/candidate/notifications/chat/datasource/message_datasource.dart';
import 'package:work_ua/features/candidate/notifications/chat/domain/message_model.dart';
import 'package:work_ua/features/candidate/notifications/chat/domain/send_message_model.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageDatasource datasource = MessageDatasource();
  MessageBloc() : super(MessageInitial()) {
    on<InitiateSendMessage>(_onSendMessage);
    on<InitiateGetMessages>(_onGetMessages);
  }
  _onSendMessage(event, emit) async {
    try {
      var result = await datasource.sendMessage(event.message);
      if (result is MessageModel) {
        emit(SendMessageSuccess(model: result));
      } else {
        emit(SendMessageFailure(message: result.message));
      }
    } catch (err) {
      emit(SendMessageFailure(message: err.toString()));
    }
  }

  _onGetMessages(event, emit) async {
    try {
      var result = await datasource.getMessages(event.chatId, event.offset);
      if (result is List<MessageModel>) {
        print('emited success');
        emit(GetMessagesSuccess(messages: result));
      } else {
        emit(GetMessagesFailure(model: result));
      }
    } catch (err) {
      emit(SendMessageFailure(message: err.toString()));
    }
  }
}
