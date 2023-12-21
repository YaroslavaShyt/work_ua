import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/widgets/colors.dart';
import 'package:work_ua/core/widgets/blue_appbar.dart';
import 'package:work_ua/core/widgets/button.dart';
import 'package:work_ua/features/authorization/presentation/widgets/modal/modal_bottom_sheet_register.dart';
import 'package:work_ua/features/candidate/profile/domain/cv_model.dart';
import 'package:work_ua/features/candidate/profile/presentation/bloc/cv/cv_bloc.dart';
import 'package:work_ua/features/candidate/profile/presentation/widgets/my_cvs/create_cv_form.dart';

class CVScreen extends StatelessWidget {
  static const id = "cv_screen";
  final CVModel model;

  const CVScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: BlueAppBar(title: model.position),
      body: Column(
        children: [
          Text(model.description),
          Button(
              text: 'Редагувати',
              color: crimsonColor,
              textColor: whiteColor,
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return BlocProvider(
                        create: (context) => CVBloc(),
                        child: ModalBottomSheetContent(
                            form: CreateCVForm(
                              model: model,
                              isUpdate: true,
                            ),
                            title: 'Створити резюме'),
                      );
                    });
              })
        ],
      ),
    ));
  }
}
