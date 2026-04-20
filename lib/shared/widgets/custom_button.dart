import 'package:flutter/material.dart';
import 'package:iron_pulse/core/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;
  final Color textColor;
  final double fontSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.primary,
    this.textColor = Colors.white,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 6,
          shadowColor: color,
          padding: EdgeInsets.zero,
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
