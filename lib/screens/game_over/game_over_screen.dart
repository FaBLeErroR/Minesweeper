import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minesweeper/navigation/app_navigator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:minesweeper/l10n/app_localizations.dart';
import 'package:minesweeper/ui/ui_button.dart';
import 'package:minesweeper/utils/localization_extension.dart';

@RoutePage()
class GameOverScreen extends StatelessWidget {
  const GameOverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GameOverView(navigator: GetIt.instance<AppNavigator>());
  }
}

class GameOverView extends StatelessWidget {
  final AppNavigator navigator;

  const GameOverView({super.key, required this.navigator});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context).checkLocalization();

    return Scaffold(
      body: Padding(
        padding: .all(16),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(localization.gameOver),
            SizedBox(height: 64),
            Row(
              mainAxisAlignment: .center,
              children: [
                Expanded(
                  child: UiButton(onPressed: () => navigator.goToMenu(), child: Text(localization.inMenu)),
                ),
                SizedBox(width: 8),
                UiButton(padding: 0, onPressed: () => navigator.goToGame(), width: 48, child: Icon(Icons.restart_alt)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
