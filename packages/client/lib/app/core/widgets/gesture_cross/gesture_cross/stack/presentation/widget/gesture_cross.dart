import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class GestureCross extends StatelessWidget {
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
    return Observer(
      builder: (context) => Column(
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
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                  onTap: () => store.incrementTapCount(),
                  child: MultiHitStack(
                    children: [
                      Cross(
                        showGlowAndOutline: showGlowAndOutline,
                        size: size,
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
                        offsets: config.getGradientOffsets(),
                        store: store.gradientNokhte,
                        gradientColorLengths: config.gradientColorLengths,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
          ),
        ],
      ),
    );
  }
}
