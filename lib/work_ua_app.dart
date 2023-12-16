import 'package:flutter/material.dart';
import 'package:work_ua/features/authorization/presentation/pages/start_screen.dart';
import 'package:work_ua/features/candidate/home.dart';
import 'package:work_ua/core/services/app_router.dart';
import 'package:work_ua/features/company/home_company.dart';

class MainApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool userExists;
  final String usertype;
  const MainApp(
      {super.key,
      required this.appRouter,
      required this.userExists,
      required this.usertype});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: appRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        home: userExists
            ? usertype == "company"
                ? const HomeScreenCompany()
                : const HomeScreen()
            : const StartScreen());
  }
}
