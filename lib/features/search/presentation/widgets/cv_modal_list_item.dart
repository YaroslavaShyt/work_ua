import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/features/notifications/chat/domain/chat_model.dart';
import 'package:work_ua/features/notifications/chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:work_ua/features/profile/domain/cv_model.dart';
import 'package:work_ua/features/profile/presentation/bloc/cv/cv_bloc.dart';

class CVModalListItem extends StatelessWidget {
  final CVModel model;
  final ChatModel chat;
  const CVModalListItem({super.key, required this.model, required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: const Icon(Icons.ac_unit_rounded),
        onPressed: () {
          //context.read<ChatBloc>().add(InitiateCreateChatEvent(model: chat));
        },
      ),
      title: Text(model.position),
    );
  }
}
