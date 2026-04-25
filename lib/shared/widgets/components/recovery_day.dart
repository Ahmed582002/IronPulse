import 'package:flutter/material.dart';
import 'package:iron_pulse/core/constants/imgaes.dart';

class RecoveryDay extends StatelessWidget {
  const RecoveryDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff1E293B).withAlpha(40),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xff1E293B), width: 1),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Day 3",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 12,
                  color: Color(0xff64748B),
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Active Recovery",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 18,
                  color: Color(0xffF1F5F9),
                ),
              ),
            ],
          ),
          Spacer(),
          Image.asset(AppImages.recoveryIcon),
        ],
      ),
    );
  }
}
