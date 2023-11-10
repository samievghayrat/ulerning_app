import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulerning_app/pages/register/register_bloc/register_bloc.dart';
import 'package:ulerning_app/widget/toast_widget.dart';

class RegisterController {
  BuildContext context;

  RegisterController({required this.context});

  Future handleRegistration() async {
    final state = context.read<RegisterBloc>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    print("$userName - $email - $password -$confirmPassword");
    if (userName.isEmpty) {
      toastInfo(msg: "User name is empty");
    }
    if (email.isEmpty) {
      toastInfo(msg: 'Email is empty');
    }
    if (password.isEmpty) {
      toastInfo(msg: 'Password is empty');
    }
    if (confirmPassword.isEmpty) {
      toastInfo(msg: 'Confirm Password is empty');
    }

    try {
      final credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credentials.user != null) {
        await credentials.user?.sendEmailVerification();
        await credentials.user?.updateDisplayName(userName);
        toastInfo(msg: 'The verification email sent to the above email');
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "Email is already in use");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "The email id is not valid");
      }
    }
  }
}
