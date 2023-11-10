class SignInState {
  late String email;
  late String password;

  SignInState({this.email = "", this.password = ""});

  SignInState copyWiths(String? email, String? password) {
    return SignInState(
        email: email ?? this.email, password: password ?? this.password);
  }

  SignInState copyEmail(String email) {
    return SignInState(email: email, password: this.password);
  }

  SignInState copyPassword(String password) {
    return SignInState(email: this.email, password: password);
  }
}
