import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulerning_app/pages/application/application_bloc/application_States.dart';
import 'package:ulerning_app/pages/application/application_bloc/application_events.dart';

class AppBloc extends Bloc<AppEvent, AppStates> {
  AppBloc() : super(AppStates()) {
    on<TriggerEvent>((event, emit) {
      print('The current event is: ${event.index}');
      emit(AppStates(index: event.index));
    });
  }
}
