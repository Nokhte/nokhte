import 'package:flutter/material.dart';

class GestureCrossPainter extends CustomPainter {
  Path path;
  late Paint myPaint;
  Color firstGradientColor;
  Color secondGradientColor;

  GestureCrossPainter(
    this.path,
    Size size, {
    required this.firstGradientColor,
    required this.secondGradientColor,
  }) {
    myPaint = Paint()
      ..shader = RadialGradient(
          radius: 1,
          // focalRadius: 20.5,
          center: Alignment(
            0.0,
            1.0 - ((path.getBounds().height * .3) / path.getBounds().height),
            // path.getBounds().bottom,
            // path.getBounds().bottom,
          ),
          colors: [
            firstGradientColor,
            secondGradientColor,
          ],
          stops: const [
            -.5,
            2,
          ]).createShader(
        path.getBounds(),
      );
    // myPaint = Paint()
    //   ..shader = LinearGradient(
    //       begin: Alignment.bottomCenter,
    //       end: Alignment.topCenter,
    //       colors: [
    //         firstGradientColor,
    //         secondGradientColor,
    //       ],
    //       stops: const [
    //         .2,
    //         2,
    //       ]).createShader(
    //     path.getBounds(),
    //   );
  }

  @override
  void paint(Canvas canvas, Size size) => canvas.drawPath(path, myPaint);

  @override
  bool shouldRepaint(GestureCrossPainter oldDelegate) => true;
}
