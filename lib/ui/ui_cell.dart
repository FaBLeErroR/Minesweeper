import 'package:flutter/material.dart';

enum UiCellState { empty, mine, flag, none }

final class UiCell extends StatefulWidget {
  final UiCellState state;

  const UiCell({
    super.key,
    this.state = .none,
  });

  @override
  State<UiCell> createState() => _UiCellState();
}

// #[derive(Copy, Clone, PartialEq)]
// pub enum CellType {
//   Null,
//   Number(u8),
//   Mine,
// }
//
// #[derive(Copy, Clone)]
// pub struct Cell {
// pub p_type: CellType,
// pub f_open: bool, // Флаг, открытость ячейки
// pub f_mark: bool, // Флаг, маркировка ячейки
// }

class _UiCellState extends State<UiCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(2),
      ),
      child: switch (widget.state) {
        .empty => const SizedBox(),
        .mine => const Text('m'),
        .flag => const Text('f'),
        .none => const Text('.'),
      },
    );
  }
}
