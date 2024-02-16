// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/nokhte_session/domain/domain.dart';
import 'package:nokhte/app/modules/nokhte_session/presentation/mobx/coordinators/logic/nokhte_session_logic_coordinator.dart';
import 'nokhte_session_phase2_widgets_coordinator.dart';
part 'nokhte_session_phase2_coordinator.g.dart';

class NokhteSessionPhase2Coordinator = _NokhteSessionPhase2CoordinatorBase
    with _$NokhteSessionPhase2Coordinator;

abstract class _NokhteSessionPhase2CoordinatorBase extends BaseCoordinator
    with Store {
  final NokhteSessionPhase2WidgetsCoordinator widgets;
  final NokhteSessionPresenceCoordinator presence;
  final VoiceCallCoordinator voiceCall;
  final HoldDetector hold;
  final SwipeDetector swipe;
  final NokhteSessionLogicCoordinator logic;
  final CaptureNokhteSessionEnd captureNokhteSessionEnd;

  _NokhteSessionPhase2CoordinatorBase({
    required this.widgets,
    required this.presence,
    required this.voiceCall,
    required this.hold,
    required this.swipe,
    required this.logic,
    required this.captureNokhteSessionEnd,
    required super.captureScreen,
  });

  @action
  constructor() async {
    widgets.constructor(onWidgetsSet, onTimeExpired);
    desireToLeaveStatusReactor();
    await captureScreen(Screens.nokhteSessionPhase2);
  }

  @action
  onWidgetsSet() async =>
      await logic.changeDesireToLeave(ChangeDesireToLeaveParams.affirmative);

  @action
  onTimeExpired() async {
    await logic.changeDesireToLeave(ChangeDesireToLeaveParams.negative);
  }

  desireToLeaveStatusReactor() =>
      reaction((p0) => presence.getSessionMetadataStore.isAllowedToExit,
          (p0) async {
        if (p0) {
          await presence.dispose();
          await captureNokhteSessionEnd(NoParams());
          widgets.initTransitionBackHome();
        }
      });
}
