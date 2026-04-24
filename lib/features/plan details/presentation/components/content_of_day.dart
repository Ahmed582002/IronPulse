import 'package:flutter/material.dart';
import 'package:iron_pulse/core/constants/colors.dart';
import 'package:iron_pulse/features/plan%20details/data/models/work_out_plan.dart';
import 'package:iron_pulse/features/plan%20details/presentation/components/show_more_icon.dart';

class ContentOfDay extends StatelessWidget {
  const ContentOfDay({
    super.key,
    required this.workoutPlanModel,
    required this.daysName,
    required this.showMore,
    required this.numday,
    this.onPressed,
  });

  final WorkoutPlanModel workoutPlanModel;
  final Map<int, String> daysName;
  final bool showMore;
  final int numday;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff1E293B).withAlpha(40),
        borderRadius: showMore ? BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ):BorderRadius.circular(12) ,
        border:showMore? Border(
          top: BorderSide(color: Color(0xff1E293B), width: 1),
          right: BorderSide(color: Color(0xff1E293B), width: 1),
          left: BorderSide(color: Color(0xff1E293B), width: 1),
        ) : Border.all(color: Color(0xff1E293B), width: 1),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Day ${numday.toString()}",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColors.primary,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "${daysName[numday]} Day : ${workoutPlanModel.steps[numday - 1].workoutName}",
                style: Theme.of(
                  context,
                ).textTheme.displayLarge!.copyWith(fontSize: 18),
              ),
            ],
          ),
          Spacer(),
          ShowMoreIcon(showMore: showMore, onPressed: onPressed),
        ],
      ),
    );
  }
}
