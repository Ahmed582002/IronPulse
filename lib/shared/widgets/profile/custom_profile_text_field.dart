import 'package:flutter/material.dart';
import 'package:iron_pulse/core/constants/colors.dart';

class CustomProfileTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool readOnly;

  const CustomProfileTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hintText = '',
    this.icon = Icons.person_outline,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.displayMedium!.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 8),
          TextField(
            onChanged: (value) {
              controller.text = value;
            },
            controller: controller,
            readOnly: readOnly,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(
                context,
              ).textTheme.displayLarge!.copyWith(fontSize: 16),
              prefixIcon: Icon(icon, color: Colors.white70),
              filled: true,
              fillColor: AppColors.secondary,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
