import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:gym_project/app/models/workouts.dart';





class ApiService {
  late String baseUrl = '';

  Future<List<WorkoutsModel>> fetchWorkouts() async {
    
    await dotenv.load(fileName: '.env');
    final url = dotenv.env['APIURL'];
    baseUrl = url ?? '';

    final response = await http.get(Uri.parse(baseUrl + 'Workout'));

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