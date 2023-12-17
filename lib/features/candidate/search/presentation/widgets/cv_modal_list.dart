import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/features/candidate/notifications/chat/domain/chat_model.dart';
import 'package:work_ua/features/candidate/notifications/chat/domain/send_message_model.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/bloc/message_bloc/message_bloc.dart';
import 'package:work_ua/features/candidate/profile/domain/cv_model.dart';
import 'package:work_ua/features/candidate/profile/presentation/pages/cv_screen.dart';
import 'package:work_ua/features/candidate/profile/presentation/widgets/my_cvs/my_cv_list_item.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/cv_modal_list_item.dart';

class CVsModalList extends StatelessWidget {
  final List<CVModel> cvs;
  final ChatModel chat;
  const CVsModalList({super.key, required this.cvs, required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Future(() => context
                      .read<ChatBloc>()
                      .add(InitiateCreateChatEvent(model: chat)))
                  .then((value) {
                    var state = context.read<ChatBloc>().state;
                    if(state is CreateChatSuccess){
                      context.read<MessageBloc>().add(InitiateSendMessage(
                      message: SendMessageModel(
                          chatId: state.chat.id,
                          receiver: chat.user[1],
                          content:
                              'Hi, I would like to apply for ${chat.position}')));
                    }
                    })
                  .then((value) => context
                      .read<ChatBloc>()
                      .add(const InitiateGetChatsEvent()));
            },
            child: CVModalListItem(
              model: cvs[index],
              chat: chat,
            ));
      },
      itemCount: cvs.length,
    );
  }
}
