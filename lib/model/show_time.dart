class ShowTime {
  final DateTime date;
  final List<ShowDescription> showDescriptions;

  ShowTime({this.date, this.showDescriptions});

  String getShowDate() {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class ShowDescription {
  final String time;
  final double price;
  final String format;
  final int cinemaNumber;

  ShowDescription({this.time, this.price, this.format, this.cinemaNumber});
}
