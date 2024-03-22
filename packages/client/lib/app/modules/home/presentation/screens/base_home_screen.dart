// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';

class BaseHomeScreen extends HookWidget {
  final BaseHomeScreenCoordinator coordinator;
  final GestureCrossConfiguration gestureCrossConfig;
  const BaseHomeScreen({
    super.key,
    required this.coordinator,
    required this.gestureCrossConfig,
  });

  @override
  Widget build(BuildContext context) {
    final size = useSquareSize(relativeLength: .20);
    final height = useFullScreenSize().height;
    useEffect(() {
      coordinator.constructor();
      return null;
    }, []);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Tap(
        store: coordinator.tap,
        child: Swipe(
          store: coordinator.swipe,
          child: MultiHitStack(
            children: [
              Hero(
                tag: 'beach',
                child: FullScreen(
                  child: BeachWaves(
                    store: coordinator.widgets.beachWaves,
                  ),
                ),
              ),
              FullScreen(
                child: NokhteBlur(
                  store: coordinator.widgets.nokhteBlur,
                ),
              ),
              Center(
                child: SmartText(
                  store: coordinator.widgets.secondaryErrorSmartText,
                  topPadding: height * .86,
                  bottomPadding: 0,
                  opacityDuration: Seconds.get(1),
                ),
              ),
              Center(
                child: SmartText(
                  store: coordinator.widgets.errorSmartText,
                  bottomPadding: 180,
                  opacityDuration: Seconds.get(1),
                ),
              ),
              Center(
                child: SmartText(
                  store: coordinator.widgets.primarySmartText,
                  bottomPadding: 180,
                  opacityDuration: Seconds.get(1),
                ),
              ),
              GestureCross(
                showGlowAndOutline: true,
                config: gestureCrossConfig,
                size: size,
                store: coordinator.widgets.gestureCross,
              ),
              WifiDisconnectOverlay(
                store: coordinator.widgets.wifiDisconnectOverlay,
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
