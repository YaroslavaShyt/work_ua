import 'package:flutter/material.dart';
import 'package:work_ua/features/profile/domain/cv_model.dart';
import 'package:work_ua/features/profile/presentation/pages/cv_screen.dart';
import 'package:work_ua/features/profile/presentation/widgets/my_cvs/my_cv_list_item.dart';

class MyCVsList extends StatelessWidget {
  final List<CVModel> cvs;
  final onTap;
  const MyCVsList({super.key, required this.cvs, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: onTap,
            child: MyCVListItem(model: cvs[index]));
      },
      itemCount: cvs.length,
    );
  }
}
