import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/blue_appbar.dart';
import 'package:work_ua/features/candidate/recommended/widgets/no_rec_vacancy.dart';

class RecommendedScreen extends StatelessWidget {
  const RecommendedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BlueAppBar(
        title: 'Рекомендовані вакансії',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: NoRecommendedVacancy(),
          ),
        ],
      ),
    );
  }
}
