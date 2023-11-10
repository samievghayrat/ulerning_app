import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulerning_app/pages/homepage/homepage.dart';
import 'package:ulerning_app/pages/sign_in/sign_in_bloc/sign_in_bloc.dart';
import 'package:ulerning_app/widget/toast_widget.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn({required String type}) async {
    if (type == "email") {
      final state = context.read<SignInBloc>().state;
      String emailAddress = state.email;
      String pass_word = state.password;

      print("Email address is: $emailAddress");
      print("Password from bloc is: $emailAddress");
      if (emailAddress.isEmpty || pass_word.isEmpty) {
        toastInfo(msg: ("Email or password is empty"));
        // print("Email address is: $emailAddress");
        // print("Password from bloc is: $emailAddress");

        // print('Email or password is empty');
        return;
      }

      try {
        final credentials =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: pass_word,
        );

        if (credentials.user?.emailVerified ?? false) {
          toastInfo(msg: ("Email is verified"));
        }

        var user = credentials.user;

        if (user != null) {
          toastInfo(msg: ("The user $user exists"));
          // Do something

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => HomePage(),
            ),
          );
        } else {
          toastInfo(msg: 'User does not exist');
        }
      } on FirebaseAuthException catch (e) {
        handleFirebaseAuthException(e);
      }
    }
  }

  void handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        toastInfo(msg: "User not found");
        break;
      case 'wrong-password':
        toastInfo(msg: "Wrong password");
        break;
      case 'invalid-email':
        toastInfo(msg: 'Your email format is wrong');
        break;
      case 'invalid-login-credentials':
        toastInfo(msg: 'Your email format is wrong');
        break;
      default:
        print('Unexpected error: $e');
    }
  }
}
