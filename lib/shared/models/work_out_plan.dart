import 'package:iron_pulse/shared/models/work_out_steps_model.dart';

class WorkoutPlanModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final String level;
  final int durationWeeks;
  final List<WorkOutStepsModel> steps;

  const WorkoutPlanModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.level,
    required this.durationWeeks,
    required this.steps,
  });

  factory WorkoutPlanModel.fromJson(Map<String, dynamic> json) {
    return WorkoutPlanModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      level: json['level'],
      durationWeeks: json['durationWeeks'],
      steps: (json['steps'] as List)
          .map((e) => WorkOutStepsModel.fromjson(e))
          .toList(),
    );
  }
}
