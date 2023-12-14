import 'package:flutter/material.dart';

class VacancyListItem extends StatelessWidget {
  final String jobTitle;
  final String image;
  final String salary;
  final String companyName;
  final String format;
  final String timeType;
  final String experience;
  final String description;
  const VacancyListItem(
      {super.key,
      required this.jobTitle,
      required this.image,
      required this.companyName,
      required this.description,
      required this.experience,
      required this.format,
      required this.salary,
      required this.timeType});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(jobTitle),
            // SizedBox(height: 50, child: Image.network(image))
          ],
        ),
        Text(salary),
        Text(companyName),
        Text(format),
        Row(
          children: [
            Text(experience),
            Text(timeType),
          ],
        ),
        Text(description)
      ]),
    );
  }
}
