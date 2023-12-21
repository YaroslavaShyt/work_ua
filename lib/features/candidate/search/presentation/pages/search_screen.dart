import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/widgets/colors.dart';
import 'package:work_ua/core/widgets/start_screen_headers.dart';
import 'package:work_ua/features/authorization/presentation/widgets/modal/modal_bottom_sheet_register.dart';
import 'package:work_ua/features/candidate/profile/presentation/bloc/cv/cv_bloc.dart';
import 'package:work_ua/features/candidate/profile/presentation/widgets/my_cvs/create_cv_form.dart';
import 'package:work_ua/features/candidate/search/presentation/bloc/search_bloc.dart';
import 'package:work_ua/features/candidate/search/presentation/pages/search_result.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/home_list_of_categories/categories_list_item.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/home_list_of_categories/hor_list_of_categories.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/no_vacancies.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/search_form/search_form.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/statistics_container/statictics_container.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/vacancy_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
                child: HorizontalCategoriesList(
                  color: lightBlue,
                  fontColor: whiteColor,
                  item: CategoryListItem(
              color: blueColor,
              fontColor: whiteColor,
              title: 'Створити резюме',
              function: () => {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return BlocProvider(
                        create: (context) => CVBloc(),
                        child: const ModalBottomSheetContent(
                            form: CreateCVForm(), title: 'Створити резюме'),
                      );
                    })
              },
            ),
                )),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: const StaticticsContainer())
          ],
        )),
      ),
    );
  }
}
