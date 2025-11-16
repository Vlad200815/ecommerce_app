import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

final myTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.green,
    primary: AppColors.green,
    surface: AppColors.surfaceCol,
    secondary: AppColors.grey,
    tertiary: AppColors.navCol,
    error: AppColors.red,
    brightness: Brightness.dark,
  ),
);
