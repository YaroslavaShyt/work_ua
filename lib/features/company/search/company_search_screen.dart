import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/core/widgets/start_screen_headers.dart';
import 'package:work_ua/features/authorization/presentation/widgets/modal/modal_bottom_sheet_register.dart';
import 'package:work_ua/features/candidate/profile/presentation/bloc/cv/cv_bloc.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/create_job_form.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/home_list_of_categories/categories_list_item.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/home_list_of_categories/hor_list_of_categories.dart';
import 'package:work_ua/features/company/search/cv_search_form.dart';

class CompanySearchScreen extends StatelessWidget {
  static const id = "company_search_screen";
  const CompanySearchScreen({super.key});

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
            const CVSearchForm(),
            const SizedBox(
              height: 30,
            ),
            // change to create vacancy
            SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width - 50,
                child: HorizontalCategoriesList(
                  color: lightBlue,
                  fontColor: whiteColor,
                  item: CategoryListItem(
                    color: lightBlue,
                    fontColor: whiteColor,
                    title: 'Створити вакансію',
                    function: () => {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return BlocProvider(
                              create: (context) => CVBloc(),
                              child: const ModalBottomSheetContent(
                                  form: CreateJobForm(),
                                  title: 'Створити вакансію'),
                            );
                          })
                    },
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
          ],
        )),
      ),
    );
  }
}
