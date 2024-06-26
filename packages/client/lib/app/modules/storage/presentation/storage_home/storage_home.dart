export 'storage_home_coordinator.dart';
export 'storage_home_widgets_coordinator.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/storage/storage.dart';

class StorageHomeScreen extends HookWidget {
  final StorageHomeCoordinator coordinator;
  const StorageHomeScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    final center = useCenterOffset();
    final height = useFullScreenSize().height;
    useEffect(() {
      coordinator.constructor(center);
      return () => coordinator.deconstructor();
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
                FullScreen(
                  child: BeachWaves(
                    store: coordinator.widgets.beachWaves,
                  ),
                ),
                Center(
                  child: SmartText(
                    store: coordinator.widgets.primarySmartText,
                    bottomPadding: height * .75,
                    opacityDuration: Seconds.get(1),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: height * .13, bottom: height * .15),
                  child: SessionCard(
                    store: coordinator.widgets.sessionCard,
                    sessions: coordinator.nokhteSessionArtifacts,
                  ),
                ),
                FullScreen(
                  child: NokhteBlur(
                    store: coordinator.widgets.blur,
                  ),
                ),
                Center(
                  child: SmartText(
                    store: coordinator.widgets.secondarySmartText,
                    topPadding: height *
                        coordinator.widgets.base.smartTextTopPaddingScalar,
                    bottomPadding: height *
                        coordinator.widgets.base.smartTextBottomPaddingScalar,
                    subTextPadding: coordinator
                        .widgets.base.smartTextSubMessagePaddingScalar,
                    opacityDuration: Seconds.get(1),
                  ),
                ),
                GestureCross(
                  showGlowAndOutline: true,
                  config: GestureCrossConfiguration(
                    left: Right(
                      NokhteGradientConfig(
                        gradientType: NokhteGradientTypes.home,
                      ),
                    ),
                  ),
                  store: coordinator.widgets.gestureCross,
                ),
                CenterInstructionalNokhte(
                  store: coordinator.widgets.centerInstructionalNokhte,
                ),
                InstructionalGradientNokhte(
                  store: coordinator.widgets.primaryInstructionalGradientNokhte,
                ),
                WifiDisconnectOverlay(
                  store: coordinator.widgets.base.wifiDisconnectOverlay,
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
