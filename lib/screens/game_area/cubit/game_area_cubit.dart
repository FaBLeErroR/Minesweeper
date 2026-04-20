import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minesweeper/domain/entity/game_field.dart';
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

  GameAreaCubit({
    required AppNavigator navigator,
    required InitGameFieldUseCase initUseCase,
    required OpenCellUseCase openUseCase,
    required MarkCellUseCase markUseCase,
  }) : _navigator = navigator,
       _initUseCase = initUseCase,
       _openUseCase = openUseCase,
       _markUseCase = markUseCase,
       super(GameAreaState.initial()) {
    _init();
  }

  Future<void> _init() async {
    GameField field = _initUseCase(10, 10);
    emit(state.copyWith(field: field, isLoading: false));
  }

  void openCell(int x, int y) {
    GameField field = _openUseCase(state.field, x, y);
    emit(state.copyWith(field: field));
  }

  void markCell(int x, int y) {
    GameField field = _markUseCase(state.field, x, y);
    emit(state.copyWith(field: field));
  }

  void pop() {
    _navigator.pop();
  }
}
