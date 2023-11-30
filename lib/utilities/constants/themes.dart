import 'package:flutter/material.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  secondaryHeaderColor: AppColors.secondaryColor,
  disabledColor: const Color(0xFFA0A4A8),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: Colors.white,
  chipTheme: const ChipThemeData(selectedColor: AppColors.accentColor),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.accentColor)),
  colorScheme: const ColorScheme.light(
          primary: AppColors.accentColor, secondary: AppColors.accentColor)
      .copyWith(
    error: const Color(0xFFFF4D4D),
  ),
);
