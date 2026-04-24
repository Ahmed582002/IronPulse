part of 'plandetails_cubit.dart';

@immutable
sealed class PlandetailsState {}

final class PlandetailsInitial extends PlandetailsState {}

final class Plandetailsloading extends PlandetailsState {}

final class PlandetailsSuccess extends PlandetailsState {
  final List <WorkoutPlanModel> workoutPlanModel;

  PlandetailsSuccess({required this.workoutPlanModel});
}

final class PlandetailsError extends PlandetailsState {
  final String message;

  PlandetailsError({required this.message});
}
