export 'storage_content_coordinator.dart';
export 'storage_content_widgets_coordinator.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/storage/storage.dart';

class StorageContentScreen extends HookWidget {
  final StorageContentCoordinator coordinator;
  const StorageContentScreen({
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
                Padding(
                  padding:
                      EdgeInsets.only(top: height * .11, bottom: height * .15),
                  child: ContentCard(
                    store: coordinator.widgets.contentCard,
                    content: coordinator.nokhteSessionArtifacts.content,
                  ),
                ),
                FullScreen(
                  child: NokhteBlur(
                    store: coordinator.widgets.blur,
                  ),
                ),
                Center(
                  child: SmartText(
                    store: coordinator.widgets.smartText,
                    topPadding:
                        height * coordinator.widgets.smartTextTopPaddingScalar,
                    bottomPadding: height *
                        coordinator.widgets.smartTextBottomPaddingScalar,
                    subTextPadding:
                        coordinator.widgets.smartTextSubMessagePaddingScalar,
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
