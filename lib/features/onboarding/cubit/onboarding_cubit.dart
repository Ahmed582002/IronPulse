import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/core/services/cache_helper.dart';
import 'package:iron_pulse/features/onboarding/cubit/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  Future<void> skip(BuildContext context) async {
    await CacheHelper().saveData(key: "seenOnboarding", value: true);

    Navigator.pushReplacementNamed(context, "/login");
  }
}
