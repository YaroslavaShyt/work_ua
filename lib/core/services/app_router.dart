import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/home.dart';
import 'package:work_ua/features/authorization/presentation/pages/start_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case StartScreen.id:
        return MaterialPageRoute(
          builder: (_) => const StartScreen(),
        );
      case HomeScreen.id:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}
