import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppFontSizes {
  static TextStyle hintTextInTextFieldStyle =
      TextStyle(color: Colors.grey.withOpacity(0.5));
  static TextStyle greyColorTextStyle =
      TextStyle(fontSize: 14.sp, color: AppColors.greyColor.withOpacity(0.9));
  static TextStyle primaryButtonTextStyle = TextStyle(
      color: AppColors.primaryBlackColor,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.primaryBlue,
      fontSize: 12.sp);
}
