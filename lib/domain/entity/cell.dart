enum CellType { empty, mine, number }

class Cell {
  CellType type;
  int number;
  bool isOpen;
  bool isMarked;

  Cell({required this.type, this.number = 0, this.isOpen = false, this.isMarked = false});

  Cell copyWith({CellType? type, int? number, bool? isOpen, bool? isMarked}) {
    return Cell(
      type: type ?? this.type,
      number: number ?? this.number,
      isOpen: isOpen ?? this.isOpen,
      isMarked: isMarked ?? this.isMarked,
    );
  }
}
