import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/core/services/shared_pref_user.dart';
import 'package:work_ua/core/widgets/blue_appbar.dart';
import 'package:work_ua/features/notifications/chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/chat_list.dart';
import 'package:work_ua/features/notifications/widgets/no_notifications.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late String userId;

  @override
  void initState() {
    super.initState();
    getUserId();
  }

  Future<void> getUserId() async {
    userId = await getUserFieldNamed('id');
    context.read<ChatBloc>().add(InitiateGetChatsEvent(userId: userId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BlueAppBar(title: 'Сповіщення'),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is GetChatsFailure) {
            print(state.model.message);
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [NoNotifications()],
            );
          }
          if (state is GetChatsSuccess) {
            return Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ChatList(
                      chats: state.chats,
                    )));
          }
          return const CircularProgressIndicator(
            color: blueColor,
          );
        },
      ),
    );
  }
}
