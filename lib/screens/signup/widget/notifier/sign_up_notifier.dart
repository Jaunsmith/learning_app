import 'package:flutter/foundation.dart';
import 'package:learning_app/screens/signup/widget/notifier/sign_up_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_notifier.g.dart';

@riverpod
class SignUpNotifier extends _$SignUpNotifier {
  @override
  SignUpState build() {
    return SignUpState();
  }

  void userNameUpdate(String dataName) {
    state = state.copyWith(userName: dataName);
    if (kDebugMode) {
      print(state.userName);
    }
  }

  void userEmailUpdate(String dataMail) {
    state = state.copyWith(email: dataMail);
    if (kDebugMode) {
      print(state.email);
    }
  }

  void userPasswordUpdate(String dataPass) {
    state = state.copyWith(password: dataPass);
    if (kDebugMode) {
      print(state.email);
    }
  }

  void userConfirmPasswordUpdate(String dataConfirm) {
    state = state.copyWith(confirmPassword: dataConfirm);
    if (kDebugMode) {
      print(state.email);
    }
  }

  void userIsCheckedUpdate(bool isCheckedData) {
    state = state.copyWith(isChecked: isCheckedData);
    if (kDebugMode) {
      print(state.isChecked);
    }
  }
}
