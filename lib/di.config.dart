// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chapweb/data/source/api/network.dart' as _i457;
import 'package:chapweb/data/states/localization/localization_cubit.dart'
    as _i480;
import 'package:chapweb/data/states/settings/settings_bloc.dart' as _i788;
import 'package:chapweb/di.dart' as _i487;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i788.SettingsBloc>(() => _i788.SettingsBloc());
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i480.LocalizationCubit>(
        () => registerModule.localizationCubit);
    gh.singleton<_i457.NetworkManager>(
        () => _i457.NetworkManager(dio: gh<_i361.Dio>()));
    return this;
  }
}

class _$RegisterModule extends _i487.RegisterModule {}
