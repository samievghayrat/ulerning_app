import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulerning_app/welcome/bloc/welcome_evengts.dart';
import 'package:ulerning_app/welcome/bloc/welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
