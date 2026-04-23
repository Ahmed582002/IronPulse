import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/core/errors/exceptions.dart';
import 'package:iron_pulse/features/home/data/trainerRepo.dart';
import 'package:iron_pulse/shared/models/trainer_model.dart';
part 'trainer_state.dart';

class TrainerCubit extends Cubit<TrainerState> {
  TrainerCubit({required this.repo}) : super(TrainerInitial());
  final Trainerrepo repo;

  List<TrainerModel> _allTrainers = [];

  Future<void> getallTrainer() async {
    try {
      emit(TrainerLoading());
      _allTrainers = await repo.getTrainers();
      emit(TrainerSuccess(res: _allTrainers));
    } on ServerException catch (e) {
      emit(TrainerFauiler(errorMessage: e.errModel.errorMessage));
    }
  }

  void searchTrainers(String query) {
    if (state is TrainerSuccess || state is TrainerInitial) {
      if (query.isEmpty) {
        emit(TrainerSuccess(res: _allTrainers));
      } else {
        final filtered = _allTrainers
            .where((t) => t.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
        emit(TrainerSuccess(res: filtered));
      }
    }
  }
}
