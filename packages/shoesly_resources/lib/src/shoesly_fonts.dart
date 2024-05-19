import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoeslyFont {
  ShoeslyFont._();
  static const robotoMF = 'Urbanist';
  static final dartTextTheme = GoogleFonts.robotoTextTheme().copyWith(
    titleMedium: GoogleFonts.robotoTextTheme()
        .titleMedium!
        .copyWith(fontFamily: robotoMF, color: Color(0xffffffff)),
    titleSmall: GoogleFonts.robotoTextTheme()
        .titleSmall!
        .copyWith(fontFamily: robotoMF, color: Color(0xffffffff)),
    labelLarge: GoogleFonts.robotoTextTheme()
        .labelLarge!
        .copyWith(fontFamily: robotoMF, color: Color(0xffffffff)),
    labelMedium: GoogleFonts.robotoTextTheme()
        .labelMedium!
        .copyWith(fontFamily: robotoMF, color: Color(0xffffffff)),
    labelSmall: GoogleFonts.robotoTextTheme()
        .labelSmall!
        .copyWith(fontFamily: robotoMF, color: Color(0xffffffff)),
  );
  static final lightTextTheme = GoogleFonts.robotoTextTheme().copyWith(
    titleMedium: GoogleFonts.robotoTextTheme()
        .titleMedium!
        .copyWith(fontFamily: robotoMF, color: Color(0xff000000)),
    titleSmall: GoogleFonts.robotoTextTheme()
        .titleSmall!
        .copyWith(fontFamily: robotoMF, color: Color(0xff000000)),
    labelLarge: GoogleFonts.robotoTextTheme()
        .labelLarge!
        .copyWith(fontFamily: robotoMF, color: Color(0xff000000)),
    labelMedium: GoogleFonts.robotoTextTheme()
        .labelMedium!
        .copyWith(fontFamily: robotoMF, color: Color(0xff000000)),
    labelSmall: GoogleFonts.robotoTextTheme()
        .labelSmall!
        .copyWith(fontFamily: robotoMF, color: Color(0xff000000)),
  );
}
