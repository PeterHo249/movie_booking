import 'package:movie_booking/model/show_time.dart';

class Movie {
  final String name;
  final int year;
  final List<String> format;
  final List<String> category;
  final double rate;
  final String classified;
  final String description;
  final String poster;
  final DateTime startDate;
  final int lenght;
  final double price;
  List<ShowTime> showTimes;

  Movie({
    this.name,
    this.year,
    this.format,
    this.category,
    this.rate,
    this.classified,
    this.description,
    this.poster,
    this.startDate,
    this.lenght,
    this.price,
    this.showTimes,
  }) {
    DateTime today = DateTime.now();
    today = DateTime(today.year, today.month, today.day);

    for (int i = 0; i < showTimes.length; i++) {
      if (showTimes[i].date.isBefore(today)) {
        showTimes.removeAt(i);
      }
    }
  }

  String getStartShowDate() {
    return '${startDate.day}/${startDate.month}/${startDate.year}';
  }

  String getLenght() {
    return '${lenght ~/ 60}h ${lenght % 60}min';
  }
}
