import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minesweeper/l10n/app_localizations.dart';
import 'package:minesweeper/screens/menu/cubit/menu_cubit.dart';
import 'package:minesweeper/ui/ui.dart';

import 'cubit/menu_state.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final bloc = BlocProvider.of<MenuCubit>(context);

    return BlocBuilder<MenuCubit, MenuState>(
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(actionsPadding: EdgeInsets.only(right: 16), title: Text(localization.menuTitle)),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: UiButton(onPressed: bloc.navigateToGame, text: localization.start),
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
