import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/core/services/shared_pref_user.dart';
import 'package:work_ua/features/authorization/data/models/user_register_model.dart';
import 'package:work_ua/features/candidate/profile/presentation/bloc/user/user_bloc.dart';
import 'package:work_ua/features/candidate/profile/presentation/widgets/items_menu_list.dart';
import 'package:work_ua/features/candidate/profile/presentation/widgets/welcome_widget.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/home_list_of_categories/hor_list_of_categories.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                    child: WelcomeProfileWidget(
                      userName: state.userModel.name,
                    ),
                  ),
                  Positioned(
                      top: 110,
                      left: 20,
                      right: 20,
                      child: SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: const HorizontalCategoriesList(
                          color: greenColor,
                          fontColor: whiteColor,
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
