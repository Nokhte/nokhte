import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class GestureCross extends StatelessWidget {
  final Size size;
  final GestureCrossStore store;
  const GestureCross({
    super.key,
    required this.store,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return MultiHitStack(
      children: [
        GradientCrossNokhte(
          size: size,
          store: store.gradientNokhte,
        ),
        Cross(
          size: size,
          store: store.cross,
        ),
      ],
    );
  }
}
