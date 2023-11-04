class SignInState {
  late String email;
  late String password;

  SignInState({this.email = "", this.password = ""});

  SignInState copyWith(String? email, String? password) {
    return SignInState(
        email: email ?? this.email, password: password ?? this.password);
  }
}
