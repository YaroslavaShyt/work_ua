import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/colors.dart';

class OvalCategory extends StatelessWidget {
  final String category;
  final String data;
  final Color color;
  const OvalCategory(
      {super.key,
      required this.category,
      required this.data,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          color: color),
      child: Column(
        children: [
          Text(
            category,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: whiteColor, fontSize: 10.0),
          ),
          Text(
            data,
            style: const TextStyle(color: whiteColor, fontSize: 10.0),
          )
        ],
      ),
    );
  }
}
