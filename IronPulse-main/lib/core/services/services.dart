import 'package:firebase_core/firebase_core.dart';
import 'package:iron_pulse/core/services/cache_helper.dart';
import 'package:iron_pulse/firebase_options.dart';

Future<void> initialServices() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheHelper().init();
}
