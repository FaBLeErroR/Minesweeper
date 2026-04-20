import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minesweeper/navigation/app_navigator.dart';
import 'package:minesweeper/screens/menu/cubit/menu_cubit.dart';
import 'package:minesweeper/screens/menu/menu_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MenuCubit>(
      create: (_) => MenuCubit(navigator: GetIt.instance<AppNavigator>()),
      child: MenuView(),
    );
  }
}
