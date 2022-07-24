import 'package:flutter/material.dart';
import 'package:social_newsfeed/themes/app_colors.dart';
import 'package:social_newsfeed/themes/app_fonts.dart';

class AppTextStyles {
  static TextStyle h1 = const TextStyle(
      // height: 48,
      fontFamily: AppFonts.avenir,
      fontSize: 40,
      color: AppColors.light,
      fontWeight: FontWeight.bold);
  static TextStyle h2 = const TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 28,
    color: AppColors.light,
    fontWeight: FontWeight.bold,
    // height: 34
  );
  static TextStyle h3 = const TextStyle(
      fontWeight: FontWeight.w400,
      // height: 28,
      fontFamily: AppFonts.avenir,
      fontSize: 22,
      color: AppColors.light);
  static TextStyle largeTitle = const TextStyle(
      fontFamily: AppFonts.avenir,
      fontSize: 34,
      // height: 41,
      color: AppColors.light,
      fontWeight: FontWeight.bold);
  static TextStyle body20 = const TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 20,
    // height: 25,
    color: AppColors.light,
  );
  static TextStyle body15 = const TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 15,
    // height: 20,
    color: AppColors.light,
  );
  static TextStyle body17 = const TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 17,
    // height: 22,
    color: AppColors.light,
  );
  static TextStyle caption11 = const TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 11,
    // height: 13,
    color: AppColors.light,
  );
  static TextStyle caption13 = const TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 13,
    // height: 13,
    color: AppColors.light,
  );
}
