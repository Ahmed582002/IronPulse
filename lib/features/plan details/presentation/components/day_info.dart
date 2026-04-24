import 'package:flutter/material.dart';
import 'package:iron_pulse/core/constants/colors.dart';
import 'package:iron_pulse/core/constants/imgaes.dart';
import 'package:iron_pulse/features/plan%20details/data/models/work_out_plan.dart';
import 'package:iron_pulse/features/plan%20details/presentation/components/content_of_day.dart';
import 'package:iron_pulse/features/plan%20details/presentation/components/exersice_day.dart';
import 'package:iron_pulse/features/plan%20details/presentation/components/show_more_icon.dart';

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

