import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/presentation.dart';

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
              onResumed: () => coordinator.onResumed(),
              onInactive: () => coordinator.onInactive(),
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
            NokhteBlur(
              store: coordinator.widgets.nokhteBlur,
            ),
            Center(
              child: SmartText(
                store: coordinator.widgets.errorText,
                bottomPadding: 180,
                opacityDuration: Seconds.get(1),
              ),
            ),
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
