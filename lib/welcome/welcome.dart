import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulerning_app/welcome/bloc/welcome_blocs.dart';
import 'package:ulerning_app/welcome/bloc/welcome_evengts.dart';

import '../constants/colors.dart';
import 'bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WelcomeBloc, WelcomeState>(builder: (context, state) {
        return Center(
          // Center the container horizontally
          child: Container(
            margin: EdgeInsets.only(top: 34.h),
            width: MediaQuery.of(context).size.width * 0.9, // Adjusted width
            child: Stack(
              children: [
                PageView(
                  onPageChanged: (index) {
                    state.page = index;
                    print(index);
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    reusableWidget(1, context, 'This is title',
                        'This is subtitle', "next", "This is imagePaht"),
                    reusableWidget(2, context, 'This is title',
                        'This is subtitle', "next", "This is imagePaht"),
                    reusableWidget(3, context, 'This is title',
                        'This is subtitle', "finish", "This is imagePaht"),
                  ],
                ),
                Positioned(
                  bottom: 70.h,
                  left: 0, // Adjusted position
                  right: 0, // Adjusted position
                  child: DotsIndicator(
                    position: state.page,
                    mainAxisAlignment: MainAxisAlignment.center,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                      color: Colors.grey,
                      activeColor: Colors.blue,
                      size: const Size.square(8),
                      activeSize: Size(18, 8),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

// The reusableWidget function remains the same.

Widget reusableWidget(
  int index,
  BuildContext context,
  String title,
  String subTitle,
  String buttonName,
  String imagePath,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
          width: 345.w, height: 345.h, child: Center(child: Text(imagePath))),
      Container(
        width: 345.w,

        // color: Colors.red,
        // width: 345.w,
        // height: 345.h,
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 24.sp,
                color: blackColor,
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        width: 375.w,
        child: Center(
          child: Text(
            subTitle,
            style: TextStyle(
                fontSize: 14.sp,
                color: blackColor.withOpacity(0.5),
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
        width: 375.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: Colors.blue,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1))
            ],
            borderRadius: BorderRadius.all(Radius.circular(15.w))),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
                fontSize: 16.sp,
                color: blackColor.withOpacity(0.5),
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
    ],
  );
}
