import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/colors.dart';

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
      width: MediaQuery.of(context).size.width - 50,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(
              Icons.contact_page_outlined,
              color: whiteColor,
              size: 40,
            ),
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
