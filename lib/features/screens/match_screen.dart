import 'dart:io';

import 'package:face_recognition/features/model/result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  ResultModel? argu = Get.arguments;
  late final File? imageOne = argu?.imageOne;
  late final File? imageTwo = argu?.imageTwo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Result', style: Theme.of(context).textTheme.headlineSmall),
        leading: IconButton(
          onPressed: () {
            Get.offNamed('/home');
          },
          icon: Icon(Icons.arrow_back_ios, color:const Color(0xff06183b)),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
            colors: [const Color(0xfffeffff),const Color(0xfffafefe),const Color(0xfffbfefe)],
          ),
        ),
        child: Column(
          children: [
            Text(
              'Match Found',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Analyzed facial geometry',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: const Color(0xff7b899e)),
            ),
            const SizedBox(height: 30,),
            // container which show match
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffe9f0ef).withOpacity(0.3),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Card(
                      elevation: 10,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(100),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xffe6fbf9),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xffffffff),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: Offset(3, 0),
                              blurStyle: BlurStyle.solid,
                            ),
                            BoxShadow(
                              color:const  Color(0xffffffff),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: Offset(-3, 0),
                              blurStyle: BlurStyle.solid,
                            ),
                            BoxShadow(
                              color: const Color(0xffffffff),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                              blurStyle: BlurStyle.solid,
                            ),
                            BoxShadow(
                              color: const Color(0xffffffff),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: Offset(0, -3),
                              blurStyle: BlurStyle.solid,
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(
                          'assets/images/verified.svg',
                          color: const Color(0xff00d1c1),
                          width: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -18,
                      left: 60,
                      child: Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          color:const  Color(0xffffffff),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xffffffff),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: Offset(3, 0),
                              blurStyle: BlurStyle.solid,
                            ),
                            BoxShadow(
                              color: const Color(0xffffffff),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: Offset(-3, 0),
                              blurStyle: BlurStyle.solid,
                            ),
                            BoxShadow(
                              color: const Color(0xffffffff),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                              blurStyle: BlurStyle.solid,
                            ),
                            BoxShadow(
                              color: const Color(0xffffffff),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: Offset(0, -3),
                              blurStyle: BlurStyle.solid,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundImage: FileImage(
                                imageOne ?? File('')
                              ),
                            ),
                            CircleAvatar(
                              backgroundImage: FileImage(
                                imageTwo ?? File('')
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      left: 95,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: const Color(0xff00d1c1),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 0),
                              blurStyle: BlurStyle.solid,
                            ),
                          ],
                        ),
                        child: Icon(Icons.check, size: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: Lottie.asset(
                'assets/animations/celebration.json',
                repeat: true,
                animate: true,
                fit: BoxFit.cover,
                reverse: true,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black12.withAlpha(4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                textAlign: TextAlign.center,
                'High confidence match based on eye spacing, jawline curvature, and nasal structure measurements',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Color(0xff303652)),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // to to home page
                Get.offNamed('/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff2b59ff),
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                )
              ),
              child: Text(
                'New Comparison',
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
