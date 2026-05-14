import 'dart:math';

import 'package:minesweeper/domain/entity/game_field.dart';
import 'package:minesweeper/domain/entity/cell.dart';

class InitGameFieldUseCase {
  // Параметры алгоритма клеточного автомата
  static const int _iterations = 3;
  static const double _initialWallProbability = 0.45;
  static const double _mineDensity = 0.15;

  GameField call(int width, int height) {
    final random = Random();

    // 1. Генерируем форму пещеры клеточным автоматом.
    //    true = стена, false = играбельная клетка
    final caveGrid = _generateCave(width, height, random);

    // 2. Переносим результат на игровое поле.
    //    Стены становятся CellType.empty, остальное - CellType.number(0).
    int playableCount = 0;
    final field = List.generate(width, (x) {
      return List.generate(height, (y) {
        if (caveGrid[x][y]) {
          return Cell(type: CellType.empty);
        } else {
          playableCount++;
          return Cell(type: CellType.number);
        }
      });
    });

    // 3. Количество мин - 15% от площади играбельной зоны
    //    (а не от всего прямоугольника).
    final mines = (playableCount * _mineDensity).toInt();

    // 4. Расставляем мины случайно по играбельным клеткам
    //    (rejection sampling).
    int placed = 0;
    while (placed < mines) {
      final x = random.nextInt(width);
      final y = random.nextInt(height);

      if (field[x][y].type == CellType.number) {
        field[x][y] = field[x][y].copyWith(type: CellType.mine);
        placed++;
      }
    }

    // 5. Считаем числа соседних мин для каждой играбельной клетки.
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        if (field[x][y].type != CellType.number) continue;

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

  /// Генерирует форму пещеры через клеточный автомат.
  /// Возвращает grid, где true = стена, false = пустая клетка.
  List<List<bool>> _generateCave(int width, int height, Random random) {
    // Инициализация случайным шумом: каждая клетка с вероятностью 45% - стена.
    var grid = List.generate(width, (_) => List.generate(height, (_) => random.nextDouble() < _initialWallProbability));

    // Итерации правила "5/3":
    //   - пустая клетка с >= 5 соседями-стенами становится стеной
    //   - стена с <= 3 соседями-стенами становится пустой
    // Чтение из старого grid, запись в новый - синхронное обновление.
    for (int i = 0; i < _iterations; i++) {
      final newGrid = List.generate(width, (x) => List.generate(height, (y) => grid[x][y]));

      for (int x = 0; x < width; x++) {
        for (int y = 0; y < height; y++) {
          final wallNeighbors = _countWallNeighbors(grid, x, y, width, height);

          if (!grid[x][y] && wallNeighbors >= 5) {
            newGrid[x][y] = true;
          } else if (grid[x][y] && wallNeighbors <= 3) {
            newGrid[x][y] = false;
          }
        }
      }

      grid = newGrid;
    }

    return grid;
  }

  /// Считает соседей-стен в окрестности Мура (8 клеток вокруг).
  /// Клетки за границей поля считаются стенами - это даёт естественную
  /// "оболочку" из стен по краям и не даёт пещерам вырываться наружу.
  int _countWallNeighbors(List<List<bool>> grid, int x, int y, int width, int height) {
    int count = 0;
    for (int dx = -1; dx <= 1; dx++) {
      for (int dy = -1; dy <= 1; dy++) {
        if (dx == 0 && dy == 0) continue;

        final nx = x + dx;
        final ny = y + dy;

        if (nx < 0 || ny < 0 || nx >= width || ny >= height) {
          count++;
        } else if (grid[nx][ny]) {
          count++;
        }
      }
    }
    return count;
  }
}
