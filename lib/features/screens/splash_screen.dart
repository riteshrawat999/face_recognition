import 'package:face_recognition/routes/app_routes.dart';
import 'package:face_recognition/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAndToNamed(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xfff2f8fe),
              const Color(0xffeff7fe),
              const Color(0xffe4f3fe),
            ],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    alignment: Alignment.center,
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: const Color(0xfff7fbff),
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffc8d6e1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Lottie.asset(
                      'assets/animations/Face ID.json',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "Face Recognition",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: TAppTheme.textColorBlalck,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "PRECISION FACIAL ANALYSIS",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: TAppTheme.textColorBlalck,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Powered by',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: TAppTheme.textColorBlalck,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Lottie.asset(
                    'assets/animations/loading.json',
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 100,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  "VERSION 1.0.0 BETA",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: TAppTheme.textColorBlalck,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
