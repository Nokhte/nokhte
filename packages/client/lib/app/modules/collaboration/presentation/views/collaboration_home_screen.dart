import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';

class CollaborationHomeScreen extends HookWidget {
  final CollaborationHomeScreenCoordinator coordinator;
  const CollaborationHomeScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    final size = useSquareSize(relativeLength: .20);
    final width = useFullScreenSize().width;
    final height = useFullScreenSize().height;
    useEffect(() {
      coordinator.constructor();
      return null;
    }, []);

    return Observer(builder: (context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Tap(
          store: coordinator.tap,
          child: Swipe(
            store: coordinator.swipe,
            child: MultiHitStack(
              children: [
                RotatedBox(
                  quarterTurns: 2,
                  child: FullScreen(
                    child: BeachWaves(
                      sandType: SandTypes.collaboration,
                      store: coordinator.widgets.primaryBeachWaves,
                    ),
                  ),
                ),
                Opacity(
                  opacity: useWidgetOpacity(
                      coordinator.widgets.showSecondaryBeachWaves),
                  child: FullScreen(
                    child: BeachWaves(
                      sandType: SandTypes.home,
                      store: coordinator.widgets.secondaryBeachWaves,
                    ),
                  ),
                ),
                FullScreen(
                  child: TouchRipple(
                    store: coordinator.widgets.touchRipple,
                  ),
                ),
                AnimatedOpacity(
                  opacity: useWidgetOpacity(coordinator.widgets.showQrCode),
                  duration: Seconds.get(1),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: height * .10),
                    child: Center(
                      child: QrImageView(
                        data: coordinator.deepLinks.link,
                        size: width * .5,
                        dataModuleStyle: const QrDataModuleStyle(
                          color: Colors.white,
                          // dataModuleShape: QrDataModuleShape.circle,
                          dataModuleShape: QrDataModuleShape.square,
                        ),
                        eyeStyle: const QrEyeStyle(
                            color: Colors.white, eyeShape: QrEyeShape.square),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SmartText(
                    store: coordinator.widgets.smartText,
                    topPadding: height * .2,
                    opacityDuration: Seconds.get(1),
                  ),
                ),
                GestureCross(
                  config: GestureCrossConfiguration(
                    bottom: Right(
                      NokhteGradientConfig(
                        gradientType: NokhteGradientTypes.onShore,
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
          ),
        ),
        // ),
      );
    });
  }
}
