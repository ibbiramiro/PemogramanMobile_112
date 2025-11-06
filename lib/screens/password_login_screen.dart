import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deepseek_auth_app/providers/auth_provider.dart';
import 'package:deepseek_auth_app/widgets/auth_button.dart';
import 'package:deepseek_auth_app/widgets/rounded_input_field.dart';
import 'package:deepseek_auth_app/constants/styles.dart';

class PasswordLoginScreen extends StatelessWidget {
  const PasswordLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimensions.horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header with back button and Contact Us
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.inputBackground.withOpacity(0.8),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.chevron_left,
                            size: 24,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => print('Contact us clicked'),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          'Contact us',
                          style: AppTextStyles.smallText.copyWith(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Title
              Text(
                'Continue with Password',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 32),

              // Input Fields
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoundedInputField(
                    hintText: 'Email / +86 Phone number',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: authProvider.setEmail,
                  ),
                  const SizedBox(height: AppDimensions.verticalSpacing),
                  RoundedInputField(
                    hintText: 'Password',
                    obscureText: authProvider.obscurePassword,
                    showVisibilityToggle: true,
                    onVisibilityToggle: authProvider.togglePasswordVisibility,
                    onChanged: authProvider.setPassword,
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => print('Forgot password clicked'),
                    child: Text(
                      'Forgot password?',
                      style: AppTextStyles.linkText.copyWith(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              const SizedBox(height: 20),

              // Login Button - PRIMARY STYLE
              AuthButton(
                text: 'Log in',
                onPressed: () async {
                  await authProvider.loginWithPassword();
                },
                isLoading: authProvider.isLoading,
                isPrimary: true,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
        ),),
    );
  }
}