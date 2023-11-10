import 'package:flutter_bloc/flutter_bloc.dart';

import '../sign_in/sign_in_bloc/sign_in_bloc.dart';
import '../welcome/bloc/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (contect) => SignInBloc(),
        ),
      ];
}
