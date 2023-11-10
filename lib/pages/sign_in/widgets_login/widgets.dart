import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

AppBar appBarLogIn(String appBarTitle) {
  return AppBar(
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Container(
        color: AppColors.greyZeroFive,
        height: 1.0,
      ),
    ),
    title: Text(
      appBarTitle,
      style: TextStyle(
          color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.normal),
    ),
  );
}
