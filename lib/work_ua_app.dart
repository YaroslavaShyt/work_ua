import 'package:flutter/material.dart';
import 'package:work_ua/features/authorization/presentation/pages/start_screen.dart';
import 'package:work_ua/core/widgets/home.dart';
import 'package:work_ua/core/services/app_router.dart';

class MainApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool userExists;
  const MainApp({super.key, required this.appRouter, required this.userExists});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: appRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        home: userExists ? const HomeScreen() : const StartScreen());
  }
}
