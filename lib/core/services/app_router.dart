import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/home.dart';
import 'package:work_ua/features/authorization/presentation/pages/start_screen.dart';
import 'package:work_ua/features/notifications/chat/presentation/pages/chat_screen.dart';
import 'package:work_ua/features/profile/domain/cv_model.dart';
import 'package:work_ua/features/profile/presentation/pages/cv_screen.dart';
import 'package:work_ua/features/profile/presentation/pages/my_cvs_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case StartScreen.id:
        return MaterialPageRoute(
          builder: (_) => const StartScreen(),
        );
      case HomeScreen.id:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case MyCVsScreen.id:
        return MaterialPageRoute(builder: (_) => const MyCVsScreen());
      case CVScreen.id:
        var model = routeSettings.arguments as CVModel;
        return MaterialPageRoute(builder: (_) => CVScreen(model: model));
      case ChatScreen.id:
        var data = routeSettings.arguments;
        return MaterialPageRoute(
            builder: (_) =>
                const ChatScreen(name: 'name', position: 'position'));
      default:
        return null;
    }
  }
}
