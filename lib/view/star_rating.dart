import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int maxRate;
  final int rate;
  final Color selectedColor;
  final Color color;
  final ValueChanged<int> onPressed;
  final double size;

  StarRating({
    @required this.rate,
    this.maxRate = 10,
    this.onPressed,
    @required this.selectedColor,
    @required this.color,
    this.size = 20.0,
  })  : assert(maxRate > 0),
        assert(size > 0);

  List<bool> initStateList() {
    List<bool> state = [];
    for (int i = 0; i < maxRate; i++) {
      if (i < rate) {
        state.add(true);
      } else {
        state.add(false);
      }
    }

    return state;
  }

  List<Widget> _buildStarRow(BuildContext context) {
    var state = initStateList();
    List<Widget> stars = [];
    for (int i = 0; i < maxRate; i++) {
      stars.add(
        InkWell(
          onTap: () {
            onPressed(i + 1);
          },
          child: Icon(
            Icons.star,
            color: state[i] ? selectedColor : color,
            size: size,
          ),
        ),
      );
    }

    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _buildStarRow(context),
    );
  }
}
