import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController {
  static const String _onboardingKey = 'onboarding_passed';

  Future<void> navigateAfterSplash(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnboarding = prefs.getBool(_onboardingKey) ?? false;

    if (hasSeenOnboarding) {
      Navigator.pushReplacementNamed(context, '/list');
    } else {
      Navigator.pushReplacementNamed(context, '/onboarding');
    }
  }
}
