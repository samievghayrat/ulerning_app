import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulerning_app/pages/settings/settings_bloc/setting_events.dart';
import 'package:ulerning_app/pages/settings/settings_bloc/setting_states.dart';

class SettingsBloc extends Bloc<SettingEvents, SettingsStates> {
  SettingsBloc() : super(SettingsStates()) {
    on<TriggerSettings>(_triggerSettings);
  }

  void _triggerSettings(SettingEvents event, Emitter<SettingsStates> emit) {
    emit(SettingsStates());
  }
}
