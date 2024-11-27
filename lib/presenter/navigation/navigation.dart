import 'package:auto_route/auto_route.dart';
import 'package:chapweb/presenter/pages/home/home.dart';
import 'package:chapweb/presenter/pages/splash/splash.dart';
part 'navigation.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeRoute.page,
          initial: true,
        ),
        AutoRoute(path: '/splash', page: SplashRoute.page),
      ];

  @override
  RouteType get defaultRouteType => const RouteType.custom(
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
}
