import 'package:flutter/material.dart';
import 'package:movie_booking/model/movie.dart';
import 'package:movie_booking/model/show_time.dart';

class SelectShow extends StatefulWidget {
  final Movie movie;
  final void Function(ShowTime) onShowSelected;

  SelectShow({this.movie, this.onShowSelected});

  @override
  _SelectShowState createState() => _SelectShowState();
}

class _SelectShowState extends State<SelectShow> {
  final Color deepOrange = Color(0xfff45716);
  final today = DateTime.now();
  int selectedIndex = 0;
  List<ShowTime> showDates;
  PageController _pageController;

  void initState() {
    super.initState();
    _pageController = PageController();
    showDates = widget.movie.showTimes.length > 3
        ? widget.movie.showTimes.sublist(0, 3)
        : widget.movie.showTimes;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> _buildDateList(BuildContext context) {
    List<Widget> results = [];

    for (int i = 0; i < showDates.length; i++) {
      Widget dateButton = InkWell(
        onTap: () {
          setState(() {
            selectedIndex = i;
            _pageController.animateToPage(
              selectedIndex,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          });
        },
        child: Center(
          child: Text(
            '${showDates[i].date.day}/${showDates[i].date.month}',
            style: TextStyle(
              color: i == selectedIndex ? deepOrange : Colors.grey,
              fontSize: 18.0,
            ),
          ),
        ),
      );

      results.add(dateButton);
    }

    return results;
  }

  List<Widget> _buildShowTimeList(BuildContext context) {
    List<Widget> results = [];

    for (int i = 0; i < showDates.length; i++) {
      var showTimeView = ListView(
        children: showDates[i].showDescriptions.map((showDescription) {
          return ListTile(
            onTap: () {
              widget.onShowSelected(ShowTime(
                date: showDates[i].date,
                showDescriptions: [showDescription],
              ));
            },
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                showDescription.time,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            title: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    showDescription.format,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    'No. ${showDescription.cinemaNumber}',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '\$${showDescription.price.toString()}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: deepOrange,
                ),
              ),
            ),
            subtitle: Divider(
              height: 25.0,
              color: Colors.grey,
            ),
          );
        }).toList(),
      );

      results.add(showTimeView);
    }

    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.orange,
                deepOrange,
              ],
              stops: [
                0,
                0.3,
              ],
            ),
          ),
          child: ListTile(
            title: Text(
              'Cinema Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${today.day}/${today.month}/${today.year}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buildDateList(context),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.40,
          child: PageView(
            controller: _pageController,
            onPageChanged: (pageIndex) {
              setState(() {
                selectedIndex = pageIndex;
              });
            },
            children: _buildShowTimeList(context),
          ),
        ),
      ],
    );
  }
}
