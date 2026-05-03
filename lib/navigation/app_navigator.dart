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

  void goToGameOver() {
    router.replace(GameOverScreenRoute());
  }

  void pop() {
    router.pop();
  }
}
