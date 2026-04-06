import 'package:flutter_bloc/flutter_bloc.dart';
import 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuState.initial()) {
    _init();
  }

  Future<void> _init() async {
    emit(state.copyWith(isLoading: false));
    Future.delayed(Duration(seconds: 2));
  }
}
