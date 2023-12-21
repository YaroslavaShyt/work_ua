import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/features/candidate/profile/domain/cv_model.dart';
import 'package:work_ua/features/candidate/profile/presentation/bloc/cv/cv_bloc.dart';

class MyCVListItem extends StatelessWidget {
  final CVModel model;
  const MyCVListItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: const Icon(Icons.book),
        onPressed: () {
          //   Navigator.pushReplacementNamed(context, HomeScreen.id);
        },
      ),
      title: Text(model.position),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          context.read<CVBloc>().add(CVDeleteInitiateEvent(id: model.id!));
        },
      ),
    );
  }
}
