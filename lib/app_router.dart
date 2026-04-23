import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/core/constants/routes.dart';
import 'package:iron_pulse/core/services/firebase_service.dart';
import 'package:iron_pulse/features/auth/cubit/login_cubit.dart';
import 'package:iron_pulse/features/auth/cubit/signup_cubit.dart';
import 'package:iron_pulse/features/auth/presentation/login_screen.dart';
import 'package:iron_pulse/features/auth/presentation/signup_screen.dart';
import 'package:iron_pulse/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:iron_pulse/features/onboarding/presentation/onboarding_screen.dart';
import 'package:iron_pulse/features/splash/cubit/splash_cubit.dart';
import 'package:iron_pulse/features/splash/presentation/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.splashScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => SplashCubit(),
            child: const SplashScreen(),
          ),
        );

      case AppRoute.onboarding:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => OnboardingCubit(),
            child: const OnBoardingScreen(),
          ),
        );

      case AppRoute.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => LoginCubit(FirebaseService()),
            child:  LoginScreen(),
          ),
        );


       case AppRoute.signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => SignupCubit(FirebaseService()),
            child:  signupScreen(),
          ),
        );





      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text("No route found"))),
        );
    }
  }
}
