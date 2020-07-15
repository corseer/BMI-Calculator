import 'package:flutter/material.dart';

class RoundIcon extends StatelessWidget {
  RoundIcon({@required this.icon, @required this.onPress});

  final IconData icon;
  final Function onPress;

  final int age = 17;
  final int weight = 49;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 9.0,
      fillColor: Color(0xFFEB1555),
      constraints: BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
      child: Icon(icon),
    );
  }
}
