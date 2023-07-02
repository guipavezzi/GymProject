import 'package:flutter/material.dart';
import 'package:gym_project/app/pages/excercise/excercise_page.dart';
import 'package:gym_project/app/pages/workout/workouts_page.dart';

class AppGym extends StatelessWidget {
  const AppGym({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Me Adote',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Excercises(),
        '/excercises':(context) =>  Excercises()
      },
    );
  }
}