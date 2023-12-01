import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/blue_appbar.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/chat_list.dart';
import 'package:work_ua/features/notifications/chat/presentation/widgets/chat_list_element.dart';
import 'package:work_ua/features/notifications/widgets/no_notifications.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BlueAppBar(title: 'Сповіщення'),
      body: Center(
          child: Padding(padding: const EdgeInsets.all(8.0), child: ChatList())

          /*Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [NoNotifications()],
        ),*/
          ),
    );
  }
}
