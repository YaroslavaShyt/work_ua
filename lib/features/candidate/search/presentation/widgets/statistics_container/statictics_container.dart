import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';

class StaticticsContainer extends StatelessWidget {
  const StaticticsContainer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(15.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 70.0),
                  child: Text(
                    "Відгукніться ще на 4 вакансії",
                    style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.0, top: 10),
                  child: Text(
                    "Що більше ви відгукуєтесь на вакансії, "
                    "то вищі ваші шанси знайти роботу. "
                    "У середньому, щоб отримати запрошення на співбесіду, "
                    "треба відгукнутись на 7 вакансій.",
                    style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.access_time_outlined,
            size: 50,
          ),
        ],
      ),
    );
  }
}
