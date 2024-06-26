import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulerning_app/pages/application/application_bloc/application_bloc.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/home_page.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/homepage_bloc/homepage_bloc.dart';
import 'package:ulerning_app/pages/register/register.dart';
import 'package:ulerning_app/pages/register/register_bloc/register_bloc.dart';
import 'package:ulerning_app/pages/settings/settings_bloc/settings_bloc.dart';
import 'package:ulerning_app/pages/settings/settings_page.dart';
import 'package:ulerning_app/pages/sign_in/sign_in_bloc/sign_in_bloc.dart';
import 'package:ulerning_app/pages/sign_in/sing_in.dart';
import 'package:ulerning_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulerning_app/pages/welcome/welcome.dart';
import 'package:ulerning_app/routes/names.dart';
import 'package:ulerning_app/shared_preferences/global.dart';

import '../constants/constant.dart';
import '../pages/application/application_page.dart';

class AppPages {
  static List<PageEntity> routes = [
    PageEntity(
      route: RouteNames.INITIAL,
      page: Welcome(),
      bloc: BlocProvider(
        create: (_) => WelcomeBloc(),
      ),
    ),
    PageEntity(
      route: RouteNames.SIGN_IN,
      page: SignIn(),
      bloc: BlocProvider(
        create: (_) => SignInBloc(),
      ),
    ),
    PageEntity(
      route: RouteNames.REGISTER_PAGE,
      page: RegistrationPage(),
      bloc: BlocProvider(
        create: (_) => RegisterBloc(),
      ),
    ),
    PageEntity(
      route: RouteNames.APPLICATION_PAGE,
      page: ApplicationPage(),
      bloc: BlocProvider(
        create: (_) => AppBloc(),
      ),
    ),
    PageEntity(
      route: RouteNames.HOME_PAGE,
      page: HomePage(),
      bloc: BlocProvider(
        create: (_) => HomePageBloc(),
      ),
    ),
    PageEntity(
      route: RouteNames.SETTINGS_PAGE,
      page: SettingsPage(),
      bloc: BlocProvider(
        create: (_) => SettingsBloc(),
      ),
    ),
  ];

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes) {
      if (bloc.bloc != null) {
        blocProviders.add(bloc.bloc);
      }
    }
    return blocProviders;
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes.where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        print("first log");
        bool deviceFirstOpen = Global.storageServices.getDeviceFirstOpen();
        if (deviceFirstOpen) {
          return MaterialPageRoute(
              builder: (_) => Welcome(), settings: settings);
        } else {
          bool isLoggedIn = Global.storageServices.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (builder) => const ApplicationPage(),
                settings: settings);
          }

          print("second log");
          Global.storageServices
              .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, false);
          return MaterialPageRoute(
              builder: (builder) => const SignIn(), settings: settings);
        }
        // print('valid route ${settings.name}');
        // if (result.first.route == RouteNames.INITIAL && deviceFirstOpen) {
      }
      // return MaterialPageRoute(
      //     builder: (builder) => result.first.page, settings: settings);
      // }
    }
    print('Invalid route name ${settings.name}');
    return MaterialPageRoute(
        builder: (context) => const SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
