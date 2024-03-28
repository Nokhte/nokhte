import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final height = useFullScreenSize().height;
    final size = useSquareSize(relativeLength: .20);
    useOnAppLifecycleStateChange(
        (previous, current) => coordinator.onAppLifeCycleStateChange(
              current,
              onResumed: () => coordinator.onResumed(),
              onInactive: () => coordinator.onInactive(),
            ));
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
              FullScreen(
                  child: BeachWaves(
                store: coordinator.widgets.beachWaves,
              )),
              Center(
                child: SmartText(
                  store: coordinator.widgets.smartText,
                  bottomPadding: 180,
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
                child: GradientTreeNode(
                  store: coordinator.widgets.gradientTreeNode,
                  gradient: TreeNodeGradients.yellow,
                  padding: EdgeInsets.only(top: height * .4),
                  size: size,
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
  }
}
