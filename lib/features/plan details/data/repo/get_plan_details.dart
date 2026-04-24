import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iron_pulse/core/api/api_consumer.dart';
import 'package:iron_pulse/core/api/dio_consumer.dart';
import 'package:iron_pulse/core/api/end_ponits.dart';
import 'package:iron_pulse/core/errors/exceptions.dart';
import 'package:iron_pulse/features/plan%20details/data/models/work_out_plan.dart';

class GetPlanDetailsRepo {
  Future<Either<String, List<WorkoutPlanModel>>> getPlanDetails() async {
    try {
      var result = await DioConsumer(dio: Dio()).get(EndPoint.plans);
      return Right(
        (result as List).map((e) {
          return WorkoutPlanModel.fromJson(e);
        }).toList(),
      );
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
