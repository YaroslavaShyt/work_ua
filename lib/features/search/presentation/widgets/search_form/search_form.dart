import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/core/widgets/button.dart';
import 'package:work_ua/features/search/presentation/widgets/search_form/form_field.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final TextEditingController requestController =
      TextEditingController(text: "Flutter");
  final TextEditingController locationController =
      TextEditingController(text: "Вся Україна");

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            WhiteFormField(
              controller: requestController,
            ),
            const SizedBox(
              height: 20,
            ),
            WhiteFormField(
              controller: locationController,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Button(
                text: "Знайти вакансії",
                onTap: () => {},
                color: crimsonColor,
                textColor: whiteColor,
              ),
            )
          ],
        ),
      )
    ]));
  }
}
