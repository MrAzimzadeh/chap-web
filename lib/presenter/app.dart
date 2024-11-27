import 'dart:ui';

import 'package:chapweb/data/states/localization/localization_cubit.dart';
import 'package:chapweb/data/states/settings/settings_selector.dart';
import 'package:chapweb/l10n/support_locale.dart';
import 'package:chapweb/presenter/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChapApp extends StatelessWidget {
  final AppRouter _router = AppRouter();

  ChapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      maximumSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      backgroundColor: Colors.black12,
      enabled: MediaQuery.sizeOf(context).shortestSide > 600,
      builder: (_) => BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          return SettingsThemeSelector(
            builder: (theme) => MaterialApp.router(
              title: 'Chap App',
              theme: theme.themeData,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: state.maybeWhen(
                loaded: (locale) => locale,
                orElse: () => const Locale('en'),
              ),
              supportedLocales: L10n.support,
              routerConfig: _router.config(),
              scrollBehavior: AppScrollBehavior(),
            ),
          );
        },
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
