import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minesweeper/screens/menu/cubit/menu_state.dart';
import 'package:minesweeper/navigation/router.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuState.initial()) {
    _init();
  }

  Future<void> _init() async {
    emit(state.copyWith(isLoading: false));
    Future.delayed(Duration(seconds: 2));
  }

  void navigateToGame() {
  }
}
