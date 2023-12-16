import 'package:flutter/material.dart';
import 'package:work_ua/core/services/shared_pref_user.dart';
import 'package:work_ua/features/authorization/presentation/pages/start_screen.dart';
import 'package:work_ua/features/candidate/profile/presentation/pages/my_cvs_screen.dart';
import 'package:work_ua/features/candidate/profile/presentation/widgets/menu_item.dart';

class ItemsMenuList extends StatelessWidget {
  const ItemsMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MenuItem(
          text: 'Мої резюме',
          navigationString: MyCVsScreen.id,
          onPressed: () {
            Navigator.pushNamed(context, MyCVsScreen.id);
          },
        ),
        MenuItem(
          text: 'Вихід',
          navigationString: StartScreen.id,
          onPressed: () async {
            await removeValueFromSharedPreferences('token');
            Navigator.pushReplacementNamed(context, StartScreen.id);
          },
        ),
      ],
    );
  }
}
