import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/homepage_bloc/homepage_bloc.dart';
import 'package:ulerning_app/pages/register/register_bloc/register_bloc.dart';

import '../settings/settings_bloc/settings_bloc.dart';
import '../sign_in/sign_in_bloc/sign_in_bloc.dart';
import '../welcome/bloc/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => HomePageBloc()),
        BlocProvider(create: (context) => SettingsBloc()),
      ];
}
