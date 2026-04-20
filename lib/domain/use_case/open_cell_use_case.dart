import 'package:minesweeper/domain/entity/game_field.dart';
import 'package:minesweeper/domain/entity/cell.dart';

class OpenCellUseCase {
  GameField call(GameField game, int x, int y) {
    final field = _copyField(game.field);

    void open(int x, int y) {
      if (!_inBounds(game, x, y)) return;

      final cell = field[x][y];

      if (cell.isOpen || cell.isMarked) return;

      field[x][y] = cell.copyWith(isOpen: true);

      if (cell.type == CellType.number && cell.number == 0) {
        for (int dx = -1; dx <= 1; dx++) {
          for (int dy = -1; dy <= 1; dy++) {
            if (dx == 0 && dy == 0) continue;
            open(x + dx, y + dy);
          }
        }
      }
    }

    open(x, y);

    return game.copyWith(field: field);
  }

  bool _inBounds(GameField g, int x, int y) {
    return x >= 0 && y >= 0 && x < g.width && y < g.height;
  }

  List<List<Cell>> _copyField(List<List<Cell>> field) {
    return field.map((row) => row.map((c) => c.copyWith()).toList()).toList();
  }
}
