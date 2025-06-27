import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/screens/signup/widget/notifier/sign_up_notifier.dart';
import 'package:learning_app/utility/loader/app_loader_icon.dart';

import '../../../widgets/pop_up_notification.dart';

class SignUpController {
  late WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> signUpAuthentication() async {
    var state = ref.read(signUpNotifierProvider);
    var navigator = Navigator.of(ref.context);

    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;
    bool isChecked = state.isChecked;

    if (state.userName.isEmpty || name.isEmpty) {
      popUpNotification('Please enter user name');
      return;
    }

    if (state.email.isEmpty || email.isEmpty) {
      popUpNotification('Please enter  email address');
      return;
    }

    if (state.password.isEmpty || password.isEmpty) {
      popUpNotification('Please enter password');
      return;
    }

    if (state.confirmPassword.isEmpty || confirmPassword.isEmpty) {
      popUpNotification('Please enter confirm password');
      return;
    }

    if (state.password.length < 8) {
      popUpNotification('Password can\'t be less than 8 character');
      return;
    }

    if ((state.confirmPassword != state.password) ||
        (password != confirmPassword)) {
      if (kDebugMode) {
        print('The password don\'t match please enter,check');
        popUpNotification('Your password don\'t match the confirm password');
      }
      return;
    }

    if (isChecked == false || state.isChecked == false) {
      popUpNotification('Please kindly agree to the terms and condition');
      return;
    }

    // this help us to update the state of the bool after the validation has been passed...
    ref.read(appLoaderIconProvider.notifier).setLoaderValue(true);
    try {
      final userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (kDebugMode) {
        print(userCredentials);
      }

      if (userCredentials.user != null) {
        await userCredentials.user?.sendEmailVerification();
        await userCredentials.user?.updateDisplayName(name);
        popUpNotification('Email verification has been sent to your mail');
        navigator.pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        popUpNotification('The password is too weak');
        return;
      } else if (e.code == 'email-already-in-use') {
        popUpNotification('Email already exit');
        return;
      } else if (e.code == 'user-not-found') {
        popUpNotification('Email not found please kindly Sign Up');
        return;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    ref.watch(appLoaderIconProvider.notifier).setLoaderValue(false);
    ref.watch(signUpNotifierProvider.notifier).userIsCheckedUpdate(false);
  }
}
