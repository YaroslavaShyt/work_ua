import 'package:flutter/material.dart';
import 'package:work_ua/features/profile/widgets/menu_item.dart';

class ItemsMenuList extends StatelessWidget {
  const ItemsMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        MenuItem(),
        MenuItem(),
        MenuItem(),
        MenuItem(),
        MenuItem(),
        MenuItem(),
        MenuItem(),
        MenuItem(),
        MenuItem()
      ],
    );
  }
}
