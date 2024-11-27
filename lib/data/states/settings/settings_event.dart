import 'package:chapweb/presenter/themes/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_event.freezed.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.themeChanged(AppTheme theme) = SettingsThemeChanged;
}
