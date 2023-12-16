import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final String navigationString;
  final VoidCallback onPressed;
  const MenuItem(
      {super.key, required this.text, required this.navigationString, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: const Icon(Icons.ac_unit_rounded),
        onPressed: onPressed
      ),
      title: Text(text),
    );
  }
}
