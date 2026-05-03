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
          body: Column(
            mainAxisSize: .min,
            children: [
              InteractiveViewer(
                maxScale: 10.0,
                child: SizedBox(
                  width: state.field.width * 40,
                  height: state.field.height * 40,
                  child: Center(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: state.field.width * state.field.height,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: state.field.width),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final x = index ~/ state.field.width;
                        final y = index % state.field.width;

                        final cell = state.field.field[x][y];

                        if (cell.type == .empty) {
                          return const SizedBox.shrink();
                        }

                        return GestureDetector(
                          onTap: () => bloc.openCell(x, y),
                          onLongPress: () => bloc.markCell(x, y),
                          child: Container(
                            decoration: BoxDecoration(
                              color: cell.isOpen ? Colors.grey : Colors.blue,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            margin: .all(1),
                            alignment: .center,
                            child: _buildCellContent(cell),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCellContent(Cell cell) {
    if (!cell.isOpen) {
      return cell.isMarked ? Icon(Icons.flag) : SizedBox();
    }

    if (cell.type == .mine) {
      return Icon(Icons.close);
    }

    if (cell.number > 0) {
      return Text('${cell.number}');
    }

    return SizedBox();
  }
}
