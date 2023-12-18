import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final String navigationString;
  final VoidCallback onPressed;
  final Icon icon;
  const MenuItem(
      {super.key, required this.text, required this.navigationString, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: icon,
        onPressed: onPressed
      ),
      title: Text(text),
    );
  }
}
