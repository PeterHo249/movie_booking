import 'package:flutter/material.dart';
import 'package:movie_booking/model/block.dart';

class SeatBlock extends StatefulWidget {
  final List<Block> blocks;

  SeatBlock({
    Key key,
    this.blocks,
  }) : super(key: key);

  _SeatBlockState createState() => _SeatBlockState();
}

class _SeatBlockState extends State<SeatBlock> {
  final Color deepOrange = Color(0xfff45716);
  bool isSelectingBlock;
  int currentSelectingBlock;

  void initState() {
    super.initState();
    isSelectingBlock = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isSelectingBlock) {
      return _buildSelectingBlock(context);
    } else {
      return _buildSelectingSeat(context);
    }
  }

  Widget _buildSelectingBlock(BuildContext context) {
    List<Widget> blockWidgets = [];
    for (int i = 0; i < widget.blocks.length; i++) {
      blockWidgets.add(
        _buildBlock(
          context: context,
          block: widget.blocks[i],
          reversedSeats: [
            4,
            10,
            30,
          ],
        ),
      );
    }
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 350.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: blockWidgets,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 20.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: deepOrange),
                      color: deepOrange,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Selected',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 20.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Available',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 20.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: deepOrange.withAlpha(150)),
                      color: deepOrange.withAlpha(150),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Reserved',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSelectingSeat(BuildContext context) {
    return Container();
  }

  Widget _buildBlock({
    BuildContext context,
    Block block,
    List<int> selectedSeats,
    List<int> reversedSeats,
  }) {
    List<Widget> seats = [];

    for (int i = 0; i < block.rowCount; i++) {
      for (int j = 0; j < block.columnCount; j++) {
        if (selectedSeats != null &&
            selectedSeats.contains(i * block.columnCount + j)) {
          seats.add(
            Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                border: Border.all(color: deepOrange),
                color: deepOrange,
              ),
            ),
          );
          continue;
        }

        if (reversedSeats != null &&
            reversedSeats.contains(i * block.columnCount + j)) {
          seats.add(
            Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                border: Border.all(color: deepOrange.withAlpha(150)),
                color: deepOrange.withAlpha(150),
              ),
            ),
          );
          continue;
        }

        seats.add(
          Container(
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
          ),
        );
      }
    }

    return Container(
      height: block.rowCount * 25.0 + 10.0,
      width: block.columnCount * 25.0 + 10.0,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: block.columnCount,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          childAspectRatio: 1.0,
        ),
        children: seats,
      ),
    );
  }
}
