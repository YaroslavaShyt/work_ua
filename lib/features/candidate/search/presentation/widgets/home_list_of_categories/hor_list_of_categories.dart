import 'package:flutter/material.dart';

class HorizontalCategoriesList extends StatelessWidget {
  final Color color;
  final Color fontColor;
  final item;
  const HorizontalCategoriesList(
      {super.key, required this.color, required this.fontColor, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: item
          );
        });
  }
}
