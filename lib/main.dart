import 'package:flutter/material.dart';
import 'package:iron_pulse/app_router.dart';
import 'package:iron_pulse/core/constants/routes.dart';
import 'package:iron_pulse/core/services/services.dart';
import 'package:iron_pulse/core/themes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IronPulse',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoute.profile,
    );
  }
}
