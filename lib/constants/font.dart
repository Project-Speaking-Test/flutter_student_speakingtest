import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var projectTextTheme = TextTheme(
  headline1: GoogleFonts.openSans(
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 21,
      color: Colors.white,
      letterSpacing: 3
    )
  ),
  headline2: GoogleFonts.openSans(
    textStyle: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: Colors.black
    )
  ),
  headline3: GoogleFonts.openSans(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 15,
      color: Colors.black
    )
  ),
  headline4: GoogleFonts.openSans(
    textStyle: const TextStyle(
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.bold
    ),
  ),
  headline5: GoogleFonts.openSans(
    textStyle: const TextStyle(
      fontSize: 15,
      color: Colors.black,
      fontWeight: FontWeight.normal
    ),
  ),
);