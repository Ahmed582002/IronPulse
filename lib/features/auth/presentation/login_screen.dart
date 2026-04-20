import 'package:flutter/material.dart';
import 'package:iron_pulse/core/constants/routes.dart';
import 'package:iron_pulse/shared/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: CustomButton(
            text: "Go",
            onPressed: () {
              // cubit.skip(context);
              Navigator.pushNamed(
                context,
                AppRoute.planDetails,
                arguments: {"id": 1},
              );
            },
          ),
        ),
      ),
    );
  }
}
