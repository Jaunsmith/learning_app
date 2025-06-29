import 'package:firebase_auth/firebase_auth.dart';

class SignInRepo {
  static Future<UserCredential> loginAuthentication({
    required String email,
    required String password,
  }) async {
    final userLoginCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userLoginCredential;
  }
}
