import 'package:flutter/material.dart';

class NoCVs extends StatelessWidget {
  const NoCVs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('За вашим запитом не було знайдено резюме'),
    );
  }
}
