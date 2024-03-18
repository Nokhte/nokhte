import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class GestureCross extends HookWidget {
  final Size size;
  final GestureCrossStore store;
  final GestureCrossConfiguration config;
  final bool showGlowAndOutline;
  const GestureCross({
    super.key,
    required this.store,
    required this.size,
    required this.config,
    this.showGlowAndOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.topLeft,
            width: size.width,
            height: size.height,
            child: GestureDetector(
              onTap: () => store.incrementTapCount(),
              child: MultiHitStack(
                children: [
                  Cross(
                    showGlowAndOutline: showGlowAndOutline,
                    store: store.cross,
                  ),
                  CenterCrossNokhte(
                    store: store.centerCrossNokhte,
                  ),
                  StrokeCrossNokhte(
                    store: store.strokeCrossNokhte,
                    offsets: config.getStrokeOffsets(),
                  ),
                  GradientCrossNokhte(
                    store: store.gradientNokhte,
                    info: config.getGradientInformation(),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 20),
        ),
      ],
    );
  }
}
