part of 'p_lan_cubit.dart';

sealed class PLanState {}

final class PLanInitial extends PLanState {}

final class PLanLoading extends PLanState {}

final class PLanSuccess extends PLanState {
  final List<PlanModel> plan;

  PLanSuccess({required this.plan});
}

final class PLanFaliure extends PLanState {
  final String messageError;

  PLanFaliure({required this.messageError});
}
