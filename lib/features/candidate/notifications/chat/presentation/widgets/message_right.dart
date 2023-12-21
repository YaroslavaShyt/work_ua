import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/colors.dart';

class MessageRight extends StatelessWidget {
  final String message;
  final String time;

  const MessageRight({Key? key, required this.message, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: blueColor,
            ),
            child: Text(
              message,
              style: const TextStyle(color: whiteColor),
              softWrap: true,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(Icons.person),
            Text(
              time,
              style: const TextStyle(color: darkGrayColor, fontSize: 8.0),
            ),
          ],
        ),
      ],
    );
  }
}
