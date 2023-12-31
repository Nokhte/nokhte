import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/abort_purpose_session_artifacts_module.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/mobx/abort_purpose_session_artifacts_store.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/collaborative_doc_module.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic_module.dart';
import 'package:nokhte/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/one_talker_at_a_time_module.dart';
import 'package:nokhte/app/core/modules/scheduling/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/scheduling/scheduling_module.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/solo_doc/solo_doc_module.dart';
import 'package:nokhte/app/core/modules/timer/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/timer/timer_module.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/mobx/coordinator/existing_collaborations_coordinator.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/existing_collaborations_module.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/coordinator/voice_call_coordinator.dart';
import 'package:nokhte/app/core/modules/voice_call/voice_call_module.dart';
import 'package:nokhte/app/core/widgets/module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/p2p_purpose_widgets_module.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/presentation.dart';

class P2PCollaboratorSessionModule extends Module {
  @override
  List<Module> get imports => [
        P2PPurposeWidgetsModule(),
        AbortPurposeSessionArtifactsModule(),
        OneTalkerAtATimeModule(),
        VoiceCallModule(),
        ExistingCollaborationsModule(),
        CollaborativeDocModule(),
        SoloDocModule(),
        GyroscopicModule(),
        ConveyerBeltTextWidgetModule(),
        GesturesModule(),
        SchedulingModule(),
        TimerModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind.singleton<P2PPurposePhase1Coordinator>(
            (i) => P2PPurposePhase1Coordinator(
                  abortPurposeSessionArtifactsStore:
                      i<AbortPurposeSessionArtifactsStore>(),
                  swipe: i<SwipeDetector>(),
                  voiceCallCoordinator: Modular.get<VoiceCallCoordinator>(),
                  widgets: Modular.get<P2PPurposePhase1WidgetsCoordinator>(),
                )),
        Bind.singleton<P2PPurposePhase2Coordinator>(
            (i) => P2PPurposePhase2Coordinator(
                  existingCollaborations:
                      Modular.get<ExistingCollaborationsCoordinator>(),
                  abortPurposeSessionArtifactsStore:
                      i<AbortPurposeSessionArtifactsStore>(),
                  oneTalkerAtATime: Modular.get<OneTalkerAtATimeCoordinator>(),
                  timer: Modular.get<TimerCoordinator>(),
                  hold: Modular.get<HoldDetector>(),
                  swipe: Modular.get<SwipeDetector>(),
                  voiceCallCoordinator: Modular.get<VoiceCallCoordinator>(),
                  widgets: Modular.get<P2PPurposePhase2WidgetsCoordinator>(),
                )),
        Bind.singleton<P2PPurposePhase3Coordinator>(
          (i) => P2PPurposePhase3Coordinator(
            abortPurposeSessionArtifactsStore:
                i<AbortPurposeSessionArtifactsStore>(),
            timer: Modular.get<TimerCoordinator>(),
            swipe: Modular.get<SwipeDetector>(),
            soloDoc: i<SoloDocCoordinator>(),
            widgets: Modular.get<P2PPurposePhase3WidgetsCoordinator>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase4Coordinator>(
          (i) => P2PPurposePhase4Coordinator(
            widgets: Modular.get<P2PPurposePhase4WidgetsCoordinator>(),
            abortPurposeSessionArtifactsStore:
                i<AbortPurposeSessionArtifactsStore>(),
            timer: Modular.get<TimerCoordinator>(),
            soloDoc: i<SoloDocCoordinator>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase5Coordinator>(
          (i) => P2PPurposePhase5Coordinator(
            widgets: Modular.get<P2PPurposePhase5WidgetsCoordinator>(),
            abortPurposeSessionArtifactsStore:
                i<AbortPurposeSessionArtifactsStore>(),
            swipe: Modular.get<SwipeDetector>(),
            existingCollaborations:
                Modular.get<ExistingCollaborationsCoordinator>(),
            collaborativeDocDB: Modular.get<CollaborativeDocCoordinator>(),
            voiceCallCoordinator: Modular.get<VoiceCallCoordinator>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase6CoordinatorStore>(
          (i) => P2PPurposePhase6CoordinatorStore(
            abortPurposeSessionArtifactsStore:
                i<AbortPurposeSessionArtifactsStore>(),
            existingCollaborations:
                Modular.get<ExistingCollaborationsCoordinator>(),
            swipe: Modular.get<SwipeDetector>(),
            scheduling: i<SchedulingCoordinatorStore>(),
            widgets: i<P2PPurposePhase6WidgetsCoordinator>(),
            quadrantAPI: Modular.get<QuadrantAPI>(),
          ),
        ),
      ];

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          '/',
          // '/phase-1',
          child: (context, args) => P2PPurpose1GreeterScreen(
            coordinator: Modular.get<P2PPurposePhase1Coordinator>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          // '/',
          '/phase-2/',
          child: (context, args) => P2PPurpose2ConsultationScreen(
            coordinator: Modular.get<P2PPurposePhase2Coordinator>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          // '/',
          '/phase-3/',
          child: (context, args) => P2PPurpose3IndividualRefletionScreen(
            coordinator: Modular.get<P2PPurposePhase3Coordinator>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/phase-4/',
          child: (context, args) => P2PPurpose4ReciprocateAttentionScreen(
            coordinator: Modular.get<P2PPurposePhase4Coordinator>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/phase-5/',
          // '/',
          child: (context, args) => P2PPurpose5CollectiveCreation(
            coordinator: Modular.get<P2PPurposePhase5Coordinator>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/phase-6/',
          child: (context, args) => P2PPupose6ScheduleNextMeeting(
            coordinator: Modular.get<P2PPurposePhase6CoordinatorStore>(),
          ),
          transition: TransitionType.noTransition,
        )
      ];
}
