import 'dart:ui';

import 'package:flutter/material.dart';

class Excercises extends StatefulWidget {
  const Excercises({Key? key}) : super(key: key);

  @override
  State<Excercises> createState() => _ExcercisesState();
}

class _ExcercisesState extends State<Excercises> {
  @override
  void initState() {
    super.initState();
  }

  String textoExplicativo =
      'Você pode adicionar até 10 exercícios no aplicativo';

  List<String> excercises = [
    "Extensora",
    "Agachamento Livre",
    "LegPress",
    "Extensora",
    "Agachamento Livre",
    "LegPress",
    "Extensora",
    "Agachamento Livre",
    "LegPress",
    "Extensora",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Container(
              margin: EdgeInsets.only(top: constraints.maxWidth * 0.05),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Treino de perna',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: constraints.maxWidth * 0.08,
                          ),
                        ),
                        Image.asset(
                          'assets/images/perna.png',
                          width: constraints.maxWidth * 0.25,
                        ),
                      ],
                    ),
                    Text(
                      textoExplicativo,
                      style: TextStyle(
                        fontSize: constraints.maxWidth * 0.04,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: excercises.length,
                        itemBuilder: (context, index) {
                          String exercise = excercises[index];
                          return ListTile(
                            title: Text(
                              exercise,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: constraints.maxWidth * 0.039,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: constraints.maxWidth * 0.03),
                      child: FloatingActionButton(onPressed: (){},
                      child: Icon(Icons.add),
                      mini: true,
                      ),
                    )
                  ],
                ),
                
              ),
            ),
          );
        },
      ),
    );
  }
}
