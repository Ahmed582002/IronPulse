import 'package:iron_pulse/core/api/api_consumer.dart';
import 'package:iron_pulse/core/api/end_ponits.dart';
import 'package:iron_pulse/shared/models/trainer_model.dart';

class Trainerrepo {
  final ApiConsumer api;

  Trainerrepo({required this.api});
  Future<List<TrainerModel>> getTrainers() async {
    final response = await api.get(EndPoint.trainers);

    final List trainers = response[ApiKey.trainers];

    return trainers.map((e) => TrainerModel.fromJson(e)).toList();
  }
}
