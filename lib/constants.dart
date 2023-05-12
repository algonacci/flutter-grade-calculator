import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const mainColor = Colors.deepPurple;
  static const String title = 'Calculate Average';
  static final TextStyle textStyle = GoogleFonts.lato(
    fontSize: 20,
    color: mainColor,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle lessonStyle = GoogleFonts.lato(
    fontSize: 14,
    color: mainColor,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle averageStyle = GoogleFonts.lato(
    fontSize: 30,
    color: mainColor,
    fontWeight: FontWeight.w700,
  );
}
