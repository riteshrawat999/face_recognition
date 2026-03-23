import 'package:face_recognition/routes/app_routes.dart';
import 'package:face_recognition/routes/app_screens.dart';
import 'package:face_recognition/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Face recognition',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      // darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.splash,
      getPages: AppScreens.screens,
    );
  }
}
