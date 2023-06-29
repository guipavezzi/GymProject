import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:gym_project/app/models/workouts.dart';

class ApiService {
  //Trocar a baseUrl pelo IP da máquina se tiver usando emulador ou o celular pessoal
  final String baseUrl = 'https://{ipMaquina}:7280/Workout';

  Future<List<WorkoutsModel>> fetchWorkouts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      final List<WorkoutsModel> workouts = [];

      for (var json in jsonList) {
        workouts.add(WorkoutsModel.fromJson(json));
      }

      return workouts;
    } else {
      throw Exception('Failed to load workouts');
    }
  }
}