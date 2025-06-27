import 'package:flutter/material.dart';
import 'package:learning_app/screens/onboarding/on_boarding_screen.dart';
import 'package:learning_app/screens/signin/sign_in_screen.dart';
import 'package:learning_app/screens/signup/sign_up_screen.dart';

import '../screens/home/home_screen.dart';
import 'constant/app_constant.dart';

class AppRoute {
  static Map<String, WidgetBuilder> appRouteList(BuildContext context) {
    return {
      AppConstant.USER_SIGN_HOME_PAGE: (context) => OnBoardingScreen(),
      AppConstant.USER_SIGN_IN_PAGE: (context) => SignInScreen(),
      AppConstant.USER_SIGN_UP_PAGE: (context) => SignUpScreen(),
      AppConstant.USER_SIGN_DAHSBOARD_PAGE: (context) => HomeScreen(),
    };
  }

  static List<dynamic> dynamicRoutes() {
    return [];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings routeSettings) {
    print('in new page route settings');
    return MaterialPageRoute(
      builder: (_) => Scaffold(body: Container()),
      settings: routeSettings,
    );
  }
}
