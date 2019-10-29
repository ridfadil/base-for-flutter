import 'package:flutter/material.dart';

class BottomCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //penggunaan path berpusat pada titik pojok kiri atas
    var path = new Path();
    //pojok kiri bawah
    path.lineTo(0.0, size.height - 50);
    //pojok kanan pajah
    var endPoint = Offset(size.width, size.height - 50);
    //lengkungan
    var lengkung = Offset(size.width / 2, size.height + 20);
    path.quadraticBezierTo(lengkung.dx, lengkung.dy, endPoint.dx, endPoint.dy);
    //pojok kanan atas
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
