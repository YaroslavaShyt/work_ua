import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';

class WhiteFormField extends StatelessWidget {
  final TextEditingController controller;
  const WhiteFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          filled: true,
          fillColor: whiteColor),
    );
  }
}
