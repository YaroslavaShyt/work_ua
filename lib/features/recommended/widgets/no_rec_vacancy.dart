import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';

class NoRecommendedVacancy extends StatelessWidget {
  const NoRecommendedVacancy({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
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
          "Зараз немає рекомендованих вакансій.",
          style: TextStyle(color: darkGrayColor, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        Text(
          "Ви можете перейти до самостійного "
          "пошуку або повернутися в цей розділ пізніше.",
          style: TextStyle(color: darkGrayColor, fontSize: 18),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
