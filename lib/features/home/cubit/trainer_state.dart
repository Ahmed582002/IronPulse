part of 'trainer_cubit.dart';

sealed class TrainerState {}

final class TrainerInitial extends TrainerState {}

final class TrainerLoading extends TrainerState {}

final class TrainerSuccess extends TrainerState {
  final List<TrainerModel> res;

  TrainerSuccess({required this.res});
}

final class TrainerFauiler extends TrainerState {
  final String errorMessage;

  TrainerFauiler({required this.errorMessage});
}
