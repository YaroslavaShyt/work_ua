import 'package:flutter/material.dart';

class NoVacancies extends StatelessWidget {
  const NoVacancies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('За вашим запитом не було знайдено вакансій'),
        OutlinedButton(onPressed: (){
          
        }, child: child)
      ],
    );
  }
}