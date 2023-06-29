class WorkoutsModel {
  int? id;
  String? workoutName;
  String? imageUrl;

  WorkoutsModel(this.id, this.workoutName, this.imageUrl);

  WorkoutsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    workoutName = json['workoutName'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['workoutName'] = this.workoutName;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}