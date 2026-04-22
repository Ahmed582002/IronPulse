import 'package:flutter/material.dart';
import 'package:iron_pulse/core/constants/colors.dart';
import 'package:iron_pulse/core/themes/responsive.dart';
import 'package:iron_pulse/features/home/data/model/plan_model.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({super.key, required this.planModel});
  final PlanModel planModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          SizedBox(
            width: context.wp(0.3),
            height: context.hp(0.15),
            child: Image.network(planModel.image, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(context.wp(0.03)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.wp(0.02),
                          vertical: context.hp(0.005),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          planModel.level,
                          style: Theme.of(context).textTheme.displayMedium
                              ?.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.hp(0.005)),
                  Text(
                    planModel.name,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: context.hp(0.005)),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      planModel.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  SizedBox(height: context.hp(0.01)),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 18,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: context.wp(0.01)),
                      Text(
                        "60 min",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(width: context.wp(0.04)),
                      Icon(Icons.bolt, size: 18, color: AppColors.primary),
                      SizedBox(width: context.wp(0.01)),
                      Text(
                        "Energy",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
