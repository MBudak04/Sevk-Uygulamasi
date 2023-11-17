import 'package:flutter/material.dart';
import 'package:neden_sevk_application/views/themes/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

const String fontFamilyHamlin = "Hamlin";

class NedenFonts {
  static TextStyle baslikBeyaz = TextStyle(
      fontFamily: fontFamilyHamlin,
      fontWeight: FontWeight.w900,
      fontSize: 20.sp,
      color: NedenColors.beyaz);
  static TextStyle metin1 = TextStyle(
      fontFamily: fontFamilyHamlin,
      fontWeight: FontWeight.normal,
      fontSize: 15.sp,
      color: NedenColors.maroon,
      decoration: TextDecoration.underline);
  static TextStyle metinTextFormField = TextStyle(
    fontFamily: fontFamilyHamlin,
    fontWeight: FontWeight.bold,
    fontSize: 16.sp,
    color: NedenColors.lacivert,
  );

}
