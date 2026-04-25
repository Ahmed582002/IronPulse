

class WorkOutStepsModel {
  final int week;
  final int day;
  final String workoutName;
  final String reps;
  final int duration;

  WorkOutStepsModel({
    required this.week,
    required this.day,
    required this.workoutName,
    required this.reps,
    required this.duration,
  });

  factory WorkOutStepsModel.fromjson(Map <String , dynamic> jsondata){
    return WorkOutStepsModel(
      week: jsondata['week'],
      day: jsondata['day'],
      workoutName: jsondata['workoutName'],
      reps: jsondata['reps'],
      duration: jsondata['duration'],
    );
  }
}
