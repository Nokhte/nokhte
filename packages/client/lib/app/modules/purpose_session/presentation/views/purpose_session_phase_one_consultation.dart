import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/presentation.dart';

class PurposeSessionPhaseOneConsultation extends HookWidget {
  final PurposeSessionPhaseOneCoordinator coordinator;
  const PurposeSessionPhaseOneConsultation({
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
              onResumed: () => null,
              onInactive: () => null,
              onDetached: () => coordinator.onDetached(),
            ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MultiHitStack(
        children: [
          FullScreen(
            child: BeachWaves(
              store: coordinator.widgets.beachWaves,
            ),
          ),
          Center(
              child: SmartText(
            topPadding: 450,
            store: coordinator.widgets.secondarySmartText,
            opacityDuration: Seconds.get(1),
          )),
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
          )),
          WifiDisconnectOverlay(
            store: coordinator.widgets.wifiDisconnectOverlay,
          ),

          // FullScreen(child: BeachWaves(store: coo,))
        ],
      ),
    );
  }
}
