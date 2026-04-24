import 'package:bloc/bloc.dart';
import 'package:iron_pulse/features/plan%20details/data/models/work_out_plan.dart';
import 'package:iron_pulse/features/plan%20details/data/repo/get_plan_details.dart';
import 'package:meta/meta.dart';

part 'plandetails_state.dart';

class PlandetailsCubit extends Cubit<PlandetailsState> {
  PlandetailsCubit() : super(PlandetailsInitial());

  List<WorkoutPlanModel> workOutPlansModel = [];

  void getPlanDetails() async {
    emit(Plandetailsloading());
    var result = await GetPlanDetailsRepo().getPlanDetails();

    result.fold(
      (l) {
        emit(PlandetailsError(message: l));
      },
      (r) {
        workOutPlansModel = r;
        emit(PlandetailsSuccess(workoutPlanModel: r));
      },
    );
  }
}
