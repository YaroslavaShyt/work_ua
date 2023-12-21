import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/colors.dart';
import 'package:work_ua/core/services/shared_preferences/shared_pref_user.dart';
import 'package:work_ua/features/authorization/presentation/pages/start_screen.dart';
import 'package:work_ua/features/candidate/profile/presentation/pages/my_cvs_screen.dart';
import 'package:work_ua/features/candidate/profile/presentation/widgets/menu_item.dart';

class ItemsMenuList extends StatelessWidget {
  const ItemsMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: lightGrayColor)),
          child: MenuItem(
            icon: const Icon(Icons.menu_book_outlined),
            text: 'Мої резюме',
            navigationString: MyCVsScreen.id,
            onPressed: () {
              Navigator.pushNamed(context, MyCVsScreen.id);
            },
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: lightGrayColor)),
            child: MenuItem(
              icon: const Icon(Icons.exit_to_app_outlined),
              text: 'Вихід',
              navigationString: StartScreen.id,
              onPressed: () async {
                print('an attempt made');
                var res = await removeValueFromSharedPreferences('accessToken');
                if (res) {
                  Navigator.pushReplacementNamed(context, StartScreen.id);
                }
                //
              },
            )),
      ],
    );
  }
}
