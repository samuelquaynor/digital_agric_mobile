import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Define theme data for light
ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    iconTheme: IconThemeData(color: Colors.green.shade900),
    primaryTextTheme: GoogleFonts.poppinsTextTheme(),
    bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.green.shade900),
      titleMedium: TextStyle(color: Colors.green.shade900, fontWeight: FontWeight.w500),
      headlineSmall:
          TextStyle(color: Colors.green.shade900, fontWeight: FontWeight.w600),
    ),
    dialogTheme: DialogTheme(
        elevation: 16,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    primaryColor: Colors.green,
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.green, accentColor: Colors.green),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      actionsIconTheme: IconThemeData(color: Colors.green.shade900),
    ),
    cardTheme: const CardTheme(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 15),
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)))),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)))),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)))),
    chipTheme: ChipThemeData.fromDefaults(
        secondaryColor: Colors.green,
        labelStyle: const TextStyle(),
        brightness: Brightness.light));
