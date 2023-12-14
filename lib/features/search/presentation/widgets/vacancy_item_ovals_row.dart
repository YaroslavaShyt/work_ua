import 'package:flutter/material.dart';
import 'package:work_ua/features/search/presentation/widgets/oval_category_container.dart';

class VacancyItemOvalsRow extends StatelessWidget {
  final String format;
  final Color formatColor;
  final String experience;
  final Color experienceColor;
  final String timeType;
  final Color timeTypeColor;
  const VacancyItemOvalsRow(
      {super.key,
      required this.experience,
      required this.experienceColor,
      required this.format,
      required this.formatColor,
      required this.timeType,
      required this.timeTypeColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OvalCategory(
          category: 'Формат',
          data: format,
          color: formatColor,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OvalCategory(
            category: 'Досвід',
            data: experience,
            color: experienceColor,
          ),
        ),
        OvalCategory(
          category: 'Зайнятість',
          data: timeType,
          color: timeTypeColor,
        ),
      ],
    );
  }
}
