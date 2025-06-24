import 'package:flutter/material.dart';
import 'package:learning_app/utility/app_Colors.dart';

class AppTheme {
  // The variable is created using static cause no need of creating another object of themedata again but the themedata can be use anywhere is the app with no need of just creating new variable again or an object... so this condition make it possible for us to declare the variable as static
  static ThemeData appThemeData = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: AppColors.primaryText),
    ),
  );
}
