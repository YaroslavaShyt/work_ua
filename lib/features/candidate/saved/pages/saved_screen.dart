import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/blue_appbar.dart';
import 'package:work_ua/features/candidate/saved/widgets/no_saved_vacancy.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BlueAppBar(title: 'Збережені вакансії'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [NoSavedVacancy()],
        ),
      ),
    );
  }
}
