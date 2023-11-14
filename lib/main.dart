import 'package:flutter/material.dart';
import 'package:work_ua/features/authorization/presentation/pages/start_screen.dart';
import 'package:work_ua/core/widgets/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeScreen(), //StartScreen()
        );
  }
}
