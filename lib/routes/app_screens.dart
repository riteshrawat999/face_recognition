import 'package:face_recognition/features/screens/home_screen.dart';
import 'package:face_recognition/features/screens/not_match_screen.dart';
import 'package:face_recognition/routes/app_routes.dart';
import 'package:get/get.dart';

import '../features/bindings/home_binding.dart';
import '../features/screens/match_screen.dart';
import '../features/screens/splash_screen.dart';

class AppScreens {
  AppScreens._();
  static const initial = AppRoutes.notMatch;
  static final screens = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(name: AppRoutes.match , page: () => MatchScreen()),
    GetPage(name: AppRoutes.notMatch , page: () => NotMatchScreen()),
  ];
}
