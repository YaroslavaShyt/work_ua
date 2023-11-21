import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormFieldText extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  //final validator;
  final List<MaskTextInputFormatter>? formatters;
  const FormFieldText(
      {super.key,
      required this.controller,
      required this.title,
     // required this.validator,
      this.formatters
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    //  validator: (value) => validator(value),
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          label: Text(title)),
      inputFormatters: formatters ?? [],
    );
  }
}
