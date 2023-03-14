import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle fullInfoTitleStyle = GoogleFonts.slabo13px(
      textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold));
  static TextStyle fullInfoTextStyle = GoogleFonts.slabo13px(
      textStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ));
  static TextStyle partInfoTitleStyle = GoogleFonts.slabo13px(
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600));
  static TextStyle homeScreenTitleStyle = GoogleFonts.slabo13px(
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500));
  static TextStyle partInfoTextStyle = GoogleFonts.slabo13px(
      textStyle: const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ));
}
