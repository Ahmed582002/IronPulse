import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/core/constants/routes.dart';
import 'package:iron_pulse/core/services/cache_helper.dart';
import 'package:iron_pulse/features/splash/cubit/splash_state.dart';
import 'dart:async';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()) {
    startLoading();
  }

  Timer? _timer;

  void startLoading() {
    const duration = 3;
    const fps = 60;
    final totalTicks = duration * fps;
    int currentTick = 0;

    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      currentTick++;

      double progress = currentTick / totalTicks;
      emit(SplashLoading(progress.clamp(0, 1)));

      if (currentTick >= totalTicks) {
        timer.cancel();
        _navigate();
      }
    });
  }

  void _navigate() {
    final seenOnboarding =
        CacheHelper().getData(key: "seenOnboarding") ?? false;

    if (seenOnboarding) {
      emit(SplashNavigate(AppRoute.login));
    } else {
      emit(SplashNavigate(AppRoute.onboarding));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
