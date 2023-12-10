import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class HiddenSide extends StatelessWidget {
  final TextRevealDirection textRevealDirection;
  final Color hiddenSideColor;
  final Size size;
  const HiddenSide({
    super.key,
    required this.textRevealDirection,
    required this.hiddenSideColor,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return textRevealDirection == TextRevealDirection.fromLeft
        ? Row(
            children: [
              Expanded(child: Container()),
              Container(
                width: size.width,
                height: size.height,
                color: hiddenSideColor,
              ),
            ],
          )
        : Row(
            children: [
              Container(
                width: size.width,
                height: size.height,
                color: hiddenSideColor,
              ),
              Expanded(child: Container()),
            ],
          );
  }
}
