import 'package:chapweb/di.dart';
import 'package:chapweb/presenter/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(
    GlobalBlocProviders(
      child: ChapApp(),
    ),
  );
}
