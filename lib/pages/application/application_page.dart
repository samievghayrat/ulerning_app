import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulerning_app/constants/colors.dart';
import 'package:ulerning_app/pages/application/application_bloc/application_States.dart';
import 'package:ulerning_app/pages/application/application_bloc/application_bloc.dart';
import 'package:ulerning_app/pages/application/application_bloc/application_events.dart';
import 'package:ulerning_app/pages/sign_in/widgets_login/widgets.dart';

import 'homepage_widgets/homepage_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          appBar: appBarLogIn('Application Page'),
          body: buildPage(_index),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primaryBlue,
            unselectedItemColor: AppColors.blackZeroFive,
            onTap: (value) {
              setState(() {
                context.read<AppBloc>().add(TriggerEvent(value));
                // value = _index;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: SizedBox(
                  height: 15.h,
                  width: 15.w,
                  child: Image.asset(
                    'assets/icons/home.png',
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
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
