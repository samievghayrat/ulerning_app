import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    Center(
      child: Text("Home"),
    ),
    Center(
      child: Text("Seach"),
    ),
    Center(
      child: Text("Course"),
    ),
    Center(
      child: Text("Chat"),
    ),
    Center(
      child: Text("Profile"),
    ),
  ];
  return _widget[index];
}

List<BottomNavigationBarItem> bottomTubs = [
  BottomNavigationBarItem(
    label: 'Home',
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        'assets/icons/home.png',
        // color: AppColors.primaryBlue,
      ),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryBlue,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'search',
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        'assets/icons/search.png',
        // color: AppColors.primaryBlue,
      ),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/search.png",
        color: AppColors.primaryBlue,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'play-video',
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        'assets/icons/play-circle1.png',
        // color: AppColors.primaryBlue,
      ),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/play-circle1.png",
        color: AppColors.primaryBlue,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'message',
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        'assets/icons/message.png',
        // color: AppColors.primaryBlue,
      ),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/message.png",
        color: AppColors.primaryBlue,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'profile',
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        'assets/icons/person2.png',
        // color: AppColors.primaryBlue,
      ),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/person2.png",
        color: AppColors.primaryBlue,
      ),
    ),
  ),
];
