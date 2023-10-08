import 'package:flutter/material.dart';

class CustomRectClipper extends CustomClipper<Rect> {
  final Rect customRect;

  CustomRectClipper(this.customRect);

  @override
  Rect getClip(Size size) {
    return customRect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return oldClipper != this;
  }
}
