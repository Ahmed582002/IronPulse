import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'plandetails_state.dart';

class PlandetailsCubit extends Cubit<PlandetailsState> {
  PlandetailsCubit() : super(PlandetailsInitial());
}
