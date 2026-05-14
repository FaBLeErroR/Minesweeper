import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minesweeper/navigation/app_navigator.dart';
import 'package:minesweeper/screens/menu/cubit/menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final AppNavigator _navigator;

  MenuCubit({required AppNavigator navigator}) : _navigator = navigator, super(MenuState.initial()) {
    _init();
  }

  Future<void> _init() async {
    emit(state.copyWith(isLoading: false));
    Future.delayed(Duration(seconds: 2));
  }

  void navigateToGame() {
    _navigator.goToGame();
  }
}
