import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minesweeper/l10n/app_localizations.dart';
import 'package:minesweeper/screens/game_area/cubit/game_area_cubit.dart';
import 'package:minesweeper/ui/ui.dart';

import 'cubit/game_area_state.dart';

class GameAreaView extends StatelessWidget {
  const GameAreaView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return BlocBuilder<GameAreaCubit, GameAreaState>(
      builder: (_, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: UiButton(onPressed: () {}, text: 'Начать'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
