import 'package:flutter/material.dart';

class NoVacancies extends StatelessWidget {
  const NoVacancies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('За вашим запитом не було знайдено вакансій'),
    );
  }
}
