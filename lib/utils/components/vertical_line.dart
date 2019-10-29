import 'package:flutter/material.dart';

class VerticalLineDivider extends StatelessWidget {
  final Color color;
  final double width;
  const VerticalLineDivider({this.color = Colors.black, this.width = 1});

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width,
      color: color,
    );
  }
}
