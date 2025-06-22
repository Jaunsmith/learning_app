import 'package:flutter/material.dart';
import 'package:learning_app/screens/onboarding/on_boarding_screen.dart';
import 'package:learning_app/screens/signin/sign_in_screen.dart';

Map<String, WidgetBuilder> appRoute(BuildContext context) {
  return {
    '/': (context) => OnBoardingScreen(),
    '/signIn': (context) => SignIn(),
  };
}
