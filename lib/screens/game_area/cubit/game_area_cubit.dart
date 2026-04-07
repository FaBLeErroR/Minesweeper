import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_area_state.dart';

class GameAreaCubit extends Cubit<GameAreaState> {
  GameAreaCubit() : super(GameAreaState.initial()) {
    _init();
  }

  Future<void> _init() async {
    emit(state.copyWith(isLoading: false));
    Future.delayed(Duration(seconds: 2));
  }
}
