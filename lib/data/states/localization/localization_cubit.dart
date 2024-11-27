import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_state.dart';
part 'localization_cubit.freezed.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(const LocalizationState.initial());

  /// [setLocale] method
  /// [locale] parameter
  /// Set the locale of the application
  void setLocale(Locale locale) {
    emit(LocalizationState.loaded(locale));
  }

  /// [locale] getter
  /// Get the locale of the application
  /// Return the locale of the application
  Locale get locale => state.maybeWhen(
        loaded: (locale) => locale,
        orElse: () => const Locale('en'),
      );
}
