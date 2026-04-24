import 'package:flutter/material.dart';
import 'package:iron_pulse/core/constants/colors.dart';
import 'package:iron_pulse/features/plan%20details/data/models/work_out_plan.dart';

class RowOFInfo extends StatelessWidget {
  const RowOFInfo({super.key, required this.workoutPlanModel});

  final WorkoutPlanModel workoutPlanModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _badge(
          workoutPlanModel.level,
          context,
          background: AppColors.primary,
          textColor: AppColors.headText,
        ),
        const SizedBox(width: 8),
        _badge(
          ' ${workoutPlanModel.durationWeeks} weeks',
          context,
          background: AppColors.secondary,
          textColor: AppColors.headText,
          border: Border.all(color: const Color(0xFF2A2D3A)),
        ),
      ],
    );
  }
}

Widget _badge(
  String text,
  BuildContext context, {
  required Color background,
  required Color textColor,
  Border? border,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
    decoration: BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(6),
      border: border,
    ),
    child: Text(
      text,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 15),
    ),
  );
}


