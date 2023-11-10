import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulerning_app/pages/register/register_bloc/register_bloc.dart';
import 'package:ulerning_app/pages/register/register_bloc/register_events.dart';
import 'package:ulerning_app/pages/register/register_bloc/register_states.dart';
import 'package:ulerning_app/pages/register/register_controller.dart';
import 'package:ulerning_app/pages/sign_in/widgets_login/widgets.dart';

import '../../constants/colors.dart';
import '../sign_in/sing_in.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(builder: (context, state) {
      return Container(
        color: AppColors.primaryWhiteColor,
        child: SafeArea(
          child: Scaffold(
            appBar: appBarLogIn('Register'),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        child: reusableText(
                          'Enter you details below & free sign up',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    reusableText('User name'),
                    buildTextField(
                        "Please enter your username", "email", "user", (value) {
                      context
                          .read<RegisterBloc>()
                          .add(UserNameEvent(userName: value));
                    }),
                    SizedBox(
                      height: 5.h,
                    ),
                    reusableText('Email address'),
                    buildTextField("Please enter your email", "email", "user",
                        (value) {
                      context
                          .read<RegisterBloc>()
                          .add(EmailEvent(email: value));
                      // context.read<SignInBloc>().add(EmailEvent(email: value));
                    }),
                    SizedBox(
                      height: 5.h,
                    ),
                    reusableText('Password'),
                    buildTextField("Password", "password", "lock", (value) {
                      context
                          .read<RegisterBloc>()
                          .add(PasswordEvent(password: value));
                      // context
                      //     .read<SignInBloc>()
                      // .add(PasswordEvent(password: value));
                    }),
                    SizedBox(
                      height: 5.h,
                    ),
                    reusableText('Confirm Password'),
                    buildTextField("Password", "password", "lock", (value) {
                      context
                          .read<RegisterBloc>()
                          .add(ConfPasswordEvent(confPassword: value));
                      // context
                      //     .read<SignInBloc>()
                      // .add(PasswordEvent(password: value));
                    }),
                    SizedBox(
                      height: 5.h,
                    ),
                    reusableText(
                        'By creating an account you have to agree with our terms and conditions'),
                    // forgotPassword(),
                    SizedBox(
                      height: 50.h,
                    ),
                    // buildLoginAndRegisterButton('Log in', 'login', () async {
                    //   try {
                    //     await SignInController(context: context)
                    //         .handleSignIn(type: "email");
                    //     print('Login button was pressed');
                    //   } catch (e) {
                    //     print('Error from sign in is: $e');
                    //   }
                    // }),
                    buildLoginAndRegisterButton('Sign up', 'login', () async {
                      print('Register button was pressed');
                      await RegisterController(context: context)
                          .handleRegistration();
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
