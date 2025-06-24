import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/screens/signup/widget/notifier/sign_up_notifier.dart';

import '../../../widgets/pop_up_notification.dart';

class SignUpController {
  late WidgetRef ref;

  SignUpController({required this.ref});

  void signUpAuthentication() {
    var state = ref.read(signUpNotifierProvider);

    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    if (kDebugMode) {
      print('Name is : $name');
      print('Name is : $email');
      print('Name is : $password');
      print('Name is : $confirmPassword');
    }

    if (state.confirmPassword != state.password) {
      if (kDebugMode) {
        print('The password don\'t match please enter,check');
        popUpNotification('Your password don\'t match the confirm password');
      }
    }
  }
}
