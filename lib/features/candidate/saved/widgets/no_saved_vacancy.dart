import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/colors.dart';

class NoSavedVacancy extends StatelessWidget {
  const NoSavedVacancy({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(
          Icons.copy,
          color: darkGrayColor,
          size: 50,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Ще немає збережених вакансій.",
          style: TextStyle(color: darkGrayColor, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
