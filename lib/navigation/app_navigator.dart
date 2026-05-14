import 'package:minesweeper/navigation/router.dart';

class AppNavigator {
  final AppRouter router;

  AppNavigator(this.router);

  void goToGame() {
    router.navigate(GameAreaScreenRoute());
  }

  void goToMenu() {
    router.popUntilRoot();

    router.replace(MenuScreenRoute());
  }

  void goToGameOver({bool isWin = false}) {
    router.replace(GameOverScreenRoute(isWin: isWin));
  }

  void pop() {
    router.pop();
  }
}
