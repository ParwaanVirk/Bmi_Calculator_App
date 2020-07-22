import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, @required this.prsd});

  final Widget icon;
  final Function prsd;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: icon,
      onPressed: prsd,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

// making custom widgets
