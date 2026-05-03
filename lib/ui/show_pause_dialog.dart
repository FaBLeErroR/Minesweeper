import 'package:flutter/material.dart';
import 'package:minesweeper/l10n/app_localizations.dart';
import 'package:minesweeper/screens/game_area/cubit/game_area_cubit.dart';
import 'package:minesweeper/ui/ui_button.dart';
import 'package:minesweeper/utils/localization_extension.dart';

void showPauseDialog(BuildContext context, GameAreaCubit bloc) {
  final localization = AppLocalizations.of(context).checkLocalization();

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: .min,
          children: [
            Text(localization.pause, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: .min,
              children: [
                Expanded(
                  child: UiButton(onPressed: () => Navigator.pop(context), child: const Icon(Icons.play_arrow)),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: UiButton(
                    onPressed: () {
                      Navigator.pop(context);
                      bloc.restart();
                    },
                    child: const Icon(Icons.restart_alt),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            UiButton(
              onPressed: () {
                Navigator.pop(context);
                bloc.pop();
              },
              child: Text(localization.inMenu),
            ),
          ],
        ),
      ),
    ),
  );
}
