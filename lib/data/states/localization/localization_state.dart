part of 'localization_cubit.dart';

@freezed
class LocalizationState with _$LocalizationState {
  const factory LocalizationState.initial() = _Initial;
  const factory LocalizationState.loaded(Locale locale) = _Loaded;
}