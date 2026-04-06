import 'package:auto_route/auto_route.dart';
import 'package:minesweeper/screens/menu/menu_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [AutoRoute(page: MainRoute.page, path: '/')];
}
