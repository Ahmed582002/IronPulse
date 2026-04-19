import 'package:dartz/dartz.dart';
import 'package:iron_pulse/core/api/api_consumer.dart';
import 'package:iron_pulse/core/api/end_ponits.dart';
import 'package:iron_pulse/core/errors/exceptions.dart';
import 'package:iron_pulse/shared/models/plan_model.dart';
import 'package:iron_pulse/shared/models/trainer_model.dart';

class HomeRepo {
  final ApiConsumer api;

  HomeRepo({required this.api});

  Future<Either<String, List<PlanModel>>> getPlans() async {
    try {
      final response = await api.get(EndPoint.plans);

      final plans = (response as List)
          .map((e) => PlanModel.fromJson(e))
          .toList();

      return Right(plans);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<List<TrainerModel>> getTrainers() async {
    final response = await api.get(EndPoint.trainers);

    final List trainers = response[ApiKey.trainers];

    return trainers.map((e) => TrainerModel.fromJson(e)).toList();
  }
}
