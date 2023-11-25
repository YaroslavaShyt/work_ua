import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/features/notifications/pages/notifications_screen.dart';
import 'package:work_ua/features/profile/presentation/pages/profile_screen.dart';
import 'package:work_ua/features/saved/pages/saved_screen.dart';
import 'package:work_ua/features/search/presentation/pages/search_screen.dart';
import 'package:work_ua/features/recommended/pages/recommended_screen.dart';

class HomeScreen extends StatefulWidget {
  static const id = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    SearchScreen(),
    RecommendedScreen(),
    SavedScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ));
  }
}
