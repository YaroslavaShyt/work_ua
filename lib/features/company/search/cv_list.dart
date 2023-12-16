import 'package:flutter/material.dart';
import 'package:work_ua/features/candidate/profile/domain/cv_model.dart';
import 'package:work_ua/features/candidate/search/presentation/pages/vacancy_screen.dart';
import 'package:work_ua/features/company/search/cv_list_iterm.dart';
import 'package:work_ua/features/company/search/cv_screen.dart';

class CVList extends StatelessWidget {
  final List<CVModel> cvs;
  const CVList({super.key, required this.cvs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cvs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(CVScreenCompany.id, arguments: cvs[index]);
            },
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CVListItem(model: cvs[index])),
          );
        });
  }
}
