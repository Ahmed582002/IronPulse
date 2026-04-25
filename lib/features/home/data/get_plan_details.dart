import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iron_pulse/core/api/dio_consumer.dart';
import 'package:iron_pulse/core/api/end_ponits.dart';
import 'package:iron_pulse/core/errors/exceptions.dart';
import 'package:iron_pulse/shared/models/work_out_plan.dart';
import 'dart:convert';

class GetPlanDetailsRepo {
  Future<Either<String, WorkoutPlanModel>> getPlanDetails(int id) async {
    try {
      var result = await DioConsumer(dio: Dio()).get(EndPoint.plans);

      final data = result is String ? jsonDecode(result) : result;

      final list = (data as List)
          .map((e) => WorkoutPlanModel.fromJson(e))
          .toList();

      return Right(list.firstWhere((plan) => plan.id == id));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
