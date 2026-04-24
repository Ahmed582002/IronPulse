import 'package:flutter/material.dart';
import 'package:iron_pulse/core/constants/colors.dart';

class ShowMoreIcon extends StatelessWidget {
  ShowMoreIcon({super.key, required this.showMore, required this.onPressed});

  bool showMore;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        showMore ? Icons.expand_more : Icons.arrow_forward_ios_outlined,
        color: AppColors.bodyText,
        size: 18,
      ),
    );
  }
}
