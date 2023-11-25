import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/widgets/blue_appbar.dart';
import 'package:work_ua/features/profile/presentation/bloc/cv_bloc.dart';
import 'package:work_ua/features/profile/presentation/widgets/my_cvs/my_cvs_list.dart';

class MyCVsScreen extends StatefulWidget {
  static const id = "my_cvs_screen";

  const MyCVsScreen({super.key});

  @override
  State<MyCVsScreen> createState() => _MyCVsScreenState();
}

class _MyCVsScreenState extends State<MyCVsScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<CVBloc>().add(
          CVReadAllInitiateEvent(
            conditions: const {"userId": "655c7d917de5799cf02aef77"},
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const BlueAppBar(
            title: 'Мої резюме',
            isBackButton: true,
          ),
          body: BlocBuilder<CVBloc, CVState>(
            builder: (context, state) {
              if (state is CVGetAllSuccess) {
                if (state.models.isEmpty) {
                  return const Center(
                    child: Text('Ще немає резюме.'),
                  );
                }
                return MyCVsList(
                  cvs: state.models,
                );
              }
              if (state is CVGetAllFail) {
                return Center(
                  child: Text(state.model.message),
                );
              }
              if (state is CVDeleteSuccess) {
                context.read<CVBloc>().add(CVReadAllInitiateEvent(
                    conditions: const {"userId": "655c7d917de5799cf02aef77"}));
              }
              return const Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}
