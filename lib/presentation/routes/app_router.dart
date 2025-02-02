

import 'package:flutter/material.dart';

import '../views/main/main_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/':
      //   return MaterialPageRoute(builder: (context) => const OnboardingScreen());
      case '/main':
        return MaterialPageRoute(builder: (context) => const MainPage());
      // case '/auth':
      //   return MaterialPageRoute(builder: (context) => const AuthScreen());
      // case '/auth/otp':
      //   return MaterialPageRoute(builder: (context) => OtpVerificationScreen(phoneNumber: settings.arguments as String));
      // case '/home':
      //   return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page non trouvée'),
            ),
          ),
        );
    }
  }
}