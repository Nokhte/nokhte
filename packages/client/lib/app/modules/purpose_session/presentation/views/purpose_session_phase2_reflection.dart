import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/mobx/coordinators/phase2/phase2.dart';

class PurposeSessionPhase2Reflection extends HookWidget {
  final PurposeSessionPhase2Coordinator coordinator;
  const PurposeSessionPhase2Reflection({
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
    useOnAppLifecycleStateChange(
        (previous, current) => coordinator.onAppLifeCycleStateChange(
              current,
              onResumed: () => null,
              onInactive: () => null,
              onDetached: () => null,
            ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Swipe(
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
              bottomPadding: 0,
              opacityDuration: Seconds.get(1),
            )),
            Center(
              child: TextEditor(
                store: coordinator.widgets.textEditor,
                bottomPadding: 220,
                fadeInDuration: Seconds.get(1),
              ),
            ),
            GestureCross(
              showGlowAndOutline: true,
              config: GestureCrossConfiguration(
                top: Right(
                  NokhteGradientConfig(
                    gradientType: NokhteGradientTypes.vibrantBlue,
                  ),
                ),
              ),
              size: size,
              store: coordinator.widgets.unsubmittedGestureCross,
            ),
            GestureCross(
              showGlowAndOutline: true,
              config: GestureCrossConfiguration(
                bottom: Right(
                  NokhteGradientConfig(
                    gradientType: NokhteGradientTypes.vibrantBlue,
                  ),
                ),
              ),
              size: size,
              store: coordinator.widgets.submittedGestureCross,
            ),
            // add solo doc
            WifiDisconnectOverlay(
              store: coordinator.widgets.wifiDisconnectOverlay,
            ),

            // FullScreen(child: BeachWaves(store: coo,))
          ],
        ),
      ),
    );
  }
}
