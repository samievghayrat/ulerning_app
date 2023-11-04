import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulerning_app/constants/boxDecorations.dart';
import 'package:ulerning_app/constants/colors.dart';
import 'package:ulerning_app/constants/fontStyles.dart';
import 'package:ulerning_app/pages/sign_in/widgets_login/widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryWhiteColor,
      child: SafeArea(
        child: Scaffold(
          appBar: appBarLogIn(),
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
                  buildTextField("Please enter your email", "email", "user"),
                  SizedBox(
                    height: 5.h,
                  ),
                  reusableText('Password'),
                  buildTextField("Password", "password", "lock"),
                  SizedBox(
                    height: 5.h,
                  ),
                  forgotPassword(),
                  SizedBox(
                    height: 50.h,
                  ),
                  buildLoginAndRegisterButton('Log in', 'login', context),
                  buildLoginAndRegisterButton('Register', 'register', context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildLoginAndRegisterButton(
    String buttonName, String buttonType, BuildContext context) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(bottom: 20.h),
      height: 50.h,
      width: 325.w,
      decoration: BoxDecoration(
        color: buttonType == "register"
            ? AppColors.primaryWhiteColor
            : AppColors.primaryBlue,
        border: buttonType == "register"
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
      onTap: () {},
      child:
          Text("Forgot Password", style: AppFontSizes.primaryButtonTextStyle),
    ),
  );
}

Widget reusableIcon(String iconName) {
  return IconButton(
    iconSize: 5,
    onPressed: () {},
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

Widget buildTextField(String hintText, String textType, String iconName) {
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
            keyboardType: TextInputType.multiline,
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
