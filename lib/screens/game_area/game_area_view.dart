import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minesweeper/l10n/app_localizations.dart';
import 'package:minesweeper/screens/game_area/cubit/game_area_cubit.dart';
import 'package:minesweeper/screens/game_area/cubit/game_area_state.dart';
import 'package:minesweeper/ui/ui.dart';
import 'package:minesweeper/utils/localization_extension.dart';

class GameAreaView extends StatelessWidget {
  const GameAreaView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context).checkLocalization();
    final bloc = BlocProvider.of<GameAreaCubit>(context);

    return BlocBuilder<GameAreaCubit, GameAreaState>(
      builder: (_, state) {
        if (state.isLoading) return Center(child: CircularProgressIndicator());

        return Scaffold(
          body: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) return;

              showPauseDialog(context, bloc);
            },
            child: SafeArea(
              child: Column(
                mainAxisSize: .min,
                children: [
                  IconButton(icon: Icon(Icons.pause), onPressed: () => showPauseDialog(context, bloc)),
                  Expanded(
                    child: UiGameArea(field: state.field, onTap: bloc.openCell, onLongPress: bloc.markCell),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Row(
                      children: [
                        Text('${localization.mines}: ${bloc.getMines()}'),
                        Spacer(),
                        Text('${localization.flags}: ${bloc.getFlags()}'),
                      ],
                    ),
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
