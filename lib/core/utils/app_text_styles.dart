import 'package:test_ios/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const TextStyle font24BoldWhitesaef = TextStyle(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );
  static const TextStyle font15BoldGreen = TextStyle(
    color: AppColors.greentextColor,
    fontWeight: FontWeight.bold,
    fontSize: 15.0,
  );
  static const TextStyle font17Green = TextStyle(
    color: AppColors.greentextColor,
    fontSize: 17,
  );
  static const TextStyle font18BoldGreen = TextStyle(
    color: AppColors.greentextColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
