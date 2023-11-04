import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulerning_app/pages/sign_in/sign_in_bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //Do something
        }
        if (password.isEmpty) {
          //Do something
        }
        try {
          final credectials = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          if (credectials.user == null) {
            //Do something
          }

          if (credectials.user!.emailVerified) {
            //Do somethings
          }

          var user = credectials.user;

          if (user != null) {
            //DO somehting
          } else {
            //Do something elese
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
