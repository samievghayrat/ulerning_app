import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulerning_app/pages/sign_in/sign_in_bloc/sign_in_event.dart';
import 'package:ulerning_app/pages/sign_in/sign_in_bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(event.email, null));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(event.password, null));
  }
}
