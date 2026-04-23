class StepModel {
  final int week;
  final int day;
  final String workoutName;
  final int duration;
  final String reps;

  StepModel({
    required this.week,
    required this.day,
    required this.workoutName,
    required this.duration,
    required this.reps,
  });

  factory StepModel.fromJson(Map<String, dynamic> json) {
    return StepModel(
      week: json['week'],
      day: json['day'],
      workoutName: json['workoutName'],
      duration: json['duration'],
      reps: json['reps'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "week": week,
      "day": day,
      "workoutName": workoutName,
      "duration": duration,
      "reps": reps,
    };
  }
}
