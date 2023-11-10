import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulerning_app/pages/register/register_bloc/register_events.dart';
import 'package:ulerning_app/pages/register/register_bloc/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBloc() : super(RegisterStates()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfPasswordEvent>(_confPasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyUserName(event.userName));
    print('Username is ${event.userName}');
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyEmail(event.email));
    print('Email from Register Screen is ${event.email}');
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyPassword(event.password));
    print('Password from register screen is ${event.password}');
  }

  void _confPasswordEvent(
      ConfPasswordEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyConfPassword(event.confPassword));
    print('Confirm passwor is ${event.confPassword}');
  }
}
