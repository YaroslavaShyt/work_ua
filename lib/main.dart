import 'package:flutter/material.dart';
import 'package:work_ua/core/services/app_router.dart';
import 'package:work_ua/core/services/shared_pref_token.dart';
import 'package:work_ua/features/authorization/presentation/pages/start_screen.dart';
import 'package:work_ua/core/widgets/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool userExists = false;
  String accessToken = await getAccessToken();
  //print("token: $accessToken");
  if (accessToken.isNotEmpty) {
    userExists = true;
  }
  runApp(MainApp(
    userExists: userExists,
    appRouter: AppRouter(),
  ));
}

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
