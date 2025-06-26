import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/screens/signup/widget/notifier/sign_up_notifier.dart';
import 'package:learning_app/screens/signup/widget/sign_up_controller.dart';
import 'package:learning_app/utility/app_Colors.dart';
import 'package:learning_app/utility/loader/app_loader_icon.dart';
import 'package:learning_app/widgets/text_data.dart';

import '../../widgets/app_bar_data.dart';
import '../../widgets/app_button_widget.dart';
import '../../widgets/app_textField_data.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpProvider = ref.watch(signUpNotifierProvider);
    final loaderProvider = ref.watch(appLoaderIconProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarData('Sign Up'),
      body: SafeArea(
        child: !loaderProvider
            ? SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: sigIn14Text(
                          'Enter your details below & free sign up',
                        ),
                      ),
                      SizedBox(height: 50.h),
                      AppTextFieldData(
                        iconName: Icons.person,
                        headerText: 'Username',
                        function: (value) => ref
                            .read(signUpNotifierProvider.notifier)
                            .userNameUpdate(value),
                      ),
                      SizedBox(height: 20.h),
                      AppTextFieldData(
                        iconName: Icons.email,
                        headerText: 'Email',
                        function: (value) => ref
                            .read(signUpNotifierProvider.notifier)
                            .userEmailUpdate(value),
                      ),
                      SizedBox(height: 20.h),
                      AppTextFieldData(
                        iconName: Icons.lock,
                        headerText: 'Password',
                        isPassword: true,
                        function: (value) => ref
                            .read(signUpNotifierProvider.notifier)
                            .userPasswordUpdate(value),
                      ),
                      SizedBox(height: 20.h),
                      AppTextFieldData(
                        iconName: Icons.lock,
                        headerText: 'Confirm Password',
                        isPassword: true,
                        function: (value) => ref
                            .read(signUpNotifierProvider.notifier)
                            .userConfirmPasswordUpdate(value),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Checkbox(
                            value: signUpProvider.isChecked,
                            onChanged: (value) {
                              ref
                                  .read(signUpNotifierProvider.notifier)
                                  .userIsCheckedUpdate(value!);
                            },
                            activeColor: AppColors.primaryText,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              sigIn14Text(
                                'By creating an account you have agree',
                                textAlign: TextAlign.start,
                              ),
                              sigIn14Text(
                                'with our terms and condition',
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      appButtonWidget(
                        text: 'Sign Up',
                        function: () {
                          if (kDebugMode) {
                            print('Sign Up is clicked');
                            SignUpController(ref: ref).signUpAuthentication();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.blue,
                ),
              ),
      ),
    );
  }
}
