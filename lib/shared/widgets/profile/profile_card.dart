import 'package:flutter/material.dart';
import 'package:iron_pulse/core/constants/colors.dart';
import 'package:iron_pulse/core/themes/responsive.dart';

class ProfileCard extends StatelessWidget {
  final int hours;
  final String label;
  final IconData icon;

  const ProfileCard({
    super.key,
    required this.hours,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.wp(0.44),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blueAccent, size: 20),
              SizedBox(width: context.wp(0.02)),
              Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.displayMedium!.copyWith(fontSize: 15, height: 1.3),
              ),
            ],
          ),
          SizedBox(height: context.hp(0.015)),
          Text(
            hours.toString(),
            style: Theme.of(
              context,
            ).textTheme.displayLarge!.copyWith(fontSize: 26),
          ),
        ],
      ),
    );
  }
}
