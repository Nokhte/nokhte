// ignore_for_file: must_be_immutable
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';

class HomeScreenPhase0RootDecider extends HookWidget {
  final HomeScreenPhase0Coordinator coordinator;
  const HomeScreenPhase0RootDecider({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    final size = useSquareSize(relativeLength: .20);
    useEffect(() {
      coordinator.constructor();
      return null;
    }, []);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MultiHitStack(
        children: [
          Hero(
            tag: "beach",
            child: FullScreen(
                child: BeachWaves(
              store: coordinator.widgets.beachWaves,
            )),
          ),
          GestureCross(
            config: GestureCrossConfiguration(
              top: Right(
                NokhteGradientConfig(
                  gradientType: NokhteGradientTypes.vibrantBlue,
                ),
              ),
            ),
            size: size,
            store: coordinator.widgets.gestureCross,
          ),
          WifiDisconnectOverlay(
            store: coordinator.widgets.wifiDisconnectOverlay,
          ),
        ],
      ),
      // ),
    );
  }
}
