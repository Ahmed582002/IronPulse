import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/core/constants/colors.dart';
import 'package:iron_pulse/core/constants/imgaes.dart';
import 'package:iron_pulse/core/themes/responsive.dart';
import 'package:iron_pulse/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:iron_pulse/shared/widgets/custom_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "IronPulse",
            style: Theme.of(
              context,
            ).textTheme.displayLarge!.copyWith(fontSize: 20),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Center(
              child: SizedBox(
                height: context.hp(0.52),
                width: double.infinity,
                child: Image.asset(AppImages.onBoarding, fit: BoxFit.fill),
              ),
            ),
            Text(
              "Welcome to \nIronPulse",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.displayLarge!.copyWith(fontSize: 30),
            ),
            Spacer(),
            Text(
              "Fuel your progress, your journey to \nelite performance starts here",
              textAlign: TextAlign.center,

              style: Theme.of(
                context,
              ).textTheme.displayMedium!.copyWith(fontSize: 16, height: 1.5),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: CustomButton(
                text: "Get Started",
                onPressed: () {
                  cubit.skip(context);
                },
              ),
            ),
            Spacer(),
            Container(
              height: context.hp(0.004),
              width: context.wp(0.5),
              decoration: BoxDecoration(
                color: AppColors.bodyText,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
