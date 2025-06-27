import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/utility/app_bar_theme.dart';
import 'package:learning_app/utility/app_route.dart';
import 'package:learning_app/widgets/general%20file/global_file.dart';

Future<void> main() async {
  await GlobalFile.init();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Learning App',
          theme: AppTheme.appThemeData,
          // home: SignInScreen(),
          //initialRoute: AppConstant.USER_SIGN_HOME_PAGE,
          //routes: AppRoute.appRouteList(context),
          onGenerateRoute: (settings) =>
              AppRoute.generateRouteSettings(settings),
        );
      },
    );
  }
}
