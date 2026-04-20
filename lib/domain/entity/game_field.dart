import 'package:minesweeper/domain/entity/cell.dart';

class GameField {
  final int width;
  final int height;
  final List<List<Cell>> field;
  final int mines;
  final int flags;

  const GameField({
    required this.width,
    required this.height,
    required this.field,
    required this.mines,
    required this.flags,
  });

  factory GameField.empty() {
    return const GameField(width: 0, height: 0, field: [], mines: 0, flags: 0);
  }

  GameField copyWith({List<List<Cell>>? field, int? flags}) {
    return GameField(
      width: width,
      height: height,
      field: field ?? this.field,
      mines: mines,
      flags: flags ?? this.flags,
    );
  }
}
