import 'package:flutter/material.dart';
import 'package:movie_booking/model/movie.dart';
import 'package:movie_booking/model/show_time.dart';
import 'package:movie_booking/view/select_seat.dart';
import 'package:movie_booking/view/select_show.dart';
import 'package:movie_booking/view/star_rating.dart';

class GeneralInfo extends StatefulWidget {
  GeneralInfo({
    Key key,
  }) : super(key: key);

  @override
  _GeneralInfoState createState() => _GeneralInfoState();
}

class _GeneralInfoState extends State<GeneralInfo> {
  final Color deepOrange = Color(0xfff45716);
  int currentRate = 5;
  final Movie movie = Movie(
    name: 'Coco',
    year: 2017,
    rate: 8.6,
    classified: 'PG',
    poster: 'assets/img/poster.png',
    format: ['3D', 'IMAX'],
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    category: ['Animation', 'Comedy', 'Adventure'],
    lenght: 90,
    startDate: DateTime(2017, 7, 15),
    price: 8.3,
    showTimes: [
      ShowTime(
        date: DateTime.now(),
        showDescriptions: [
          ShowDescription(
            time: '09:00',
            format: '3D',
            price: 9.0,
            cinemaNumber: 1,
          ),
          ShowDescription(
            time: '10:00',
            format: '3D',
            price: 9.0,
            cinemaNumber: 1,
          ),
          ShowDescription(
            time: '11:00',
            format: '3D',
            price: 9.0,
            cinemaNumber: 1,
          ),
          ShowDescription(
            time: '12:00',
            format: '3D',
            price: 9.0,
            cinemaNumber: 1,
          ),
        ],
      ),
      ShowTime(
        date: DateTime.now().add(
          Duration(
            days: 1,
          ),
        ),
        showDescriptions: [
          ShowDescription(
            time: '09:00',
            format: '3D',
            price: 9.0,
            cinemaNumber: 1,
          ),
          ShowDescription(
            time: '10:00',
            format: '3D',
            price: 9.0,
            cinemaNumber: 1,
          ),
          ShowDescription(
            time: '11:00',
            format: '3D',
            price: 9.0,
            cinemaNumber: 1,
          ),
          ShowDescription(
            time: '12:00',
            format: '3D',
            price: 9.0,
            cinemaNumber: 1,
          ),
        ],
      ),
    ],
  );
  @override
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          ListView(
            children: <Widget>[
              _buildPoster(context),
              _buildNameRow(context),
              _buildShowRow(context),
              _buildRateRow(context),
              _buildDescription(context),
              Container(
                height: 80.0,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(),
              _buildBuyButton(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPoster(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.height;
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          width: screenWidth,
          height: screenHeight * 0.3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                movie.poster,
              ),
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadow(
                color: deepOrange,
                blurRadius: 20.0,
                offset: Offset(
                  1.0,
                  10.0,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: FloatingActionButton(
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 35.0,
            ),
            onPressed: () {},
            backgroundColor: Colors.white.withAlpha(150),
          ),
        )
      ],
    );
  }

  Widget _buildNameRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 7,
            child: Row(
              children: <Widget>[
                Text(
                  '${movie.name}',
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    '(${movie.year})',
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Wrap(
              spacing: 5.0,
              children: movie.format.map((format) {
                return Container(
                  width: 50.0,
                  child: Center(
                    child: Text(
                      '$format',
                      style: TextStyle(
                        color: deepOrange,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    border: Border.all(
                      color: deepOrange,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShowRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Text(
        '${movie.classified} | ${movie.getLenght()} | ${movie.category.join(",")} | ${movie.getStartShowDate()}',
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.black54,
        ),
        overflow: TextOverflow.fade,
        maxLines: 1,
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildRateRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text(
                  '${movie.rate}',
                  style: TextStyle(color: deepOrange, fontSize: 40.0),
                ),
              ),
              Expanded(
                flex: 7,
                child: StarRating(
                  rate: currentRate,
                  color: Color(0x99f45716),
                  selectedColor: deepOrange,
                  onPressed: (rate) {
                    setState(() {
                      currentRate = rate;
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              'Ratings',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'Storyline',
            style: TextStyle(fontSize: 30.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              movie.description,
              overflow: TextOverflow.fade,
              softWrap: true,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBuyButton(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 80.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white12,
                Colors.white,
              ],
              stops: [
                0,
                0.2,
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onBuyTapped(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 15.0,
            ),
            child: Hero(
              tag: 'bookingInfo',
              child: Container(
                child: Center(
                  child: Text(
                    '\$${movie.price} BUY NOW',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.orange,
                      deepOrange,
                    ],
                    stops: [
                      0.2,
                      0.5,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void onBuyTapped(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SelectShow(
          movie: movie,
          onShowSelected: (selectedShow) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return SelectSeat(
                    showTime: selectedShow,
                  );
                },
              ),
            ).then((value) {
              Navigator.pop(context);
            });
          },
        );
      },
    );
  }
}
