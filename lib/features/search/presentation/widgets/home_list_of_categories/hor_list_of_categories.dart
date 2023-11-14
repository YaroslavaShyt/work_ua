import 'package:flutter/material.dart';
import 'package:work_ua/features/search/presentation/widgets/home_list_of_categories/categories_list_item.dart';

class HorizontalCategoriesList extends StatelessWidget {
  final Color color;
  final Color fontColor;
  const HorizontalCategoriesList({super.key, required this.color, required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: CategoryListItem(color: color, fontColor: fontColor,),
          );
        });
  }
}
