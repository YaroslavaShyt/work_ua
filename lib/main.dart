import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/services/app_router.dart';
import 'package:work_ua/core/services/shared_pref_token.dart';
import 'package:work_ua/core/services/shared_pref_user.dart';
import 'package:work_ua/features/candidate/profile/presentation/bloc/cv/cv_bloc.dart';
import 'package:work_ua/work_ua_app.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool userExists = false;
  String accessToken = await getAccessToken();
  //print("token: $accessToken");
  String userId = await getUserFieldNamed('id');
  print(userId);
  if (accessToken.isNotEmpty) {
    userExists = true;
  }
  runApp(BlocProvider(
    create: (context) => CVBloc(),
    child: MainApp(
      userExists: userExists,
      appRouter: AppRouter(),
    ),
  ));
}

