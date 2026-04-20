import 'package:flutter/material.dart';
import 'package:iron_pulse/core/constants/colors.dart';

class ProfileButton extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback? onTap;
  final Color iconBackgroundColor;
  final Color iconColor;
  final Color textColor;

  const ProfileButton({
    super.key,
    required this.title,
    required this.leadingIcon,
    this.onTap,
    this.iconBackgroundColor = Colors.black,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: iconBackgroundColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(leadingIcon, color: iconColor, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),
          Divider(height: 1, thickness: 1, color: AppColors.secondary),
        ],
      ),
    );
  }
}
