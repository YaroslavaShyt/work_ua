import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/colors.dart';

class NoNotifications extends StatelessWidget {
  const NoNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(
          Icons.copy,
          color: darkGrayColor,
          size: 50,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Ще немає сповіщень.",
          style: TextStyle(color: darkGrayColor, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
