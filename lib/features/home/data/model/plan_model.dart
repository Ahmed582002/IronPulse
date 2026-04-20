import '../../../../shared/models/step_model.dart';

class PlanModel {
  final int id;
  final String name;
  final String description;
  final String level;
  final int durationWeeks;
  final String image;
  final List<StepModel> steps;

  PlanModel({
    required this.id,
    required this.name,
    required this.description,
    required this.level,
    required this.durationWeeks,
    required this.image,
    required this.steps,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      level: json['level'],
      durationWeeks: json['durationWeeks'],
      image: json['image'],
      steps: List<StepModel>.from(
        json['steps'].map((e) => StepModel.fromJson(e)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "level": level,
      "durationWeeks": durationWeeks,
      "image": image,
      "steps": steps.map((e) => e.toJson()).toList(),
    };
  }
}
