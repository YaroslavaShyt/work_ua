import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/widgets/colors.dart';
import 'package:work_ua/core/services/shared_preferences/shared_pref_user.dart';
import 'package:work_ua/features/authorization/data/models/user_register_model.dart';
import 'package:work_ua/features/authorization/presentation/widgets/modal/modal_bottom_sheet_register.dart';
import 'package:work_ua/features/candidate/profile/presentation/bloc/cv/cv_bloc.dart';
import 'package:work_ua/features/candidate/profile/presentation/bloc/user/user_bloc.dart';
import 'package:work_ua/features/candidate/profile/presentation/widgets/items_menu_list.dart';
import 'package:work_ua/features/candidate/profile/presentation/widgets/welcome_widget.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/create_job_form.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/home_list_of_categories/categories_list_item.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/home_list_of_categories/hor_list_of_categories.dart';
import 'package:work_ua/features/company/profile/presentation/widgets/company_welcome_profile.dart';

class CompanyProfileScreen extends StatefulWidget {
  const CompanyProfileScreen({super.key});

  @override
  State<CompanyProfileScreen> createState() => _CompanyProfileScreenState();
}

class _CompanyProfileScreenState extends State<CompanyProfileScreen> {
  @override
  void initState() {
    super.initState();
    initializeUserData();
  }

  void initializeUserData() async {
    var data = await getUserFieldNamed('id');

    if (data.isNotEmpty) {
      //print('success');
      context.read<UserBloc>().add(InitiateGetUserEvent(userId: data));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is GetUserSuccess) {
              return Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: CompanyWelcomeProfileWidget(
                      userName: state.userModel.name,
                      companyName: state.userModel.title ?? 'Без назви',
                    ),
                  ),
                  Positioned(
                      top: 110,
                      left: 20,
                      right: 20,
                      child: SizedBox(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        child: HorizontalCategoriesList(
                          color: greenColor,
                          fontColor: whiteColor,
                          item: CategoryListItem(
                            color: greenColor,
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
                        ),
                      )),
                  Positioned(
                      top: 220,
                      left: 20,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width - 50,
                          height: MediaQuery.of(context).size.height - 50,
                          child: const ItemsMenuList()))
                ],
              );
            }
            if (state is GetUserFailure) {
              return Center(child: Text(state.successModel.message));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
