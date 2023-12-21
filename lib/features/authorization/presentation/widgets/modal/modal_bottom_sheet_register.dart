import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/colors.dart';
import 'package:work_ua/core/widgets/label.dart';

class ModalBottomSheetContent extends StatelessWidget {
  final String title;
  final form;
  const ModalBottomSheetContent({super.key, required this.form, required this.title});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child:  Column(
          children: [
             const SizedBox(
              height: 50,
            ),
            const Label(textColor: blueColor),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: form,
            ),
          ],
        ),
      ),
    );
  }
}