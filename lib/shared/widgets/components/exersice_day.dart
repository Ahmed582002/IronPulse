import 'package:flutter/material.dart';
import 'package:iron_pulse/core/constants/imgaes.dart';
import 'package:iron_pulse/shared/models/work_out_plan.dart';

class ExersiceDay extends StatelessWidget {
  const ExersiceDay({
    super.key,
    required this.workoutPlanModel,
    required this.numday,
  });

  final WorkoutPlanModel workoutPlanModel;
  final int numday;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        border: Border(bottom: BorderSide(color: Color(0xff1E293B), width: 1)),
        color: Color(0xff1E293B).withAlpha(80),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(AppImages.exersiceDAy, width: 40, height: 40),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workoutPlanModel.steps[numday - 1].workoutName,
                    style: Theme.of(
                      context,
                    ).textTheme.displayLarge!.copyWith(fontSize: 18),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "sets*reps : ${workoutPlanModel.steps[numday - 1].reps}",
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium!.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
