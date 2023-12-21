import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/colors.dart';

class WelcomeProfileWidget extends StatelessWidget {
  final String userName;
  const WelcomeProfileWidget({super.key, required this.userName});

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
              )),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ласкаво просимо,",
                style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text("$userName!",
                  style: const TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25))
            ],
          )
        ]),
      ),
    );
  }
}
