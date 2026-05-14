import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minesweeper/domain/entity/cell.dart';
import 'package:minesweeper/domain/entity/game_field.dart';
import 'package:minesweeper/domain/use_case/finish_game_use_case.dart';
import 'package:minesweeper/domain/use_case/init_game_field_use_case.dart';
import 'package:minesweeper/domain/use_case/mark_cell_use_case.dart';
import 'package:minesweeper/domain/use_case/open_cell_use_case.dart';
import 'package:minesweeper/navigation/app_navigator.dart';
import 'package:minesweeper/screens/game_area/cubit/game_area_state.dart';

class GameAreaCubit extends Cubit<GameAreaState> {
  final AppNavigator _navigator;

  final InitGameFieldUseCase _initUseCase;
  final OpenCellUseCase _openUseCase;
  final MarkCellUseCase _markUseCase;
  final FinishGameUseCase _finishGameUseCase;

  GameAreaCubit({
    required AppNavigator navigator,
    required InitGameFieldUseCase initUseCase,
    required OpenCellUseCase openUseCase,
    required MarkCellUseCase markUseCase,
    required FinishGameUseCase finishGameUseCase,
  }) : _navigator = navigator,
       _initUseCase = initUseCase,
       _openUseCase = openUseCase,
       _markUseCase = markUseCase,
       _finishGameUseCase = finishGameUseCase,
       super(GameAreaState.initial()) {
    _init();
  }

  Future<void> _init() async {
    GameField field = _initUseCase(20, 20);
    emit(state.copyWith(field: field, isLoading: false));
  }

  void openCell(int x, int y) {
    GameField field = _openUseCase(state.field, x, y);
    emit(state.copyWith(field: field));

    if (state.field.field[x][y].type == CellType.mine) {
      _goToGameOver();
    } else if (_finishGameUseCase(state.field)) {
      _goToGameOver(isWin: true);
    }
  }

  void markCell(int x, int y) {
    GameField field = _markUseCase(state.field, x, y);
    emit(state.copyWith(field: field));
  }

  int getFlags() {
    return state.field.flags;
  }

  int getMines() {
    return state.field.mines;
  }

  void restart() {
    _init();
  }

  void pop() {
    _navigator.pop();
  }

  void _goToGameOver({bool isWin = false}) {
    _navigator.goToGameOver(isWin: isWin);
  }
}
