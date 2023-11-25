import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/features/profile/presentation/bloc/cv_bloc.dart';
import 'package:work_ua/features/profile/presentation/widgets/items_menu_list.dart';
import 'package:work_ua/features/profile/presentation/widgets/welcome_widget.dart';
import 'package:work_ua/features/search/presentation/widgets/home_list_of_categories/hor_list_of_categories.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: WelcomeProfileWidget(
                userName: "Ярослава",
              ),
            ),
            Positioned(
                top: 110,
                left: 20,
                child: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width - 50,
                  child: const HorizontalCategoriesList(
                    color: whiteColor,
                    fontColor: blackColor,
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
        ),
      ),
    );
  }
}
