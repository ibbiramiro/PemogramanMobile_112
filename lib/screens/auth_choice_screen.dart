import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deepseek_auth_app/providers/auth_provider.dart';
import 'package:deepseek_auth_app/widgets/auth_button.dart';
import 'package:deepseek_auth_app/screens/password_login_screen.dart';
import 'package:deepseek_auth_app/constants/styles.dart';

class AuthChoiceScreen extends StatelessWidget {
  const AuthChoiceScreen({super.key});

  void _navigateToPasswordLogin(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const PasswordLoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeOut;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

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
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.horizontalPadding,
              ),
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header with Contact Us
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Contact us clicked');
                    },
                    child: Text(
                      'Contact us',
                      style: AppTextStyles.smallText,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Logo and Brand (centered higher)
              Column(
                
                children: [
                  // Deepseek Logo
                  Container(
                    width: 120,
                    height: 120,
                    
                      
                    child: Image.asset(
                        'assets/images/deepseek_logo.png',
                        
                      ),
                    
                  ),
                
                ],
              ),

              const Spacer(flex: 2),

              // Auth Buttons - SPACING DIKECILKAN
              // Buttons stacked and spaced to appear near bottom
              Column(
                children: [
                  // Primary Blue Button (large)
                  AuthButton(
                    text: 'Continue with Password',
                    onPressed: () => _navigateToPasswordLogin(context),
                    isPrimary: true,
                    leadingIcon: const Icon(
                      Icons.lock,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Apple Button
                  AuthButton(
                    text: 'Continue with Apple',
                    onPressed: () {
                      
                    },
                    backgroundColor: AppColors.white,
                    textColor: AppColors.textPrimary,
                    hasBorder: true,
                    isLoading: authProvider.isLoading,
                    leadingIcon: const Icon(
                      Icons.apple,
                      color: AppColors.textPrimary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Google Button
                  AuthButton(
                    text: 'Continue with Google',
                    onPressed: () {
                      
                    },
                    backgroundColor: AppColors.white,
                    textColor: AppColors.textPrimary,
                    hasBorder: true,
                    isLoading: authProvider.isLoading,
                    leadingIcon: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.textPrimary, width: 1),
                      ),
                      child: Center(
                        child: Text(
                          'G',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Sign Up Button
                  AuthButton(
                    text: 'Sign up',
                    onPressed: () {
                      print('Sign up clicked');
                    },
                    backgroundColor: AppColors.white,
                    textColor: AppColors.textPrimary,
                    hasBorder: true,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Terms Checkbox - DIKECILKAN SPACINGNYA
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<AuthProvider>(
                      builder: (context, authProvider, child) {
                        return GestureDetector(
                          onTap: () {
                            authProvider.setAgreeToTerms(!authProvider.agreeToTerms);
                          },
                          child: Container(
                            width: 18, // DIKECILKAN
                            height: 18, // DIKECILKAN
                            margin: const EdgeInsets.only(top: 2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.textSecondary,
                                width: 1.5,
                              ),
                              color: authProvider.agreeToTerms
                                  ? AppColors.primaryBlue
                                  : Colors.transparent,
                            ),
                            child: authProvider.agreeToTerms
                                ? const Icon(
                                    Icons.check,
                                    size: 12, // DIKECILKAN
                                    color: AppColors.white,
                                  )
                                : null,
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 10), // DIKECILKAN
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          print('Terms checkbox clicked');
                        },
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 13, // DIKECILKAN
                              color: AppColors.textSecondary,
                              height: 1.4,
                            ),
                            children: [
                              const TextSpan(
                                text: 'I confirm that I have read and agree to ',
                              ),
                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: () {
                                    print('Terms of Use clicked');
                                  },
                                  child: Text(
                                    'Terms of Use',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.primaryBlue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const TextSpan(text: ' and '),
                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: () {
                                    print('Privacy Policy clicked');
                                  },
                                  child: Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.primaryBlue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 36), // JARAK DARI BAWAH DIPERBESAR
            ],
          ),
        ),
      ),
    ),
  ),
);
  }
}