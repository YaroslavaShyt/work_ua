import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  final Color color;
  final Color fontColor;
  final String title;
  final function;
  const CategoryListItem(
      {super.key,
      required this.color,
      required this.fontColor,
      required this.title,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 150,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.abc_sharp),
            onPressed: () => {function()},
          ),
          Text(
            title,
            style: TextStyle(
                color: fontColor, fontWeight: FontWeight.normal, fontSize: 20),
          )
        ],
      ),
    );
  }
}
