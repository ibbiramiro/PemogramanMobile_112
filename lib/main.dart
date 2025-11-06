import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/auth_choice_screen.dart';
import 'providers/auth_provider.dart';

void main() {
  runApp(const DeepSeekAuthApp());
}

class DeepSeekAuthApp extends StatelessWidget {
  const DeepSeekAuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'DeepSeek Auth',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Poppins',
          useMaterial3: true,
        ),
        home: const AuthChoiceScreen(),
      ),
    );
  }
}