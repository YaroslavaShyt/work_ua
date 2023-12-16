import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/features/authorization/presentation/widgets/modal/modal_bottom_sheet_register.dart';
import 'package:work_ua/features/candidate/profile/presentation/bloc/cv/cv_bloc.dart';
import 'package:work_ua/features/candidate/profile/presentation/widgets/my_cvs/create_cv_form.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/home_list_of_categories/categories_list_item.dart';

class HorizontalCategoriesList extends StatelessWidget {
  final Color color;
  final Color fontColor;
  const HorizontalCategoriesList(
      {super.key, required this.color, required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: CategoryListItem(
              color: color,
              fontColor: fontColor,
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
          );
        });
  }
}
