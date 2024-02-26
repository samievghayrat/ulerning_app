import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/home_page.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/homepage_bloc/homepage_bloc.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/homepage_bloc/homepage_events.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/homepage_bloc/homepage_states.dart';

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

Widget sliderShow(BuildContext context, HomePageStates state) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 160,
        width: 325,
        child: PageView(
          reverse: true,
          onPageChanged: (value) {
            print(value.toString());
            context.read<HomePageBloc>().add(HomePageDots(value));
          },
          children: [
            slidersContainer(path: "assets/icons/Art.png"),
            slidersContainer(path: "assets/icons/Image_1.png"),
            slidersContainer(path: "assets/icons/image_2.png"),
            // Passing path as a named parameter
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          reversed: true,
          dotsCount: 3,
          position: state.index,
        ),
      ),
    ],
  );
}

Widget slidersContainer({String path = "assets/icons/Art.png"}) {
  // defining path as named parameter
  return Container(
    margin: EdgeInsets.all(4),
    height: 160,
    width: 325,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path))),
  );
}
