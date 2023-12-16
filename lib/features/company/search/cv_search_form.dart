import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/core/widgets/button.dart';
import 'package:work_ua/features/candidate/search/presentation/bloc/search_bloc.dart';
import 'package:work_ua/features/candidate/search/presentation/pages/search_result.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/search_form/form_field.dart';
import 'package:work_ua/features/company/search/company_search_screen.dart';
import 'package:work_ua/features/company/search/company_search_screen_results.dart';

class CVSearchForm extends StatefulWidget {
  const CVSearchForm({super.key});

  @override
  State<CVSearchForm> createState() => _CVSearchFormState();
}

class _CVSearchFormState extends State<CVSearchForm> {
  final TextEditingController requestController =
      TextEditingController(text: "");
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
                text: "Знайти кандидатів",
                onTap: () => {
                  Navigator.of(context).pushReplacementNamed(
                      CompanySearchResultPage.id,
                      arguments: requestController.text)
                },
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
