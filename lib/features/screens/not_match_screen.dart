import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../model/result_model.dart';
class NotMatchScreen extends StatefulWidget {
  const NotMatchScreen({super.key});

  @override
  State<NotMatchScreen> createState() => _NotMatchScreenState();
}

class _NotMatchScreenState extends State<NotMatchScreen> {
  final ResultModel? argu = Get.arguments;
  late final File? imageOne = argu?.imageOne;
  late final File? imageTwo = argu?.imageTwo;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Result', style: Theme.of(context).textTheme.headlineSmall),
        leading: IconButton(
          onPressed: () {
            Get.offNamed('/home');
          },
          icon: Icon(Icons.arrow_back_ios, color: const Color(0xff06183b)),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
            colors: [const Color(0xfffeffff),const  Color(0xfffafefe), const Color(0xfffbfefe)],
          ),
        ),
        child: Column(
          children: [
            Text(
              'Not Match Found',
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
            // container which show match
            Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
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
                              color:const  Color(0xffffffff),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: Offset(0, -3),
                              blurStyle: BlurStyle.solid,
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(
                          'assets/images/cross.svg',
                          color: Colors.redAccent,
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
                          color: const Color(0xffffffff),
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
                          color: Colors.redAccent,
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
                        child: Icon(Icons.close, size: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
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
                'Low confidence match based on eye spacing, jawline curvature, and nasal structure measurements',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color:const  Color(0xff303652)),
              ),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                // to to home page
                Get.offNamed('/home');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff2b59ff),
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
