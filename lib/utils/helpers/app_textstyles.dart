import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppTextStyles {
  static TextStyle headlineLarge({
    double fontSize = 45.0,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.white,
    double? letterSpacing,
    double? height,
  }) {
    return GoogleFonts.lobster(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle syne({
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.w700,
    Color color = AppColors.white,
    double? letterSpacing,
    double? height,
  }) {
    return GoogleFonts.syne(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }
}
