import 'package:flutter/material.dart';
import 'package:movie_booking/model/block.dart';
import 'package:movie_booking/model/show_time.dart';
import 'package:movie_booking/view/components/seat_block.dart';

class SelectSeat extends StatefulWidget {
  final ShowTime showTime;

  SelectSeat({Key key, this.showTime}) : super(key: key);

  _SelectSeatState createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  final Color deepOrange = Color(0xfff45716);
  final block = Block(
    rowCount: 10,
    columnCount: 6,
    seatCount: 60,
  );

  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.grey,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            color: Colors.grey,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Select Seat',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: Colors.black87,
              ),
            ),
          ),
          _buildScreen(context),
          _buildSeatBlock(context),
          _buildBookingInfo(context),
        ],
      ),
    );
  }

  Widget _buildScreen(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: deepOrange,
            ),
            height: 15.0,
            width: screenWidth * 0.6,
          ),
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.01)
              ..rotateX(5.4),
            alignment: FractionalOffset.topCenter,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      deepOrange.withAlpha(80),
                      Colors.white,
                    ]),
              ),
              height: 50.0,
              width: screenWidth * 0.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeatBlock(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width - 20.0,
        child: SeatBlock(
          block: block,
          reversedSeats: [
            Seat(col: 'A', row: '5'),
            Seat(col: 'E', row: '7'),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingInfo(BuildContext context) {
    return Hero(
      tag: 'bookingInfo',
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        height: 80.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.orange,
                deepOrange,
              ],
              stops: [
                0.0,
                0.3,
              ]),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Cinema Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      '${widget.showTime.getShowDate()} ${widget.showTime.showDescriptions[0].time}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    '\$12',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
