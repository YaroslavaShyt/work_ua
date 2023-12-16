import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/services/shared_pref_user.dart';
import 'package:work_ua/core/widgets/blue_appbar.dart';
import 'package:work_ua/features/candidate/profile/presentation/bloc/cv/cv_bloc.dart';
import 'package:work_ua/features/candidate/profile/presentation/pages/cv_screen.dart';
import 'package:work_ua/features/candidate/profile/presentation/widgets/my_cvs/my_cvs_list.dart';

class MyCVsScreen extends StatefulWidget {
  static const id = "my_cvs_screen";

  const MyCVsScreen({super.key});

  @override
  State<MyCVsScreen> createState() => _MyCVsScreenState();
}

class _MyCVsScreenState extends State<MyCVsScreen> {
  late String userId;
  

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    userId = await getUserFieldNamed('id');
    context
        .read<CVBloc>()
        .add(CVReadAllInitiateEvent(conditions: {"userId": userId}));
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
                  onTap: (index){
                    Navigator.of(context)
                        .pushNamed(CVScreen.id, arguments: index);
                  },
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
                    conditions: {"userId": userId}));
              }
              return const Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}
