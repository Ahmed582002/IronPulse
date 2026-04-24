import 'package:flutter/material.dart';
import 'package:iron_pulse/core/constants/colors.dart';
import 'package:iron_pulse/core/constants/imgaes.dart';
import 'package:iron_pulse/core/themes/responsive.dart';
import 'package:iron_pulse/features/plan%20details/data/models/work_out_plan.dart';
import 'package:iron_pulse/features/plan%20details/presentation/components/day_info.dart';
import 'package:iron_pulse/features/plan%20details/presentation/components/recovery_day.dart';
import 'package:iron_pulse/features/plan%20details/presentation/components/row_of_info.dart';

class PlanDetailsComponents extends StatelessWidget {
  const PlanDetailsComponents({super.key, required this.workoutPlanModel});

  final WorkoutPlanModel workoutPlanModel;

  @override
  Widget build(BuildContext context) {
   

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: context.hp(0.38),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(workoutPlanModel.image, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 24),
          RowOFInfo(workoutPlanModel: workoutPlanModel),
          const SizedBox(height: 8),
          Text(
            workoutPlanModel.name,
            style: Theme.of(
              context,
            ).textTheme.displayLarge!.copyWith(fontSize: 30),
          ),
          const SizedBox(height: 8),
          Text(
            workoutPlanModel.description,
            style: Theme.of(
              context,
            ).textTheme.displayMedium!.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _statItem(
                context,
                icon: Icons.timer_outlined,
                label: 'Duration',
                value: '60-90m',
              ),
              const SizedBox(width: 16),
              _statItem(
                context,
                icon: Icons.fitness_center,
                label: 'Frequency',
                value: '${workoutPlanModel.durationWeeks} Weeks',
              ),
              const SizedBox(width: 16),
              _statItem(
                context,
                icon: Icons.bolt_outlined,
                label: 'Intensity',
                value: workoutPlanModel.level,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Week 1: Foundations',
                style: Theme.of(
                  context,
                ).textTheme.displayLarge!.copyWith(fontSize: 20),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'View All Weeks',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.primary,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          

          ListView.builder(
           shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context , index){
              return Padding(
                padding: const EdgeInsets.only( top: 16.0),
                child: DayInfo(workoutPlanModel: workoutPlanModel , numday: index+1,),
              );
            }),

            //Recovery day
            RecoveryDay(),
           
    SizedBox(height: 27,),
           Container(
            padding: EdgeInsets.all( 16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.primary
            ),
            child: Center(
              child: Text("START WORKOUT" , style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16 , color: Colors.white),),
            ),
           )
         
         
      
        ],
      ),
    );
  }
}


Widget _statItem(
  BuildContext context, {
  required IconData icon,
  required String label,
  required String value,
}) {
  return Expanded(
    child: Container(
      height: 110,
      padding: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withAlpha(80),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF4A9EFF), size: 16),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.displayMedium!.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.displayLarge!.copyWith(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}


