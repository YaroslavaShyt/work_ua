import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/widgets/colors.dart';
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ChatBloc()),
        ],
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context
                    .read<ChatBloc>()
                    .add(InitiateCreateChatEvent(model: chat, initMessage:SendMessageModel(
                           chatId: '',
                           receiver: chat.user[1],
                           content:
                               'Hi, I would like to apply for ${chat.position}!\n'
                               'Резюме:\n'
                               '${cvs[index].position}\n'
                               '${cvs[index].description}') ));
                Future.delayed(const Duration(milliseconds: 3));
                var state = context.read<ChatBloc>().state;
                if (state is CreateChatSuccess) {
                   showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          title: Text(
                            'WORK.ua',
                            style: TextStyle(
                                color: blueColor, fontWeight: FontWeight.bold),
                          ),
                          content: Text(
                            'Резюме успішно надіслане!',
                            style: TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        );
                      });
                  // context.read<MessageBloc>().add(InitiateSendMessage(
                  //     message: SendMessageModel(
                  //         chatId: state.chat.id,
                  //         receiver: chat.user[1],
                  //         content:
                  //             'Hi, I would like to apply for ${chat.position}!\n'
                  //             'Резюме:\n'
                  //             '${cvs[index].position}\n'
                  //             '${cvs[index].description}')));
                }
                if (state is CreateChatFailure) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          title: Text(
                            'WORK.ua',
                            style: TextStyle(
                                color: blueColor, fontWeight: FontWeight.bold),
                          ),
                          content: Text(
                            'Не вдалося надіслати резюме(',
                            style: TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        );
                      });
                }
                Future.delayed(const Duration(milliseconds: 3));

                context.read<ChatBloc>().add(const InitiateGetChatsEvent());
                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       // var state = context.read<MessageBloc>().state;
                //       // if (state is SendMessageSuccess) {
                        
                //       // } else {
                //       //   return const AlertDialog(
                //       //     title: Text(
                //       //       'WORK.ua',
                //       //       style: TextStyle(
                //       //           color: blueColor, fontWeight: FontWeight.bold),
                //       //     ),
                //       //     content: Text(
                //       //       'Не вдалось надіслати резюме(',
                //       //       style: TextStyle(
                //       //           color: blackColor,
                //       //           fontWeight: FontWeight.bold,
                //       //           fontSize: 18),
                //       //     ),
                //       //  );
                //       //}
                //     });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    border: Border.all(color: lightGrayColor)),
                child: CVModalListItem(
                  model: cvs[index],
                  chat: chat,
                ),
              ),
            );
          },
          itemCount: cvs.length,
        ));
  }
}
