class SignUpState {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;
  final bool isChecked;

  SignUpState({
    this.userName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.isChecked = false,
  });

  // this copy with let us reassign value to the value if the value has already been set thats allow to update it once since the data is set to final ... but the copy with give us the chance to be able to update the data once again
  SignUpState copyWith({
    String? userName,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isChecked,
  }) {
    return SignUpState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
