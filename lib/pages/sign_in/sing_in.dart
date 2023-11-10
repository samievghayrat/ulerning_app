import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulerning_app/constants/boxDecorations.dart';
import 'package:ulerning_app/constants/colors.dart';
import 'package:ulerning_app/constants/fontStyles.dart';
import 'package:ulerning_app/pages/sign_in/sign_in_bloc/sign_in_bloc.dart';
import 'package:ulerning_app/pages/sign_in/sign_in_bloc/sign_in_event.dart';
import 'package:ulerning_app/pages/sign_in/sign_in_bloc/sign_in_state.dart';
import 'package:ulerning_app/pages/sign_in/sign_in_controller.dart';
import 'package:ulerning_app/pages/sign_in/widgets_login/widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: AppColors.primaryWhiteColor,
        child: SafeArea(
          child: Scaffold(
            appBar: appBarLogIn(state.email),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    thirdPartyLogin(context),
                    reusableText(
                      'Or use your email account login',
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    reusableText('Email address'),
                    buildTextField("Please enter your email", "email", "user",
                        (value) {
                      context.read<SignInBloc>().add(EmailEvent(email: value));
                    }),
                    SizedBox(
                      height: 5.h,
                    ),
                    reusableText('Password'),
                    buildTextField("Password", "password", "lock", (value) {
                      context
                          .read<SignInBloc>()
                          .add(PasswordEvent(password: value));
                    }),
                    SizedBox(
                      height: 5.h,
                    ),
                    forgotPassword(),
                    SizedBox(
                      height: 50.h,
                    ),
                    buildLoginAndRegisterButton('Log in', 'login', () async {
                      try {
                        await SignInController(context: context)
                            .handleSignIn(type: "email");
                        print('Login button was pressed');
                      } catch (e) {
                        print('Error from sign in is: $e');
                      }
                    }),
                    buildLoginAndRegisterButton('Register', 'register', () {
                      print('Register button was pressed');
                      Navigator.of(context).pushNamed("register");
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

Widget buildLoginAndRegisterButton(
    String buttonName, String buttonType, void Function()? func) {
  return GestureDetector(
    onTap: () => func!(),
    child: Container(
      margin: EdgeInsets.only(bottom: 20.h),
      height: 50.h,
      width: 325.w,
      decoration: BoxDecoration(
        color: buttonType == "register"
            ? AppColors.primaryWhiteColor
            : AppColors.primaryBlue,
        border: (buttonType == "register")
            ? Border.all(color: AppColors.greyColor)
            : null,
        borderRadius: BorderRadius.circular(
          15.w,
        ),
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              color: buttonType == "register"
                  ? AppColors.primaryBlackColor
                  : AppColors.primaryWhiteColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal),
        ),
      ),
    ),
  );
}

Widget thirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        reusableIcon("google"),
        reusableIcon("apple"),
        reusableIcon("facebook"),
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
    // margin: EdgeInsets.only(left: .w),
    height: 44.h,
    width: 260.w,
    child: GestureDetector(
      onTap: () {
        print('Forgot password button pressed');
      },
      child:
          Text("Forgot Password", style: AppFontSizes.primaryButtonTextStyle),
    ),
  );
}

Widget reusableIcon(String iconName) {
  return IconButton(
    iconSize: 5,
    onPressed: () {
      print("reusable icon of the third party registration pressed");
    },
    icon: Image.asset(
      "assets/icons/${iconName}.png",
      width: 40,
      height: 40,
    ),
  );
}

Widget reusableText(String text) {
  return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      child: Text(
        text,
        style: AppFontSizes.greyColorTextStyle,
      ));
}

Widget buildTextField(String hintText, String textType, String iconName,
    void Function(String value)? func) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.h),
    width: 325.w,
    height: 50.h,
    decoration: AppBoxDecorations.textFieldBoxDecoration,
    child: Row(
      children: [
        Container(
          width: 16.w,
          margin: EdgeInsets.only(left: 17.w),
          height: 16.w,
          child: Image.asset("assets/icons/${iconName}.png"),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: textType == 'email'
                ? TextInputType.emailAddress
                : TextInputType.multiline,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintStyle: AppFontSizes.hintTextInTextFieldStyle),
            style: TextStyle(
                color: AppColors.primaryBlackColor,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 12.sp),
            autocorrect: false,
            obscureText: textType == 'password' ? true : false,
          ),
        ),
      ],
    ),
  );
}
