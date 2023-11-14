import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  final Color color;
  final Color fontColor;
  const CategoryListItem({super.key, required this.color, required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 150,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(Icons.abc_sharp),
          Text(
            'Title',
            style: TextStyle(
                color: fontColor, fontWeight: FontWeight.normal, fontSize: 20),
          )
        ],
      ),
    );
  }
}
