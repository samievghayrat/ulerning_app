abstract class RegisterEvent {
  const RegisterEvent();
}

class UserNameEvent extends RegisterEvent {
  final String userName;

  const UserNameEvent({required this.userName});
}

class EmailEvent extends RegisterEvent {
  final String email;

  const EmailEvent({required this.email});
}

class PasswordEvent extends RegisterEvent {
  final String password;

  const PasswordEvent({required this.password});
}

class ConfPasswordEvent extends RegisterEvent {
  final String confPassword;

  const ConfPasswordEvent({required this.confPassword});
}
