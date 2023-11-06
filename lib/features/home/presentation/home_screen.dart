import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/core/widgets/start_screen_headers.dart';
import 'package:work_ua/features/home/widgets/search_form/search_form.dart';

class HomeScreen extends StatelessWidget {
  static const id = "home_screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: blueColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [StartScreenHeaders(), SearchForm()],
        ),
      ),
    );
  }
}
