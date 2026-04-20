import 'package:minesweeper/domain/entity/game_field.dart';

class MarkCellUseCase {
  GameField call(GameField game, int x, int y) {
    if (x < 0 || y < 0 || x >= game.width || y >= game.height) {
      return game;
    }

    final field = game.field.map((row) => row.map((c) => c.copyWith()).toList()).toList();

    final cell = field[x][y];

    if (cell.isOpen) return game;

    final newMarked = !cell.isMarked;

    field[x][y] = cell.copyWith(isMarked: newMarked);

    return game.copyWith(field: field, flags: game.flags + (newMarked ? 1 : -1));
  }
}
