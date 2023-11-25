import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final String navigationString;
  const MenuItem(
      {super.key, required this.text, required this.navigationString});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: const Icon(Icons.ac_unit_rounded),
        onPressed: () {
          Navigator.pushNamed(context, navigationString);
        },
      ),
      title: Text(text),
    );
  }
}
