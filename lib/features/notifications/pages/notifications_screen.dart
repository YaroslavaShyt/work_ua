import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/blue_appbar.dart';
import 'package:work_ua/features/notifications/widgets/no_notifications.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BlueAppBar(title: 'Сповіщення'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [NoNotifications()],
        ),
      ),
    );
  }
}
