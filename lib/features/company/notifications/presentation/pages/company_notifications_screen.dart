import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/core/services/shared_pref_user.dart';
import 'package:work_ua/core/widgets/blue_appbar.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/widgets/chat_list.dart';
import 'package:work_ua/features/candidate/notifications/widgets/no_notifications.dart';

class CompanyNotificationsScreen extends StatefulWidget {
  const CompanyNotificationsScreen({super.key});

  @override
  State<CompanyNotificationsScreen> createState() => _CompanyNotificationsScreenState();
}

class _CompanyNotificationsScreenState extends State<CompanyNotificationsScreen> {
  late String userId;

  @override
  void initState() {
    super.initState();
    getUserId();
  }

  Future<void> getUserId() async {
    userId = await getUserFieldNamed('id');
    context.read<ChatBloc>().add(InitiateGetChatsEvent());
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
