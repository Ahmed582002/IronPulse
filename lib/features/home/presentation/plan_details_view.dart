import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/features/home/cubit/plandetails_cubit.dart';
import 'package:iron_pulse/shared/widgets/components/plan_details_component.dart';

class PlanDetailsView extends StatelessWidget {
  const PlanDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plan Details')),
      body: BlocBuilder<PlandetailsCubit, PlandetailsState>(
        builder: (context, state) {
          if (state is Plandetailsloading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PlandetailsSuccess) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: PlanDetailsComponents(
                workoutPlanModel: state.workoutPlanModel,
              ),
            );
          } else if (state is PlandetailsError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
