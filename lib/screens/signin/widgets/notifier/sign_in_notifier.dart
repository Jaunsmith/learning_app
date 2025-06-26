import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/screens/signin/widgets/sign_in_state.dart';

// extend a classs means borrowinf some of the class properties and use it in the class you extending from
// this stateNotifier save the state that it help us updating the state ...
class SigInNotifier extends StateNotifier<SignInState> {
  SigInNotifier() : super(SignInState());

  void userMailSignInUpdate(String email) {
    state = state.copyWith(email: email);
  }

  void userPasswordSignInUpdate(String password) {
    state = state.copyWith(password: password);
  }
}

// now the provider need to be expose so that it can be use globally in the UI ....
// ans also it takes type to know the kind of data to be updating .....
final sigInNotifierProvider = StateNotifierProvider<SigInNotifier, SignInState>(
  (ref) {
    return SigInNotifier();
  },
);
