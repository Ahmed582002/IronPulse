import 'package:flutter/material.dart';
import 'package:iron_pulse/shared/models/work_out_plan.dart';
import 'package:iron_pulse/shared/widgets/components/content_of_day.dart';
import 'package:iron_pulse/shared/widgets/components/exersice_day.dart';

class DayInfo extends StatefulWidget {
  const DayInfo({
    super.key,
    required this.workoutPlanModel,
    required this.numday,
  });

  final WorkoutPlanModel workoutPlanModel;
  final int numday;
  @override
  State<DayInfo> createState() => _DayInfoState();
}

class _DayInfoState extends State<DayInfo> {
  bool showMore = false;
  Map<int, String> daysName = {1: "Push", 2: "pull"};
  @override
  Widget build(BuildContext context) {
    if (showMore) {
      return Column(
        children: [
          ContentOfDay(
            numday: widget.numday,
            workoutPlanModel: widget.workoutPlanModel,
            daysName: daysName,
            showMore: showMore,
            onPressed: () {
              setState(() {
                showMore = !showMore;
              });
            },
          ),
          ExersiceDay(
            workoutPlanModel: widget.workoutPlanModel,
            numday: widget.numday,
          ),
        ],
      );
    } else {
      return ContentOfDay(
        numday: widget.numday,
        workoutPlanModel: widget.workoutPlanModel,
        daysName: daysName,
        showMore: showMore,
        onPressed: () {
          setState(() {
            showMore = !showMore;
          });
        },
      );
    }
  }
}
