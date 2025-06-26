import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/screens/signin/widgets/notifier/sign_in_notifier.dart';
import 'package:learning_app/utility/loader/app_loader_icon.dart';
import 'package:learning_app/widgets/entities/entities.dart';
import 'package:learning_app/widgets/pop_up_notification.dart';

class SignInController {
  late WidgetRef ref;
  SignInController({required this.ref});

  Future<void> loginAuthentication() async {
    var state = ref.read(sigInNotifierProvider);

    String email = state.email;
    String password = state.password;

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
        postUserData(loginRequestEntity);
        if (kDebugMode) {
          print('you have been successfully logged in ');
        }
      } else {
        popUpNotification('Login Error');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    ref.read(appLoaderIconProvider.notifier).setLoaderValue(false);
  }

  void postUserData(LoginRequestEntity loginRequest) {}
}
