import 'router_imports.dart';

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
        return MaterialPageRoute(builder: (_) => const CVScreen());
      case ChatScreen.id:
        String chatId = routeSettings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => MessageBloc(),
                    ),
                    BlocProvider(create: (context) => ChatBloc())
                  ],
                  child: ChatScreen(
                    chatId: chatId,
                  ),
                ),
                create: (context) => ChatNotifier()));
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
      case HomeScreenCompany.id:
        return MaterialPageRoute(builder: (_) => const HomeScreenCompany());
      case CompanySearchResultPage.id:
        String searchData = routeSettings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SearchBloc(),
                  child: CompanySearchResultPage(
                    searchData: searchData,
                  ),
                ));
      case CVScreenCompany.id:
        CVModel model = routeSettings.arguments as CVModel;
        return MaterialPageRoute(
            builder: (_) => CVScreenCompany(
                  model: model,
                ));
      default:
        return null;
    }
  }
}
