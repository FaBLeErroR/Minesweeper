import 'package:flutter/material.dart';
import 'package:minesweeper/domain/entity/game_field.dart';
import 'package:minesweeper/domain/entity/cell.dart';

const _cellSize = 40.0;

final class UiGameArea extends StatelessWidget {
  final GameField field;
  final Function(int x, int y) onTap;
  final Function(int x, int y) onLongPress;

  const UiGameArea({super.key, required this.field, required this.onTap, required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: 10.0,
      child: SizedBox(
        width: field.width * _cellSize,
        height: field.height * _cellSize,
        child: Center(
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: field.width * field.height,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: field.width),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final x = index ~/ field.width;
              final y = index % field.width;

              final cell = field.field[x][y];

              if (cell.type == .empty) {
                return const SizedBox.shrink();
              }

              return GestureDetector(
                onTap: () => onTap(x, y),
                onLongPress: () => onLongPress(x, y),
                child: Container(
                  decoration: BoxDecoration(
                    color: cell.isOpen
                        ? Theme.of(context).colorScheme.secondaryContainer
                        : Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  margin: .all(1),
                  child: Center(child: _buildCellContent(cell)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCellContent(Cell cell) {
    if (!cell.isOpen) {
      return cell.isMarked ? Icon(Icons.flag, size: _cellSize * 0.4) : SizedBox();
    }

    if (cell.type == .mine) {
      return Icon(Icons.close, size: _cellSize * 0.4);
    }

    if (cell.number > 0) {
      return Text('${cell.number}');
    }

    return SizedBox();
  }
}
