import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _isLoading = false;
  bool _agreeToTerms = false;
  bool _obscurePassword = true;

  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  bool get agreeToTerms => _agreeToTerms;
  bool get obscurePassword => _obscurePassword;
  
  bool get isLoginEnabled => _email.isNotEmpty && _password.isNotEmpty;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setAgreeToTerms(bool value) {
    _agreeToTerms = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  Future<void> loginWithPassword() async {
    if (!isLoginEnabled) return;
    
    _isLoading = true;
    notifyListeners();
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loginWithGoogle() async {
    _isLoading = true;
    notifyListeners();
    
    // Google Sign In implementation would go here
    await Future.delayed(const Duration(seconds: 2));
    
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loginWithApple() async {
    _isLoading = true;
    notifyListeners();
    
    // Apple Sign In implementation would go here
    await Future.delayed(const Duration(seconds: 2));
    
    _isLoading = false;
    notifyListeners();
  }
}