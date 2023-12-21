import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/colors.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/oval_category_container.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/vacancy_item_ovals_row.dart';

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
    var formatColor, experienceColor, timeTypeColor;
    if (format == 'remote') {
      formatColor = greenColor;
    } else {
      formatColor = redColor;
    }
    if (experience == 'no required') {
      experienceColor = greenColor;
    } else {
      experienceColor = redColor;
    }
    if (timeType == 'part time') {
      timeTypeColor = greenColor;
    } else {
      timeTypeColor = redColor;
    }

    return Container(
      //color: lightGrayColor,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: lightGrayColor)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              jobTitle,
              style: const TextStyle(
                  fontSize: 20.0,
                  color: blackColor,
                  fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.work)
            //SizedBox(height: 50, width: 50, child: Image.network(image))
          ],
        ),
        Text(
          salary,
          style: const TextStyle(
              fontSize: 18.0, color: blackColor, fontWeight: FontWeight.bold),
        ),
        Text(companyName),
        VacancyItemOvalsRow(
          experience: experience,
          experienceColor: experienceColor,
          format: format,
          formatColor: formatColor,
          timeType: timeType,
          timeTypeColor: timeTypeColor,
        ),
        Text(
          _truncateDescription(description),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        )
      ]),
    );
  }

  String _truncateDescription(String description) {
    const int maxCharacters =
        10; // Максимальна кількість символів для відображення
    return description.length <= maxCharacters
        ? description
        : '${description.substring(0, maxCharacters)}...';
  }
}
