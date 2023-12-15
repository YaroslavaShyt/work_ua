import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:work_ua/core/widgets/home.dart';
import 'package:work_ua/features/authorization/presentation/pages/start_screen.dart';
import 'package:work_ua/features/notifications/chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:work_ua/features/notifications/chat/presentation/bloc/message_bloc/message_bloc.dart';
import 'package:work_ua/features/notifications/chat/presentation/pages/chat_screen.dart';
import 'package:work_ua/features/notifications/chat/presentation/provider/chat_notifier.dart';
import 'package:work_ua/features/profile/domain/cv_model.dart';
import 'package:work_ua/features/profile/presentation/pages/cv_screen.dart';
import 'package:work_ua/features/profile/presentation/pages/my_cvs_screen.dart';
import 'package:work_ua/features/search/data/job_model.dart';
import 'package:work_ua/features/search/presentation/bloc/search_bloc.dart';
import 'package:work_ua/features/search/presentation/pages/search_result.dart';
import 'package:work_ua/features/search/presentation/pages/vacancy_screen.dart';

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
        String chatId = routeSettings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                  child: BlocProvider(
                      create: (context) => MessageBloc(),
                      child: ChatScreen(
                        chatId: chatId,
                      )),
                  create: (context) => ChatNotifier(),
                ));
      case SearchResultPage.id:
        String searchData = routeSettings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SearchBloc(),
                  child: SearchResultPage(
                    searchData: searchData,
                  ),
                ));
      case VacancyScreen.id:
        JobModel model = routeSettings.arguments as JobModel;
        return MaterialPageRoute(
          builder: (_) => VacancyScreen(model: model),
        );
      default:
        return null;
    }
  }
}
