import 'package:auto_route/auto_route.dart';
import 'package:minesweeper/screens/menu/menu_screen.dart';
import 'package:minesweeper/screens/game_area/game_area_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route,Screen')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MenuScreenRoute.page, path: '/'),
    AutoRoute(page: GameAreaScreenRoute.page, path: '/game_area'),
  ];
}
