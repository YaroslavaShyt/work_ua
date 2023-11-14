import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/core/widgets/label.dart';

class StartScreenHeaders extends StatelessWidget {
  const StartScreenHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Label(textColor: whiteColor),
        SizedBox(
          height: 20,
        ),
        Text(
          'Робота в Україні',
          style: TextStyle(
              color: whiteColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Зараз у нас 93656 актуальних вакансій.',
          style: TextStyle(
              color: whiteColor, fontSize: 15, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
