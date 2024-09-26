export 'storage_home_coordinator.dart';
export 'storage_home_widgets_coordinator.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
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
    final height = useFullScreenSize().height;
    useEffect(() {
      coordinator.constructor();
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
                    bottomPadding: .75,
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
                    topPadding: .15,
                    topBump: .002,
                    opacityDuration: Seconds.get(1),
                  ),
                ),
                GestureCross(
                  showGlowAndOutline: true,
                  config: GestureCrossConfiguration(
                    left: Right(EmptySpace()),
                  ),
                  store: coordinator.widgets.gestureCross,
                ),
                CenterNokhte(
                  store: coordinator.widgets.centerNokhte,
                ),
                SwipeGuide(
                    store: coordinator.widgets.swipeGuide,
                    orientations: const [SwipeGuideOrientation.left]),
                AuxiliaryNokhte(
                  store: coordinator.widgets.homeNokhte,
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
