// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'canvas/beach_waves_painter.dart';

class BeachWaves extends HookWidget {
  final BeachWavesStore store;
  const BeachWaves({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) => Observer(
      builder: (context) => Opacity(
            opacity: useWidgetOpacity(store.currentStore.showWidget),
            child: NokhteCustomAnimationBuilder(
              tween: store.currentMovie,
              duration: store.currentMovie.duration,
              control: store.currentControl,
              onCompleted: () => store.onCompleted(),
              builder: (context, value, child) {
                final currentAnimationValues =
                    GetCurrentWaterAnimation.values(value);
                store.setCurrentAnimationValues(currentAnimationValues);
                return CustomPaint(
                  painter: BeachWavesPainter(
                    waterValue: currentAnimationValues.first,
                    shouldPaintSand: store.shouldPaintSandOnCurrent,
                    colorsList: [
                      currentAnimationValues[1],
                      currentAnimationValues[2],
                      currentAnimationValues[3],
                      currentAnimationValues[4],
                      currentAnimationValues[5],
                      currentAnimationValues[6],
                      currentAnimationValues[7],
                      currentAnimationValues[8]
                    ],
                    stopsList: [
                      currentAnimationValues[9],
                      currentAnimationValues[10],
                      currentAnimationValues[11],
                      currentAnimationValues[12],
                      currentAnimationValues[13],
                      currentAnimationValues[14],
                      currentAnimationValues[15],
                      currentAnimationValues[16],
                    ],
                  ),
                  size: MediaQuery.of(context).size,
                );
              },
            ),
          ));
}
