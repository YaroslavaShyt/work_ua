import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/provider/chat_notifier.dart';
import 'package:work_ua/features/candidate/profile/presentation/bloc/user/user_bloc.dart';
import 'package:work_ua/features/candidate/search/presentation/bloc/search_bloc.dart';
import 'package:provider/provider.dart';
import 'package:work_ua/features/company/notifications/presentation/pages/company_notifications_screen.dart';
import 'package:work_ua/features/company/profile/presentation/pages/company_profile_screen.dart';
import 'package:work_ua/features/company/search/company_search_screen.dart';

class HomeScreenCompany extends StatefulWidget {
  static const id = "home_screen";

  const HomeScreenCompany({super.key});

  @override
  State<HomeScreenCompany> createState() => _HomeScreenCompanyState();
}

class _HomeScreenCompanyState extends State<HomeScreenCompany> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const CompanySearchScreen(),
    ChangeNotifierProvider(
      child: const CompanyNotificationsScreen(),
      create: (context) => ChatNotifier(),
    ),
    const CompanyProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (context) => UserBloc()),
        BlocProvider<ChatBloc>(create: (context) => ChatBloc()),
        BlocProvider<SearchBloc>(create: (context) => SearchBloc()),
      ],
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: blueColor,
          body: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Пошук',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.thumb_up_alt_outlined),
                label: 'Рекомендовані',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined),
                label: 'Збережені',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: 'Сповіщення',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_pin),
                label: 'Профіль',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: crimsonColor,
            unselectedItemColor: darkGrayColor,
            onTap: _onItemTapped,
          )),
    );
  }
}
