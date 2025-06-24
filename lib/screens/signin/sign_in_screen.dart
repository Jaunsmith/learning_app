import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/screens/signin/widgets/login_options.dart';
import 'package:learning_app/utility/app_Colors.dart';
import 'package:learning_app/widgets/app_bar_data.dart';
import 'package:learning_app/widgets/app_button_widget.dart';

import '../../widgets/app_textField_data.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarData('Login'),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loginOptions(),
                Center(child: mailSignIn(text: 'or use your email to login')),
                SizedBox(height: 40.h),
                appTextField(
                  hintText: 'Enter your email',
                  headerText: 'Email',
                  iconName: Icons.person,
                ),
                SizedBox(height: 30.h),
                appTextField(
                  hintText: 'Enter Password',
                  headerText: 'Password',
                  iconName: Icons.lock,

                  obscure: true,
                ),
                mailSignIn(
                  text: 'Forgot password?',
                  color: AppColors.primaryText,
                  textUnderLine: true,
                ),
                SizedBox(height: 100.h),
                appButtonWidget(
                  text: 'Login',
                  function: () {
                    if (kDebugMode) {
                      print('Login clicked');
                    }
                  },
                ),
                SizedBox(height: 20.h),
                appButtonWidget(
                  text: 'SignUp',
                  function: () => Navigator.pushNamed(context, '/signUp'),
                  containerColor: AppColors.primaryBackground,
                  textColor: AppColors.primaryText,
                  border: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
