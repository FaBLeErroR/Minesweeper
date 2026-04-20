import 'package:minesweeper/navigation/router.dart';

class AppNavigator {
  final AppRouter router;

  AppNavigator(this.router);

  void goToGame() {
    router.navigate(GameAreaScreenRoute());
  }

  void goToMenu() {
    router.popUntilRouteWithName(MenuScreenRoute().routeName);
  }

  void pop() {
    router.pop();
  }
}
