import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minesweeper/domain/entity/cell.dart';
import 'package:minesweeper/domain/entity/game_field.dart';
import 'package:minesweeper/l10n/app_localizations.dart';
import 'package:minesweeper/screens/game_area/cubit/game_area_cubit.dart';
import 'package:minesweeper/utils/localization_extension.dart';

import 'cubit/game_area_state.dart';

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
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: state.field.width * state.field.height,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: state.field.width),
                itemBuilder: (context, index) {
                  final x = index ~/ state.field.width;
                  final y = index % state.field.width;

                  final cell = state.field.field[x][y];

                  return GestureDetector(
                    onTap: () => bloc.openCell(x, y),
                    onLongPress: () => bloc.markCell(x, y),
                    child: Container(
                      margin: EdgeInsets.all(2),
                      color: cell.isOpen ? Colors.grey : Colors.blue,
                      child: Center(child: _buildCellContent(cell)),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCellContent(Cell cell) {
    if (!cell.isOpen) {
      return cell.isMarked ? Icon(Icons.flag) : SizedBox();
    }

    if (cell.type == CellType.mine) {
      return Icon(Icons.close);
    }

    if (cell.number > 0) {
      return Text('${cell.number}');
    }

    return SizedBox();
  }
}
