import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
class TAppTheme{
  TAppTheme._();
  static  const  backgroundColor = Color(0xffe7f2f1);
  static const textColor = Color(0xff303837);
  static const buttonColor = Color(0xff07a997);
  static const iconColor = Color(0xffb1bbba);
  static const textColorBlalck = Color(0xff19212f);

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    brightness: Brightness.light,
    primaryColor: backgroundColor,
    useMaterial3: true,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        color: textColor,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        color: textColor,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12,
        color: textColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        color: textColor,
      ),
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: backgroundColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData()
  );
}