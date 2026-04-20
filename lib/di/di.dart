import 'package:minesweeper/navigation/app_navigator.dart';
import 'package:minesweeper/navigation/router.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

void initDependencies() {
  final router = AppRouter();

  instance.registerSingleton<AppRouter>(router);
  instance.registerSingleton<AppNavigator>(AppNavigator(router));
}
