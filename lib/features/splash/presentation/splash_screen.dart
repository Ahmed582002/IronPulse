import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/core/constants/colors.dart';
import 'package:iron_pulse/core/themes/responsive.dart';
import 'package:iron_pulse/features/splash/cubit/splash_cubit.dart';
import 'package:iron_pulse/features/splash/cubit/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigate) {
            Navigator.pushReplacementNamed(context, state.route);
          }
        },
        child: Column(
          children: [
            SizedBox(height: context.hp(0.05)),
            Image.asset("assets/images/splash.png", height: context.hp(0.58)),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                height: context.hp(0.18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "IRON",
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge!.copyWith(fontSize: 40),
                ),
                Text(
                  "PULSE",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColors.primary,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.hp(0.01)),
            Container(
              height: context.hp(0.004),
              width: context.wp(0.15),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(height: context.hp(0.01)),
            Text(
              "Feel the Energy",
              style: Theme.of(
                context,
              ).textTheme.displayMedium!.copyWith(fontSize: 15),
            ),
            SizedBox(height: context.hp(0.03)),
            BlocBuilder<SplashCubit, SplashState>(
              builder: (context, state) {
                double progress = 0;

                if (state is SplashLoading) {
                  progress = state.progress;
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: context.hp(0.007),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation(AppColors.primary),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
