import 'package:iron_pulse/core/api/api_consumer.dart';
import 'package:iron_pulse/core/api/end_ponits.dart';
import 'package:iron_pulse/shared/models/plan_model.dart';
import 'package:iron_pulse/shared/models/trainer_model.dart';

class HomeRepo {
  final ApiConsumer api;

  HomeRepo({required this.api});

  Future<List<PlanModel>> getPlans() async {
    final response = await api.get(EndPoint.plans);

    return List<PlanModel>.from(response.map((e) => PlanModel.fromJson(e)));
  }

  Future<List<TrainerModel>> getTrainers() async {
    final response = await api.get(EndPoint.trainers);

    final List trainers = response[ApiKey.trainers];

    return trainers.map((e) => TrainerModel.fromJson(e)).toList();
  }
}
