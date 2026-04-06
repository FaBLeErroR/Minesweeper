import 'package:flutter/material.dart';
import 'package:minesweeper/screens/menu/cubit/menu_cubit.dart';
import 'package:minesweeper/screens/menu/menu_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MenuCubit>(create: (_) => MenuCubit(), child: MenuView());
  }
}
