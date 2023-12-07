import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';

class MessageInputField extends StatelessWidget {
  final TextEditingController controller;
  const MessageInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50.0,
          width: MediaQuery.of(context).size.width - 120,
          child: TextField(
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
          padding: const EdgeInsets.all(10),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: greenColor),
          child: const Icon(
            Icons.send,
            color: whiteColor,
          ),
        )
      ],
    );
  }
}
