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
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/voice_call_module.dart';
import 'package:nokhte/app/core/widgets/mobx.dart';
import 'package:nokhte/app/core/widgets/module.dart';
import 'package:nokhte/app/core/widgets/scheduling_delta/stack/stack.dart';
import 'package:nokhte/app/core/widgets/shared/constants/svg_animation_constants.dart';
import 'package:nokhte/app/core/widgets/widget_modules/beach_waves_module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/presentation.dart';

class P2PCollaboratorSessionModule extends Module {
  @override
  List<Module> get imports => [
        BeachWavesModule(),
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
        Bind.factory<BeachWavesTrackerStore>(
          (i) => BeachWavesTrackerStore(),
        ),
        Bind.singleton<MeshCircleButtonStore>(
          (i) => MeshCircleButtonStore(),
        ),
        Bind.factory<GesturePillStore>(
          (i) => GesturePillStore(
            endingPath: SvgAnimtionConstants.circlePath,
          ),
        ),
        Bind.singleton<SmartFadingAnimatedTextTrackerStore>(
          (i) => SmartFadingAnimatedTextTrackerStore(
            isInfinite: false,
          ),
        ),
        Bind.factory<FadeInAndChangeColorTextStore>(
          (i) => FadeInAndChangeColorTextStore(
            messageData: const FadeInMessageData(
              fontSize: 25.0,
              message: "swipe up to start call",
            ),
            chosenMovie: FadeInText.movie,
          ),
        ),
        Bind.singleton<SoloTextEditorTrackerStore>(
          (i) => SoloTextEditorTrackerStore(),
        ),
        Bind.singleton<BeachHorizonWaterTrackerStore>(
          (i) => BeachHorizonWaterTrackerStore(
            isGoingToFullSky: false,
          ),
        ),
        Bind.singleton<BeachSkyStore>(
          (i) => BeachSkyStore(isGoingToFullSky: false),
        ),
        Bind.singleton<SunAndMoonStore>(
          (i) => SunAndMoonStore(),
        ),
        Bind.singleton<SchedulingDeltaStore>(
          (i) => SchedulingDeltaStore(),
        ),
        Bind.singleton<CollaborativeTextEditorTrackerStore>(
          (i) => CollaborativeTextEditorTrackerStore(
            isReadOnly: false,
          ),
        ),
        Bind.singleton<ExplanationTextStore>(
          (i) => ExplanationTextStore(),
        ),
        Bind.singleton<P2PPurposePhase6WidgetsCoordinator>(
          (i) => P2PPurposePhase6WidgetsCoordinator(
            schedulingDelta: i<SchedulingDeltaStore>(),
            conveyerBelt: i<ConveyerBeltTextStore>(),
            beachSkyStore: i<BeachSkyStore>(),
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            beachHorizonWater: i<BeachHorizonWaterTrackerStore>(),
            sunAndMoon: i<SunAndMoonStore>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase1Coordinator>(
          (i) => P2PPurposePhase1Coordinator(
              newBeachWaves: Modular.get<NewBeachWavesStore>(),
              abortPurposeSessionArtifactsStore:
                  i<AbortPurposeSessionArtifactsStore>(),
              swipe: i<SwipeDetector>(),
              beachWaves: Modular.get<BeachWavesTrackerStore>(),
              fadeInColorText: Modular.get<FadeInAndChangeColorTextStore>(),
              gesturePillStore: Modular.get<GesturePillStore>(),
              fadingText: i<SmartFadingAnimatedTextTrackerStore>(),
              voiceCallCoordinator: Modular.get<VoiceCallCoordinator>()),
        ),
        Bind.singleton<P2PPurposePhase2Coordinator>(
            (i) => P2PPurposePhase2Coordinator(
                  newBeachWaves: Modular.get<NewBeachWavesStore>(),
                  abortPurposeSessionArtifactsStore:
                      i<AbortPurposeSessionArtifactsStore>(),
                  oneTalkerAtATime: Modular.get<OneTalkerAtATimeCoordinator>(),
                  explanationText: i<ExplanationTextStore>(),
                  timer: Modular.get<TimerCoordinator>(),
                  hold: Modular.get<HoldDetector>(),
                  swipe: Modular.get<SwipeDetector>(),
                  beachWaves: Modular.get<BeachWavesTrackerStore>(),
                  fadingText: i<SmartFadingAnimatedTextTrackerStore>(),
                  meshCircleStore: i<MeshCircleButtonStore>(),
                  voiceCallCoordinator: Modular.get<VoiceCallCoordinator>(),
                  questionCheckerStore: i<CheckIfUserHasTheQuestionStore>(),
                )),
        Bind.singleton<P2PPurposePhase3Coordinator>(
          (i) => P2PPurposePhase3Coordinator(
            newBeachWaves: Modular.get<NewBeachWavesStore>(),
            abortPurposeSessionArtifactsStore:
                i<AbortPurposeSessionArtifactsStore>(),
            timer: Modular.get<TimerCoordinator>(),
            swipe: Modular.get<SwipeDetector>(),
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            textEditor: Modular.get<SoloTextEditorTrackerStore>(),
            fadingText: i<SmartFadingAnimatedTextTrackerStore>(),
            soloDoc: i<SoloDocCoordinator>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase4Coordinator>(
          (i) => P2PPurposePhase4Coordinator(
            newBeachWaves: Modular.get<NewBeachWavesStore>(),
            abortPurposeSessionArtifactsStore:
                i<AbortPurposeSessionArtifactsStore>(),
            timer: Modular.get<TimerCoordinator>(),
            fadingText: i<SmartFadingAnimatedTextTrackerStore>(),
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            soloDoc: i<SoloDocCoordinator>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase5Coordinator>(
          (i) => P2PPurposePhase5Coordinator(
            abortPurposeSessionArtifactsStore:
                i<AbortPurposeSessionArtifactsStore>(),
            swipe: Modular.get<SwipeDetector>(),
            existingCollaborations:
                Modular.get<ExistingCollaborationsCoordinator>(),
            collaborativeDocDB: Modular.get<CollaborativeDocCoordinator>(),
            gesturePillStore: Modular.get<GesturePillStore>(),
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            collaborativeTextUI: i<CollaborativeTextEditorTrackerStore>(),
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
