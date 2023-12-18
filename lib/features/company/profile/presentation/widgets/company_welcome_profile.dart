import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';

class CompanyWelcomeProfileWidget extends StatelessWidget {
  final String userName;
  final String companyName;
  const CompanyWelcomeProfileWidget(
      {super.key, required this.userName, required this.companyName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        color: blueColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
                color: lightGrayColor, shape: BoxShape.circle),
            child: const Icon(
              Icons.person_outline_rounded,
              size: 40,
              color: darkGrayColor,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                companyName,
                style: const TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text("Вітаємо, $userName!",
                  style: const TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20))
            ],
          )
        ]),
      ),
    );
  }
}
