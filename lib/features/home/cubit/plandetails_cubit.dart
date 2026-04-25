import 'package:bloc/bloc.dart';
import 'package:iron_pulse/features/home/data/get_plan_details.dart';
import 'package:iron_pulse/shared/models/work_out_plan.dart';
import 'package:meta/meta.dart';

part 'plandetails_state.dart';

class PlandetailsCubit extends Cubit<PlandetailsState> {
  PlandetailsCubit() : super(PlandetailsInitial());

  List<WorkoutPlanModel> workOutPlansModel = [];

  void getPlanDetails(int id) async {
    emit(Plandetailsloading());

    var result = await GetPlanDetailsRepo().getPlanDetails(id);

    result.fold(
      (l) => emit(PlandetailsError(message: l)),
      (r) => emit(PlandetailsSuccess(workoutPlanModel: r)),
    );
  }
}
