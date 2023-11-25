import 'package:flutter/material.dart';
import 'package:work_ua/features/profile/domain/cv_model.dart';
import 'package:work_ua/features/profile/presentation/pages/cv_screen.dart';
import 'package:work_ua/features/profile/presentation/widgets/my_cvs/my_cv_list_item.dart';

class MyCVsList extends StatelessWidget {
  final List<CVModel> cvs;
  const MyCVsList({super.key, required this.cvs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(CVScreen.id, arguments: cvs[index]);
            },
            child: MyCVListItem(model: cvs[index]));
      },
      itemCount: cvs.length,
    );
  }
}
