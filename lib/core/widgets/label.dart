import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final Color textColor;
  const Label({super.key, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      'WORK.ua',
      style: TextStyle(
          color: textColor, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
