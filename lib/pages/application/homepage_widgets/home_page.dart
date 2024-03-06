import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'homepage_bloc/homepage_bloc.dart';
import 'homepage_bloc/homepage_states.dart';
import 'homepage_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(),
      body: BlocBuilder<HomePageBloc, HomePageStates>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(12.h),
            child: CustomScrollView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      sliderShow(context, state),
                      // CustomTextWidget("Interesting Articles", 16.0, Colors.blue),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 10.h),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      customSubtitle("Choose your course",
                          font_Size: 16.h, fontWeight: FontWeight.bold),
                      customSubtitle("See all",
                          font_Size: 13.h,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 10.sp),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      courseButton("All"),
                      courseButton("Popular",
                          color: Colors.grey, textColor: Colors.white),
                      courseButton("Newest",
                          color: Colors.grey, textColor: Colors.white),
                    ],
                  ),
                ),
                SliverPadding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 0.w)),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.6),
                  delegate: SliverChildBuilderDelegate(
                    childCount: 4,
                    (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          print("Course list was tapped");
                        },
                        child: Container(
                          padding: EdgeInsets.all(12.w),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage("assets/icons/Image_1.png"))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                "Best course in IT",
                                13.sp,
                                Colors.white,
                              ),
                              customSubtitle("40/45 vocabularies",
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  font_Size: 10.sp)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // BlocProvider<ArticleBloc>(
                //   create: (context) =>
                //       ArticleBloc(), // Replace with your ArticleBloc creation logic
                //   child: BlocBuilder<ArticleBloc, ArticlesStates>(
                //     builder: (context, state2) {
                //       return articlesSlider(context, state2);
                //     },
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
