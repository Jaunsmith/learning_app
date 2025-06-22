import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/screens/signin/widgets/login_options.dart';
import 'package:learning_app/screens/signin/widgets/sign_in_app_bar.dart';
import 'package:learning_app/utility/app_Colors.dart';
import 'package:learning_app/widgets/app_button_widget.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController mailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: sigInAppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
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
                  controller: mailController,
                ),
                SizedBox(height: 30.h),
                appTextField(
                  hintText: 'Enter Password',
                  headerText: 'Password',
                  iconName: Icons.lock,
                  controller: passwordController,
                  obscure: true,
                ),
                mailSignIn(
                  text: 'Forgot password?',
                  color: AppColors.primaryText,
                  textUnderLine: true,
                ),
                SizedBox(height: 100.h),
                appButtonWidget(text: 'Login'),
                SizedBox(height: 20.h),
                appButtonWidget(
                  text: 'SignUp',
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
