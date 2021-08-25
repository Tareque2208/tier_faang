import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'WorkSans';

  // static const TextTheme textTheme = TextTheme(
  //   headline4: display1,
  //   headline5: headline,
  //   headline6: title,
  //   subtitle2: subtitle,
  //   bodyText2: body2,
  //   bodyText1: body1,
  //   caption: caption,
  // );

  static TextTheme textTheme = TextTheme(
    headline3: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: 30,
        letterSpacing: 0.42,
        height: 0.9,
        color: darkerText),
    headline4: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 27,
        letterSpacing: 0.42,
        height: 0.9,
        color: darkerText),
    headline5: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 24,
        height: 0.9,
        letterSpacing: 0.3,
        color: darkerText),
    headline6: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 21,
        height: 0.9,
        letterSpacing: 0.2,
        color: darkerText),
    subtitle2: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        letterSpacing: 0.3,
        height: 0.9,
        color: darkText),
    bodyText1: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        letterSpacing: -0.05,
        height: 0.9,
        color: darkText),
    //Big Button Text
    bodyText2: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        letterSpacing: 0.2,
        height: 0.9,
        color: Colors.white),
    //Small Button Text
    button: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 15,
        letterSpacing: -0.05,
        height: 0.9,
        color: Colors.white),
    caption: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        letterSpacing: 0.2,
        height: 0.9,
        color: lightText),
  );

  // static const TextStyle display1 = TextStyle(
  //   // h4 -> display1
  //   fontFamily: fontName,
  //   fontWeight: FontWeight.bold,
  //   fontSize: 36,
  //   letterSpacing: 0.4,
  //   height: 0.9,
  //   color: darkerText,
  // );

  // static const TextStyle headline = TextStyle(
  //   // h5 -> headline
  //   fontFamily: fontName,
  //   fontWeight: FontWeight.bold,
  //   fontSize: 24,
  //   letterSpacing: 0.27,
  //   color: darkerText,
  // );

  // static const TextStyle title = TextStyle(
  //   // h6 -> title
  //   fontFamily: fontName,
  //   fontWeight: FontWeight.bold,
  //   fontSize: 16,
  //   letterSpacing: 0.18,
  //   color: darkerText,
  // );

  // static const TextStyle subtitle = TextStyle(
  //   // subtitle2 -> subtitle
  //   fontFamily: fontName,
  //   fontWeight: FontWeight.w400,
  //   fontSize: 14,
  //   letterSpacing: -0.04,
  //   color: darkText,
  // );

  // static const TextStyle body2 = TextStyle(
  //   // body1 -> body2
  //   fontFamily: fontName,
  //   fontWeight: FontWeight.w400,
  //   fontSize: 14,
  //   letterSpacing: 0.2,
  //   color: darkText,
  // );

  // static const TextStyle body1 = TextStyle(
  //   // body2 -> body1
  //   fontFamily: fontName,
  //   fontWeight: FontWeight.w400,
  //   fontSize: 16,
  //   letterSpacing: -0.05,
  //   color: darkText,
  // );

  // static const TextStyle caption = TextStyle(
  //   // Caption -> caption
  //   fontFamily: fontName,
  //   fontWeight: FontWeight.w400,
  //   fontSize: 12,
  //   letterSpacing: 0.2,
  //   color: lightText, // was lightText
  // );
}
