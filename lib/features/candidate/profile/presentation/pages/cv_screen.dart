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

  const CVScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CVBloc, CVState>(
      builder: (context, state) {
        if (state is CVGetSuccess) {
          return SafeArea(
              child: Scaffold(
            appBar: BlueAppBar(title: state.model.position),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Посада',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w200),
                      ),
                      Text(
                        state.model.position,
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Місто',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w200),
                      ),
                      Text(
                        state.model.city,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Про себе',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w200),
                      ),
                      Text(
                        state.model.description,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    child: Button(
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
                                        model: state.model,
                                        isUpdate: true,
                                      ),
                                      title: 'Редагувати резюме'),
                                );
                              });
                        }),
                  )
                ],
              ),
            ),
          ));
        }
        return const Center(
          child: CircularProgressIndicator(
            color: blueColor,
          ),
        );
      },
    );
  }
}
