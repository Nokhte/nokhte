import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/nokhte_session/presentation/mobx/coordinators/phase1/nokhte_session_phase1_coordinator.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';

class NokhteSessionPhase1Consulatation extends HookWidget {
  final NokhteSessionPhase1Coordinator coordinator;
  const NokhteSessionPhase1Consulatation({
    super.key,
    required this.coordinator,
  });
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      coordinator.constructor();
      return null;
    }, []);
    final size = useSquareSize(relativeLength: .20);
    useOnAppLifecycleStateChange(
        (previous, current) => coordinator.onAppLifeCycleStateChange(
              current,
              onResumed: () => coordinator.onResumed(),
              onInactive: () => coordinator.onInactive(),
            ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Hold(
        store: coordinator.hold,
        child: Swipe(
          store: coordinator.swipe,
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
              GestureCross(
                config: GestureCrossConfiguration(
                  top: Right(
                    NokhteGradientConfig(
                      gradientType: NokhteGradientTypes.vibrantBlue,
                    ),
                  ),
                ),
                showGlowAndOutline: true,
                size: size,
                store: coordinator.widgets.gestureCross,
              ),
              WaitingText(
                store: coordinator.widgets.waitingText,
              ),
              VoiceCallIncidentsOverlay(
                store: coordinator.voiceCall.incidentsOverlayWidgetStore,
              ),
              CollaboratorPresenceIncidentsOverlay(
                store: coordinator.presence.incidentsOverlayStore,
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
