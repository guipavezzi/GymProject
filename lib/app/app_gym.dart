import 'package:flutter/material.dart';
import 'package:gym_project/app/pages/workouts.dart';

class AppGym extends StatelessWidget {
  const AppGym({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Me Adote',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => WorkOuts()
      },
    );
  }
}