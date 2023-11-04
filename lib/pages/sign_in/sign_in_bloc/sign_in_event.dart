abstract class SignInEvent {
  const SignInEvent();
}

class EmailEvent extends SignInEvent {
  final String email;

  const EmailEvent({required this.email});
}

class PasswordEvent extends SignInEvent {
  final String password;

  const PasswordEvent({required this.password});
}
