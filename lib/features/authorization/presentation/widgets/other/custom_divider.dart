import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String text;
  final Color lineColor;
  final Color textColor;

  const CustomDivider(
      {Key? key,
      required this.text,
      required this.lineColor,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            color: lineColor,
            height: 36,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
        Expanded(
          child: Divider(
            color: lineColor,
            height: 36,
          ),
        ),
      ],
    );
  }
}
