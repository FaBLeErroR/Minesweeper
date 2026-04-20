import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minesweeper/domain/use_case/init_game_field_use_case.dart';
import 'package:minesweeper/domain/use_case/mark_cell_use_case.dart';
import 'package:minesweeper/domain/use_case/open_cell_use_case.dart';
import 'package:minesweeper/navigation/app_navigator.dart';
import 'package:minesweeper/screens/game_area/cubit/game_area_cubit.dart';
import 'package:minesweeper/screens/game_area/game_area_view.dart';
import 'package:minesweeper/screens/menu/cubit/menu_cubit.dart';
import 'package:minesweeper/screens/menu/menu_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class GameAreaScreen extends StatelessWidget {
  const GameAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameAreaCubit>(
      create: (_) => GameAreaCubit(
        navigator: GetIt.instance<AppNavigator>(),
        initUseCase: InitGameFieldUseCase(),
        openUseCase: OpenCellUseCase(),
        markUseCase: MarkCellUseCase(),
      ),
      child: GameAreaView(),
    );
  }
}
