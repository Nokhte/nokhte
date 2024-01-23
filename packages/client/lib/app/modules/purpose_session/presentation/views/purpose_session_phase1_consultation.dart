import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/presentation.dart';

class PurposeSessionPhase1Consultation extends HookWidget {
  final PurposeSessionPhase1Coordinator coordinator;
  const PurposeSessionPhase1Consultation({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
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
      body: Tap(
        store: coordinator.tap,
        child: Hold(
          store: coordinator.hold,
          child: MultiHitStack(
            children: [
              FullScreen(
                child: BeachWaves(
                  store: coordinator.widgets.beachWaves,
                ),
              ),
              BorderGlow(
                store: coordinator.widgets.borderGlow,
              ),
              Center(
                child: SmartText(
                  topPadding: 450,
                  store: coordinator.widgets.secondarySmartText,
                  opacityDuration: Seconds.get(1),
                ),
              ),
              Center(
                  child: SmartText(
                store: coordinator.widgets.primarySmartText,
                bottomPadding: 180,
                opacityDuration: Seconds.get(1),
              )),
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
            ],
          ),
        ),
      ),
    );
  }
}
