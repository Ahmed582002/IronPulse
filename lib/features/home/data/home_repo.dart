import 'package:dartz/dartz.dart';
import 'package:iron_pulse/core/api/api_consumer.dart';
import 'package:iron_pulse/core/api/end_ponits.dart';
import 'package:iron_pulse/core/errors/exceptions.dart';
import 'package:iron_pulse/features/home/data/model/plan_model.dart';


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

  
}
