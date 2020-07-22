import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colorcont, this.cardChild, this.onPress});

  Color colorcont;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colorcont,
        ),
      ),
    );
  }
}

// passing functions into other functions as parameters, not just variables
// watch video from bmi calculator.. video 9 . funsciton as first order object.. or the above poinnt.. it is really helpful
