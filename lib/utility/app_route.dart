import 'package:flutter/material.dart';
import 'package:learning_app/screens/home/home_screen.dart';
import 'package:learning_app/screens/onboarding/on_boarding_screen.dart';
import 'package:learning_app/screens/signin/sign_in_screen.dart';
import 'package:learning_app/screens/signup/sign_up_screen.dart';
import 'package:learning_app/utility/bottom_nav_bars/bottom_nav_screen.dart';
import 'package:learning_app/widgets/general%20file/global_file.dart';
import 'package:learning_app/widgets/pop_up_notification.dart';

import 'constant/app_constant.dart';

class AppRoute {
  static List<RouteEntity> dynamicRoutes() {
    return [
      RouteEntity(
        path: AppConstant.USER_SIGN_HOME_PAGE,
        activePage: OnBoardingScreen(),
      ),
      RouteEntity(
        path: AppConstant.USER_SIGN_IN_PAGE,
        activePage: SignInScreen(),
      ),
      RouteEntity(
        path: AppConstant.USER_SIGN_UP_PAGE,
        activePage: SignUpScreen(),
      ),
      RouteEntity(
        path: AppConstant.USER_SIGN_DAHSBOARD_PAGE,
        activePage: BottomNavScreen(),
      ),
      RouteEntity(path: AppConstant.USER_HOME_PAGE, activePage: HomeScreen()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings routeSettings) {
    // the route setting already contain the info about our routing so far we used push named this allow it to store info..
    // if (kDebugMode) {
    //   print('in new page route settings which is name ${routeSettings.name}');
    // }

    if (routeSettings.name != null) {
      var result = dynamicRoutes().where((e) => e.path == routeSettings.name);
      // if (kDebugMode) {
      //   print('the result is ${result.isNotEmpty}');
      //   print('the result first part is :  ${result.first.path}');
      // }
      if (result.isNotEmpty) {
        bool appOpen = GlobalFile.storageServiceController.getDevice();
        if (result.first.path == AppConstant.USER_SIGN_HOME_PAGE && appOpen) {
          // This check if the user has already logged in before and just go to the home page straight else to the login page...
          bool userLoggedIn = GlobalFile.storageServiceController.isLoggedIn();
          if (userLoggedIn) {
            return MaterialPageRoute(
              builder: (_) => BottomNavScreen(),
              settings: routeSettings,
            );
          } else {
            // this is the page to display when the user have the app already install the app and gotten to login page before
            return MaterialPageRoute(
              builder: (_) => SignInScreen(),
              settings: routeSettings,
            );
          }
        } else {
          // print('the present part is :  ${result.first.activePage}');
          // this is the page to go after the user launch the app and go to login page the first page tp display after the onboarding page...
          return MaterialPageRoute(
            builder: (_) => result.first.activePage,
            settings: routeSettings,
          );
        }
      } else {
        popUpNotification(
          'Invalid route name or empty route invalid operation',
        );
      }
    }
    // this is the first page to display once the user launch the app if the user is not intsall it before
    return MaterialPageRoute(
      builder: (_) => OnBoardingScreen(),
      settings: routeSettings,
    );
  }
}

class RouteEntity {
  String path;
  Widget activePage;

  RouteEntity({required this.path, required this.activePage});
}
