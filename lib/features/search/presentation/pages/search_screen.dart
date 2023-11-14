import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/core/widgets/start_screen_headers.dart';
import 'package:work_ua/features/search/presentation/widgets/home_list_of_categories/hor_list_of_categories.dart';
import 'package:work_ua/features/search/presentation/widgets/search_form/search_form.dart';
import 'package:work_ua/features/search/presentation/widgets/statistics_container/statictics_container.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const StartScreenHeaders(),
            const SizedBox(
              height: 30,
            ),
            const SearchForm(),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width - 50,
                child: const HorizontalCategoriesList(
                  color: lightBlue,
                  fontColor: whiteColor,
                )),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: const StaticticsContainer())
          ],
        ),
      ),
    );
  }
}
