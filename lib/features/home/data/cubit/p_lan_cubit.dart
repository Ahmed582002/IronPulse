import 'package:bloc/bloc.dart';
import 'package:iron_pulse/features/home/data/home_repo.dart';
import 'package:iron_pulse/features/home/data/model/plan_model.dart';
import 'package:meta/meta.dart';

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
}
