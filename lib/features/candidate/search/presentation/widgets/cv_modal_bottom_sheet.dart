import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/core/widgets/label.dart';

class CVModalBottomSheetContent extends StatelessWidget {
  final String title;
  final cvs;
  const CVModalBottomSheetContent(
      {super.key, required this.cvs, required this.title});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(height: 100, child: cvs),
            ),
          ],
        ),
      ),
    );
  }
}
