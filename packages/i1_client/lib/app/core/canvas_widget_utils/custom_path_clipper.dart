import 'package:flutter/material.dart';

class CustomPathClipper extends CustomClipper<Path> {
  final Path customClipPath;

  CustomPathClipper(this.customClipPath);

  @override
  Path getClip(Size size) {
    return customClipPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
