import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/core/constants/routes.dart';
import 'package:iron_pulse/features/home/data/home_repo.dart';
import 'package:iron_pulse/shared/models/plan_model.dart';
part 'p_lan_state.dart';

class PLanCubit extends Cubit<PLanState> {
  PLanCubit({required this.repo}) : super(PLanInitial());

  final HomeRepo repo;
  Future<void> getallPlan() async {
    emit(PLanLoading());

    final result = await repo.getPlans();

    result.fold(
      (error) {
        emit(PLanFaliure(messageError: error));
      },
      (plans) {
        emit(PLanSuccess(plan: plans));
      },
    );
  }

  void navigateToDetailes(BuildContext context, int planId) {
    Navigator.pushNamed(context, AppRoute.planDetails, arguments: planId);
  }
}
