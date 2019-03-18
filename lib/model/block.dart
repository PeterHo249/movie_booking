class Block {
  final int seatCount;
  final int rowCount;
  final int columnCount;

  Block({
    this.seatCount,
    this.rowCount,
    this.columnCount,
  });
}

class Seat {
  final String col;
  final String row;

  Seat({
    this.col,
    this.row,
  });
}
