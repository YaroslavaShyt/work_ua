import 'package:flutter/material.dart';
import 'package:work_ua/features/candidate/search/data/job_model.dart';
import 'package:work_ua/features/candidate/search/presentation/pages/vacancy_screen.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/vacancy_list_item.dart';

class VacancyList extends StatelessWidget {
  final List<JobModel> vacancies;
  const VacancyList({super.key, required this.vacancies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: vacancies.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(VacancyScreen.id, arguments: vacancies[index]);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: VacancyListItem(
                  jobTitle: vacancies[index].title,
                  image:
                      'https://wonderfulengineering.com/wp-content/uploads/2014/10/image-wallpaper-15.jpg',
                  companyName: 'Add into model',
                  description: vacancies[index].description,
                  experience: vacancies[index].experience,
                  format: vacancies[index].format,
                  salary: vacancies[index].salary,
                  timeType: vacancies[index].timeType),
            ),
          );
        });
  }
}
