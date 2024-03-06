import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulerning_app/constants/colors.dart';
import 'package:ulerning_app/pages/application/application_bloc/application_States.dart';
import 'package:ulerning_app/pages/application/application_bloc/application_bloc.dart';
import 'package:ulerning_app/pages/application/application_bloc/application_events.dart';

import 'homepage_widgets/homepage_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  // int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          body: Center(child: buildPage(state.index)),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ]),
            child: BottomNavigationBar(
              currentIndex: 4,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryBlackColor,
              unselectedItemColor: AppColors.blackZeroFive,
              onTap: (value) {
                setState(() {
                  context.read<AppBloc>().add(TriggerEvent(value));
                  // value = _index;
                });
              },
              items: bottomTubs,
            ),
          ),
        ),
      );
    });
  }
}
