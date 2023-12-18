import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';

class MessageInputField extends StatelessWidget {
  final TextEditingController controller;
  final function;
  final onChanged;
  final onComplete;
  final String chatId;
  const MessageInputField(
      {super.key,
      required this.controller,
      required this.function,
      required this.onChanged,
      required this.chatId,
      required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50.0,
          width: MediaQuery.of(context).size.width - 120,
          child: TextField(
            onChanged: (chatId) {
              onChanged(chatId);
            },
            onEditingComplete: () => onComplete(chatId),
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: greenColor),
                    borderRadius: BorderRadius.circular(20.0))),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: greenColor),
          child: IconButton(
            icon: const Icon(Icons.send, color: whiteColor),
            onPressed: () {
              function(controller);
            },
          ),
        )
      ],
    );
  }
}
