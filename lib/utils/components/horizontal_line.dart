import 'package:flutter/material.dart';

class HorizontalLineDivider extends StatelessWidget {
  final double height;
  final Color color;

  const HorizontalLineDivider({Key key, this.height = 1, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      color: color == null ? Colors.black26 : color,
    );
  }
}
