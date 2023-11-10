import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppBoxDecorations {
  static BoxDecoration textFieldBoxDecoration = BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.all(
      Radius.circular(15.w),
    ),
    border: Border.all(color: AppColors.blackZeroFive),
  );
}
