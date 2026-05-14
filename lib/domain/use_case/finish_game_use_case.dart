import 'package:minesweeper/domain/entity/game_field.dart';
import 'package:minesweeper/domain/entity/cell.dart';

class FinishGameUseCase {
  bool call(GameField game) {
    for (final row in game.field) {
      for (final cell in row) {
        if (cell.type == CellType.empty) continue;

        if (cell.type != CellType.mine && !cell.isOpen) {
          return false;
        }
      }
    }

    return true;
  }
}
