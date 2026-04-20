import 'dart:math';

import 'package:minesweeper/domain/entity/game_field.dart';
import 'package:minesweeper/domain/entity/cell.dart';

class InitGameFieldUseCase {
  GameField call(int width, int height) {
    final random = Random();

    final field = List.generate(width, (_) => List.generate(height, (_) => Cell(type: CellType.number)));

    final mines = (width * height * 0.15).toInt();

    int placed = 0;

    while (placed < mines) {
      final x = random.nextInt(width);
      final y = random.nextInt(height);

      if (field[x][y].type == CellType.number) {
        field[x][y] = field[x][y].copyWith(type: CellType.mine);
        placed++;
      }
    }

    // расставляем числа
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        if (field[x][y].type == CellType.mine) continue;

        int count = 0;

        for (int dx = -1; dx <= 1; dx++) {
          for (int dy = -1; dy <= 1; dy++) {
            if (dx == 0 && dy == 0) continue;

            final nx = x + dx;
            final ny = y + dy;

            if (nx >= 0 && ny >= 0 && nx < width && ny < height && field[nx][ny].type == CellType.mine) {
              count++;
            }
          }
        }

        field[x][y] = field[x][y].copyWith(number: count);
      }
    }

    return GameField(width: width, height: height, field: field, mines: mines, flags: 0);
  }
}
