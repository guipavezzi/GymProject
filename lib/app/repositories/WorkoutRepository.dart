import 'package:gym_project/app/api/api._service.dart';
import 'package:gym_project/app/models/workouts.dart';

class WorkoutRepository {
  final ApiService apiService;

  WorkoutRepository(this.apiService);

  Future<List<WorkoutsModel>> getWorkouts() async {
    try {
      return await apiService.fetchWorkouts();
    } catch (e) {
      throw Exception('Failed to load workouts');
    }
  }
}
