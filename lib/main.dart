import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/services/router/app_router.dart';
import 'package:work_ua/core/services/shared_preferences/shared_pref_token.dart';
import 'package:work_ua/core/services/shared_preferences/shared_pref_user.dart';
import 'package:work_ua/features/candidate/profile/presentation/bloc/cv/cv_bloc.dart';
import 'package:work_ua/work_ua_app.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool userExists = false;

  String accessToken = await getAccessToken();
  //String userId = await getUserFieldNamed('id');
  String userType = await getUserFieldNamed('usertype');

  // print("token: $accessToken");Т
  // print(userId);
  // print(userType);
  
  if (accessToken.isNotEmpty) {
    userExists = true;
  }
  runApp(BlocProvider(
    create: (context) => CVBloc(),
    child: MainApp(
      usertype: userType,
      userExists: userExists,
      appRouter: AppRouter(),
    ),
  ));
}

