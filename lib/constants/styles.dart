import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF4A6BFF);
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF9B9B9B);
  static const Color inputBackground = Color(0xFFF3F3F3);
  static const Color borderColor = Color(0xFFE8E8E8);
  static const Color white = Color(0xFFFFFFFF);
}

class AppTextStyles {
  static const TextStyle titleLarge = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  
  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  
  static const TextStyle buttonTextDark = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
  
  static const TextStyle smallText = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );
  
  static const TextStyle linkText = TextStyle(
    fontSize: 14,
    color: AppColors.primaryBlue,
    fontWeight: FontWeight.w500,
  );
}

class AppDimensions {
  static const double buttonHeight = 56.0;
  static const double buttonBorderRadius = 12.0; // Radius lebih besar
  static const double inputBorderRadius = 8.0;
  static const double horizontalPadding = 20.0;
  static const double verticalSpacing = 12.0; // Spacing lebih kecil
}