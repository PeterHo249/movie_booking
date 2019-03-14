import 'package:flutter/material.dart';
import 'package:movie_booking/movie.dart';
import 'package:movie_booking/star_rating.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: GeneralInfo(),
    );
  }
}

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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildPoster(context),
              _buildNameRow(context),
              _buildShowRow(context),
              _buildRateRow(context),
              _buildDescription(context),
            ],
          ),
          _buildBuyButton(context),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${movie.rate}',
                  style: TextStyle(color: deepOrange, fontSize: 40.0),
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
          ),
          Expanded(
            flex: 7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                StarRating(
                  rate: currentRate,
                  color: Color(0x99f45716),
                  selectedColor: deepOrange,
                  onPressed: (rate) {
                    setState(() {
                      currentRate = rate;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    'Grade now',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
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
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Text(
                movie.description,
                overflow: TextOverflow.fade,
                softWrap: true,
                style: TextStyle(
                  fontSize: 15.0,
                ),
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
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 15.0,
            ),
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
      ],
    );
  }
}
