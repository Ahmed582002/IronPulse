import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/features/home/cubit/p_lan_cubit.dart';
import 'package:iron_pulse/shared/widgets/home/cardPlan.dart';

class PlanHome extends StatelessWidget {
  PlanHome({super.key});
  final dio = Dio();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PLanCubit>();
    return BlocBuilder<PLanCubit, PLanState>(
      builder: (context, state) {
        if (state is PLanLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PLanSuccess) {
          return ListView.builder(
            itemCount: state.plan.length,
            itemBuilder: (context, ind) {
              return PlanCard(
                planModel: state.plan[ind],
                onCardTap: () {
                  cubit.navigateToDetailes(context, state.plan[ind].id);
                },
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
