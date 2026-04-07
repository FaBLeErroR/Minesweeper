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
