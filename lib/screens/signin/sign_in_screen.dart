import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/screens/signin/controller/sigin_controller.dart';
import 'package:learning_app/screens/signin/widgets/login_options.dart';
import 'package:learning_app/screens/signin/widgets/notifier/sign_in_notifier.dart';
import 'package:learning_app/utility/app_Colors.dart';
import 'package:learning_app/utility/constant/app_constant.dart';
import 'package:learning_app/utility/loader/app_loader_icon.dart';
import 'package:learning_app/widgets/app_bar_data.dart';
import 'package:learning_app/widgets/app_button_widget.dart';

import '../../widgets/app_textField_data.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  late SignInController _signInController;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _signInController = SignInController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var readData = ref.read(sigInNotifierProvider.notifier);
    final loader = ref.watch(appLoaderIconProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarData('Login'),
      body: loader == false
          ? SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      loginOptions(),
                      Center(
                        child: clickableButton(
                          text: 'or use your email to login',
                        ),
                      ),
                      SizedBox(height: 40.h),
                      AppTextFieldData(
                        textEditingController: _signInController.mailController,
                        hintText: 'Enter your email',
                        headerText: 'Email',
                        iconName: Icons.person,
                        function: (value) =>
                            readData.userMailSignInUpdate(value),
                      ),
                      SizedBox(height: 30.h),
                      AppTextFieldData(
                        textEditingController:
                            _signInController.passwordController,
                        hintText: 'Enter Password',
                        function: (value) =>
                            readData.userPasswordSignInUpdate(value),
                        headerText: 'Password',
                        iconName: Icons.lock,
                        isPassword: true,
                      ),
                      clickableButton(
                        text: 'Forgot password?',
                        color: AppColors.primaryText,
                        textUnderLine: true,
                      ),
                      SizedBox(height: 100.h),
                      appButtonWidget(
                        text: 'Login',
                        function: () {
                          _signInController.loginAuthentication(ref);
                        },
                      ),
                      SizedBox(height: 20.h),
                      appButtonWidget(
                        text: 'SignUp',
                        function: () => Navigator.pushNamed(
                          context,
                          AppConstant.USER_SIGN_UP_PAGE,
                        ),
                        containerColor: AppColors.primaryBackground,
                        textColor: AppColors.primaryText,
                        border: true,
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.blue,
              ),
            ),
    );
  }
}
