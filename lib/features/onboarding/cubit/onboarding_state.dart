abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingNavigate extends OnboardingState {
  final String route;
  OnboardingNavigate(this.route);
}
