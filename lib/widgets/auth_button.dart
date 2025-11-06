import 'package:flutter/material.dart';
import 'package:deepseek_auth_app/constants/styles.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Widget? leadingIcon;
  final bool hasBorder;
  final bool isLoading;
  final bool isPrimary;

  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryBlue,
    this.textColor = AppColors.white,
    this.leadingIcon,
    this.hasBorder = false,
    this.isLoading = false,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.buttonHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
        color: backgroundColor,
        border: hasBorder ? Border.all(color: AppColors.borderColor, width: 1.0) : null,
        boxShadow: [
          if (isPrimary)
          BoxShadow(
            color: AppColors.primaryBlue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
          else
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
          onTap: isLoading ? null : onPressed,
          splashColor: isPrimary ? Colors.white.withOpacity(0.2) : AppColors.primaryBlue.withOpacity(0.1),
          highlightColor: isPrimary ? Colors.white.withOpacity(0.1) : AppColors.primaryBlue.withOpacity(0.05),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (leadingIcon != null)
                  Positioned(
                    left: 0,
                    child: leadingIcon!,
                  ),
                if (isLoading)
                  const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                    ),
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (leadingIcon != null) const SizedBox(width: 8),
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}