class RegisterStates {
  late String userName;
  late String email;
  late String password;
  late String confirmPassword;

  RegisterStates(
      {this.userName = '',
      this.email = '',
      this.password = '',
      this.confirmPassword = ''});

  RegisterStates copyUserName(String newUserName) {
    return RegisterStates(
        userName: newUserName,
        email: this.email,
        password: this.password,
        confirmPassword: confirmPassword);
  }

  RegisterStates copyEmail(String newEmail) {
    return RegisterStates(
        userName: userName,
        email: newEmail,
        password: password,
        confirmPassword: confirmPassword);
  }

  RegisterStates copyPassword(String newPassword) {
    return RegisterStates(
        userName: userName,
        email: email,
        password: newPassword,
        confirmPassword: confirmPassword);
  }

  RegisterStates copyConfPassword(String newConfPassword) {
    return RegisterStates(
        userName: userName,
        email: email,
        password: password,
        confirmPassword: newConfPassword);
  }
}
