import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';

class MessageRight extends StatelessWidget {
  final String message;
  const MessageRight({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          //width: 200,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0), color: blueColor),
          child: Text(
            message,
            style: const TextStyle(color: whiteColor),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(Icons.person),
            Text(
              '10:10',
              style: TextStyle(color: darkGrayColor, fontSize: 8.0),
            )
          ],
        ),
      ],
    );
  }
}
