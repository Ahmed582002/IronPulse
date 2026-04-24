import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/core/constants/colors.dart';
import 'package:iron_pulse/core/constants/imgaes.dart';
import 'package:iron_pulse/core/themes/responsive.dart';
import 'package:iron_pulse/features/plan%20details/data/models/work_out_plan.dart';
import 'package:iron_pulse/features/plan%20details/data/models/work_out_steps_model.dart';
import 'package:iron_pulse/features/plan%20details/presentation/components/day_info.dart';
import 'package:iron_pulse/features/plan%20details/presentation/components/plan_details_component.dart';
import 'package:iron_pulse/features/plan%20details/presentation/components/row_of_info.dart';
import 'package:iron_pulse/features/plan%20details/presentation/cubit/plandetails_cubit.dart';

class PlanDetailsView extends StatelessWidget {
  const PlanDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Plan Details',
          style: Theme.of(
            context,
          ).textTheme.displayLarge!.copyWith(fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset(AppImages.favAppBar),
          ),
        ],
      ),
      body: BlocBuilder<PlandetailsCubit, PlandetailsState>(
        builder: (context, state) {
          if (state is Plandetailsloading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PlandetailsError) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            );
          } else if (state is PlandetailsSuccess) {
            final workoutPlanModel = state.workoutPlanModel[0];
            return Padding(
              padding: const EdgeInsets.all(16),
              child: PlanDetailsComponents(workoutPlanModel: workoutPlanModel),
            );
          } else {
            return const Center(child: Text('Not Found'));
          }
        },
      ),
    );
  }
}









