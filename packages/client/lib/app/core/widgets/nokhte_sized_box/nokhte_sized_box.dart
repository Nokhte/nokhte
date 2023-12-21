import 'package:flutter/material.dart';

class NokhteSizedBox extends StatelessWidget {
  final Size size;
  final Widget child;

  const NokhteSizedBox({
    super.key,
    required this.size,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: child,
    );
  }
}
