import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/services/app_router.dart';
import 'package:work_ua/core/services/shared_pref_token.dart';
import 'package:work_ua/features/profile/presentation/bloc/cv_bloc.dart';
import 'package:work_ua/work_ua_app.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool userExists = false;
  String accessToken = await getAccessToken();
  //print("token: $accessToken");
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

