import 'package:flutter/material.dart';
import 'package:movie_booking/model/block.dart';

class SeatBlock extends StatefulWidget {
  final Block block;
  final List<Seat> reversedSeats;
  final void Function(int) onTap;

  SeatBlock({
    Key key,
    this.block,
    this.reversedSeats = const <Seat>[],
    this.onTap,
  }) : super(key: key);

  _SeatBlockState createState() => _SeatBlockState();
}

class _SeatBlockState extends State<SeatBlock> {
  final Color deepOrange = Color(0xfff45716);
  List<Seat> selectedSeats;

  void initState() {
    super.initState();
    selectedSeats = <Seat>[];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildBlock(context),
        Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          children: selectedSeats.map((seat) {
            return ActionChip(
              onPressed: () {
                setState(() {
                  selectedSeats.removeWhere((testSeat) =>
                      testSeat.col == seat.col && testSeat.row == seat.row);
                  widget.onTap(selectedSeats.length);
                });
              },
              backgroundColor: deepOrange,
              label: Text(
                '${seat.col}${seat.row} x',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBlock(BuildContext context) {
    return Table(
      children: _buildSeats(context),
    );
  }

  List<TableRow> _buildSeats(BuildContext context) {
    List<TableRow> rows = [];
    var alphabets = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z'
    ];

    List<Widget> colLabel = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 20.0,
          width: 20.0,
          child: Center(
            child: Text(
              '  ',
              style: TextStyle(
                color: deepOrange,
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      ),
    ];

    for (int i = 0; i < widget.block.columnCount; i++) {
      colLabel.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 20.0,
            width: 20.0,
            child: Text(
              alphabets[i],
              style: TextStyle(
                color: deepOrange,
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      );
    }

    rows.add(
      TableRow(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: colLabel,
          ),
        ],
      ),
    );

    for (int i = 0; i < widget.block.rowCount; i++) {
      String rowNum = (i + 1) < 10 ? '0${i + 1}' : '${i + 1}';
      List<Widget> row = [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 20.0,
            width: 20.0,
            child: Text(
              '$rowNum',
              style: TextStyle(
                fontSize: 15.0,
                color: deepOrange,
              ),
            ),
          ),
        ),
      ];
      for (int j = 0; j < widget.block.columnCount; j++) {
        var currentSeat = Seat(col: alphabets[j], row: (i + 1).toString());
        var state = SeatState.available;
        if (widget.reversedSeats.any((seat) =>
            currentSeat.col == seat.col && currentSeat.row == seat.row)) {
          state = SeatState.reversed;
        } else {
          if (selectedSeats.any((seat) =>
              currentSeat.col == seat.col && currentSeat.row == seat.row)) {
            state = SeatState.selected;
          }
        }
        row.add(
          _buildSeat(
            context,
            alphabets[j],
            (i + 1).toString(),
            state,
          ),
        );
      }
      rows.add(
        TableRow(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: row,
            ),
          ],
        ),
      );
    }
    return rows;
  }

  Widget _buildSeat(
    BuildContext context,
    String col,
    String row,
    SeatState state,
  ) {
    Color backgroundColor;
    Color borderColor;

    switch (state) {
      case SeatState.available:
        backgroundColor = Colors.white;
        borderColor = Colors.black;
        break;
      case SeatState.reversed:
        borderColor = backgroundColor = deepOrange.withAlpha(150);
        break;
      case SeatState.selected:
        borderColor = backgroundColor = deepOrange;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            if (state == SeatState.available) {
              selectedSeats.add(
                Seat(
                  col: col,
                  row: row,
                ),
              );
              widget.onTap(selectedSeats.length);
            } else {
              if (state == SeatState.selected) {
                selectedSeats
                    .removeWhere((seat) => seat.col == col && seat.row == row);
                widget.onTap(selectedSeats.length);
              }
            }
          });
        },
        child: Container(
          height: 20.0,
          width: 20.0,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor),
          ),
        ),
      ),
    );
  }
}

enum SeatState {
  available,
  selected,
  reversed,
}
