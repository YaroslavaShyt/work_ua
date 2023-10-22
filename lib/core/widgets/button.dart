import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final double borderRadius;
  const Button(
      {Key? key,
      required this.text,
      required this.color,
      required this.textColor,
      this.borderRadius = 8.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          backgroundColor: MaterialStateColor.resolveWith((states) => color),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
        ));
  }
}
