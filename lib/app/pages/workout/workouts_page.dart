import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gym_project/app/api/api._service.dart';
import 'package:gym_project/app/models/workouts.dart';
import 'package:gym_project/app/repositories/WorkoutRepository.dart';

class WorkOuts extends StatefulWidget {
  const WorkOuts({Key? key}) : super(key: key);

  @override
  State<WorkOuts> createState() => _WorkOutsState();
}

class _WorkOutsState extends State<WorkOuts> {

  final WorkoutRepository repository = WorkoutRepository(ApiService());
  List<WorkoutsModel>? workoutData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var data = await repository.getWorkouts();
      setState(() {
        workoutData = data.cast<WorkoutsModel>();
      });
    } catch (e) {
      print('Erro ao buscar os dados: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Center(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: constraints.maxWidth * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          child: Text(
                            'Treinos',
                            style: TextStyle(
                                fontSize: constraints.maxWidth * 0.08,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                        ),
                        Image.asset('assets/images/halter.png',
                        width: constraints.maxWidth * 0.12,)
                      ],
                    )),
                Expanded(
                  child: ListView.builder(
                    itemCount: workoutData?.length ?? 0,
                    itemBuilder: (context, index) {
                      WorkoutsModel treino = workoutData![index];
                      return FutureBuilder(
                        future: FirebaseStorage.instance
                            .refFromURL(treino.imageUrl!)
                            .getDownloadURL(),
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          if (snapshot.hasData) {
                            String imageURL = snapshot.data!;
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(0, 0, 0, 0.2),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              margin:
                                  EdgeInsets.all(constraints.maxWidth * 0.03),
                              padding:
                                  EdgeInsets.all(constraints.maxWidth * 0.03),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Image.network(
                                      imageURL,
                                      width: constraints.maxWidth * 0.25,
                                      height: constraints.maxHeight * 0.1,
                                    ),
                                    Text(
                                      'Treino de ' + treino.workoutName!,
                                      style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.05,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                  child: Container(
                                                    color: Colors.transparent,
                                                  ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
