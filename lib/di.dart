import 'dart:async';

import 'package:chapweb/data/states/localization/localization_cubit.dart';
import 'package:chapweb/data/states/menu/menu_cubit.dart';
import 'package:chapweb/data/states/settings/settings_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
FutureOr<void> configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio();
  @singleton
  LocalizationCubit get localizationCubit => LocalizationCubit();
}

class GlobalBlocProviders extends StatelessWidget {
  final Widget child;

  const GlobalBlocProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(
          create: (context) => getIt.get<SettingsBloc>(),
        ),
        BlocProvider<MenuCubit>(
          create: (context) => getIt.get<MenuCubit>(),
        ),
        BlocProvider<LocalizationCubit>(
          create: (context) => getIt.get<LocalizationCubit>(),
        ),
      ],
      child: child,
    );
  }
}
