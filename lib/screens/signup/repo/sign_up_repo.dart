import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepo {
  static Future<UserCredential> signUpAuhthentication({
    required String email,
    required String password,
  }) async {
    final userSignUpCredentials = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userSignUpCredentials;
  }
}
