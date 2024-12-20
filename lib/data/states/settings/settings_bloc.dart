import 'package:chapweb/data/states/settings/settings_event.dart';
import 'package:chapweb/data/states/settings/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<SettingsThemeChanged>(_onThemeChanged);
  }

  void _onThemeChanged(
      SettingsThemeChanged event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(theme: event.theme));
  }
}
