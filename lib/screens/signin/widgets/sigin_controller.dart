import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/screens/signin/widgets/notifier/sign_in_notifier.dart';
import 'package:learning_app/utility/constant/app_constant.dart';
import 'package:learning_app/utility/loader/app_loader_icon.dart';
import 'package:learning_app/widgets/entities/entities.dart';
import 'package:learning_app/widgets/general%20file/global_file.dart';
import 'package:learning_app/widgets/pop_up_notification.dart';

class SignInController {
  late WidgetRef ref;
  SignInController({required this.ref});

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginAuthentication() async {
    var state = ref.read(sigInNotifierProvider);

    String email = state.email;
    String password = state.password;

    // this allow us to keep the data available after we have successfully login and back to the login screen.. even if we still log out
    mailController.text = email;
    passwordController.text = password;

    if (email.isEmpty) {
      popUpNotification('Email can\'t be empty please type in the mail');
      return;
    }

    if (password.length < 8) {
      popUpNotification('Password cant be less than 8 character');
      return;
    }

    ref.read(appLoaderIconProvider.notifier).setLoaderValue(true);
    try {
      final userLoginCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      var userData = userLoginCredential.user;
      if (userData == null) {
        popUpNotification('User not found');
        return;
      }

      if (!userData.emailVerified) {
        popUpNotification('Email need to be verified');
        return;
      }
      if (userData != null) {
        popUpNotification('You have successfully login to your account');
        String? displayName = userData.displayName;
        String? email = userData.email;
        String? id = userData.uid;
        String? photoUrl = userData.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.type = 1;
        loginRequestEntity.open_id = id;
        if (kDebugMode) {
          print('you have been successfully logged in ');
        }
        postUserData(loginRequestEntity);
      } else {
        popUpNotification('Login Error');
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          popUpNotification('User not found ❌');
          break;
        case 'wrong-password':
          popUpNotification('Incorrect password ❌');
          break;
        case 'invalid-credential':
          popUpNotification('either the mail or the password is incorrect ❌');
          break;
        case 'too-many-requests':
          popUpNotification('Too many login attempts. Try again later.');
          break;
        default:
          print('Login failed: ${e.code} and  ${e.message}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Generic error: $e');
        print('Error type: ${e.runtimeType}');
      }
    } finally {
      ref.read(appLoaderIconProvider.notifier).setLoaderValue(false);
    }
  }

  void postUserData(LoginRequestEntity loginRequest) {
    try {
      var navig = Navigator.of(ref.context);
      // Trying to get the user data to determine the status if logged in ...
      GlobalFile.storageServiceController.setString(
        AppConstant.USER_PROFILE_KEY,
        'value',
      );
      GlobalFile.storageServiceController.setString(
        AppConstant.USER_TOEKN_KEY,
        'value',
      );
      navig.pushNamedAndRemoveUntil(
        AppConstant.USER_SIGN_DAHSBOARD_PAGE,
        (route) => false,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
