import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/colors.dart';
import 'package:work_ua/features/candidate/profile/domain/cv_model.dart';

class CVListItem extends StatelessWidget {
  final CVModel model;
  const CVListItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
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
              model.position,
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
          _truncateDescription(model.description),
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
