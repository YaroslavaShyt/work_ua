import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/colors.dart';

class ConfidencyPolitics extends StatelessWidget {
  const ConfidencyPolitics({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
      child: Text(
        'Продовжуючи, ви приймаєте правила сайту та політику конфіденційності',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: whiteColor, fontSize: 15, fontWeight: FontWeight.w300),
      ),
    );
  }
}
