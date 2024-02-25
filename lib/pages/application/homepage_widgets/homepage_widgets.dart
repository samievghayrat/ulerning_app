import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/home_page.dart';

import '../../../constants/colors.dart';

AppBar buildAppbar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/person.png"))),
            ),
          )
        ],
      ),
    ),
  );
}

Widget buildPage(int index) {
  List<Widget> _widget = [
    HomePage(),
    Text("Seach"),
    Text("Course"),
    Text("Chat"),
    Text("Profile"),
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
