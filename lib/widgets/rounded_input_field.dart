import 'package:flutter/material.dart';
import 'package:deepseek_auth_app/constants/styles.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final bool showVisibilityToggle;
  final VoidCallback? onVisibilityToggle;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;

  const RoundedInputField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.showVisibilityToggle = false,
    this.onVisibilityToggle,
    this.onChanged,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.buttonHeight,
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
      ),
      child: Center(
        child: TextField(
          onChanged: onChanged,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.smallText.copyWith(
              fontSize: 16,
              height: 1.5,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            suffixIcon: showVisibilityToggle
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.textSecondary,
                      size: 24,
                    ),
                    onPressed: onVisibilityToggle,
                  )
                : null,
            isDense: true,
          ),
        ),
      ),
    );
  }
}