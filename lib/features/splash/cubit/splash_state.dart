abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {
  final double progress;
  SplashLoading(this.progress);
}

class SplashNavigate extends SplashState {
  final String route;
  SplashNavigate(this.route);
}
