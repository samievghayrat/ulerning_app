import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/articles_bloc/articles_bloc.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/articles_bloc/articles_events.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/articles_bloc/articles_states.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/home_page.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/homepage_bloc/homepage_bloc.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/homepage_bloc/homepage_events.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/homepage_bloc/homepage_states.dart';
import 'package:ulerning_app/pages/profile/profile.dart';

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
    Profile(),
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
        height: 160.h,
        width: 325.w,
        child: PageView(
          reverse: true,
          onPageChanged: (value) {
            print("The value from home page slider ${value.toString()}");
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
  return Padding(
    padding: EdgeInsets.only(right: 8.0.w),
    child: Container(
      height: 160.h,
      width: 325.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.h),
          ),
          image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path))),
    ),
  );
}

Text CustomTextWidget(String text, double? fontSize, Color color,
    {FontWeight fontWeight = FontWeight.bold}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize, color: color, fontWeight: fontWeight ?? null),
  );
}

Widget articlesSlider(BuildContext context, ArticlesStates state) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 100.h,
        width: 230.w,
        child: PageView(
          onPageChanged: (value) {
            print("value from articles is $value");
            context.read<ArticleBloc>().add(ArticlesDotEvents(value));
          },
          children: [
            articleContainers(),
            articleContainers(),
            articleContainers(),
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 3,
        position: state.articleIndex,
      )
    ],
  );
}

Widget articleContainers() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 100.h,
      width: 230.w,
      decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ),
  );
}

Widget customSubtitle(String text,
    {Color color = Colors.black,
    double font_Size = 18,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    style: TextStyle(fontSize: font_Size, color: color, fontWeight: fontWeight),
  );
}

Widget courseButton(String text,
    {Color color = Colors.deepPurple, Color textColor = Colors.white}) {
  return Padding(
    padding: EdgeInsets.only(right: 12.0.h),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        // border: Border.all(),
        color: color,
      ),
      child: Row(
        children: [
          Container(
            child: customSubtitle(text, color: textColor, font_Size: 14.sp),
          )
        ],
      ),
    ),
  );
}
