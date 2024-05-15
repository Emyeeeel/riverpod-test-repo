
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
class AppStyle{

  static const colorRed = Color(0xFFE70125);
  static const colorWhite = Color(0xFFFFFFFF);
  static const isActive = Color(0xFF121212);
  static const isInactive = Color(0xFFEFEFEF);

  static const TextStyle bottomNavBarText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle landingHeader = TextStyle(
    fontFamily: 'Inter',
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle landingSignUpButton = TextStyle(
    fontFamily: 'Inter',
    color: colorWhite,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle landingLogInButton = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle detailsTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle detailsSubtitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
}