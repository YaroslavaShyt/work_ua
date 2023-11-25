import 'package:flutter/material.dart';
import 'package:work_ua/features/profile/presentation/pages/my_cvs_screen.dart';
import 'package:work_ua/features/profile/presentation/widgets/menu_item.dart';

class ItemsMenuList extends StatelessWidget {
  const ItemsMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        MenuItem(
          text: 'Мої резюме',
          navigationString: MyCVsScreen.id,
        ),
        MenuItem(
          text: 'Мої резюме',
          navigationString: MyCVsScreen.id,
        ),
        MenuItem(
          text: 'Мої резюме',
          navigationString: MyCVsScreen.id,
        ),
        MenuItem(
          text: 'Мої резюме',
          navigationString: MyCVsScreen.id,
        ),
      ],
    );
  }
}
