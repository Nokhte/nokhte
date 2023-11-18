import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/collaborative_doc_module.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/presentation/presentation.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic_module.dart';
import 'package:nokhte/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:nokhte/app/core/modules/scheduling/presentation/presentation.dart';
import 'package:nokhte/app/core/modules/scheduling/scheduling_module.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/solo_doc/solo_doc_module.dart';
import 'package:nokhte/app/core/modules/timer/presentation/presentation.dart';
import 'package:nokhte/app/core/modules/timer/timer_module.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/voice_call_module.dart';
import 'package:nokhte/app/core/widgets/mobx.dart';
import 'package:nokhte/app/core/widgets/module.dart';
import 'package:nokhte/app/core/widgets/scheduling_delta/stack/stack.dart';
import 'package:nokhte/app/core/widgets/shared/constants/svg_animation_constants.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/presentation.dart';

class P2PCollaboratorSessionModule extends Module {
  @override
  List<Module> get imports => [
        VoiceCallModule(),
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
            messagesData: MessagesData.p2pPurposeSession,
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
        Bind.singleton<SchedulingWidgetsCoordinatorStore>(
          (i) => SchedulingWidgetsCoordinatorStore(
            schedulingDelta: i<SchedulingDeltaStore>(),
            conveyerBelt: i<ConveyerBeltTextStore>(),
            beachSkyStore: i<BeachSkyStore>(),
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            beachHorizonWater: i<BeachHorizonWaterTrackerStore>(),
            sunAndMoon: i<SunAndMoonStore>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase1CoordinatorStore>(
          (i) => P2PPurposePhase1CoordinatorStore(
            swipe: i<SwipeDetector>(),
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            fadeInColorText: Modular.get<FadeInAndChangeColorTextStore>(),
            gesturePillStore: Modular.get<GesturePillStore>(),
            fadingText: i<SmartFadingAnimatedTextTrackerStore>(),
            instantiateAgoraSdkStore: i<InstantiateAgoraSdkStore>(),
            fetchAgoraTokenStore: i<FetchAgoraTokenStore>(),
            fetchChannelIdStore: i<FetchChannelIdStore>(),
            voiceCallActionsStore: i<VoiceCallActionsStore>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase2CoordinatorStore>(
            (i) => P2PPurposePhase2CoordinatorStore(
                  timer: Modular.get<TimerCoordinator>(),
                  hold: Modular.get<HoldDetector>(),
                  swipe: Modular.get<SwipeDetector>(),
                  beachWaves: Modular.get<BeachWavesTrackerStore>(),
                  fadingText: i<SmartFadingAnimatedTextTrackerStore>(),
                  meshCircleStore: i<MeshCircleButtonStore>(),
                  voiceCallActionsStore: i<VoiceCallActionsStore>(),
                  agoraCallbacksStore: i<AgoraCallbacksStore>(),
                  questionCheckerStore: i<CheckIfUserHasTheQuestionStore>(),
                )),
        Bind.singleton<P2PPurposePhase3CoordinatorStore>(
          (i) => P2PPurposePhase3CoordinatorStore(
            swipe: Modular.get<SwipeDetector>(),
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            textEditor: Modular.get<SoloTextEditorTrackerStore>(),
            fadingText: i<SmartFadingAnimatedTextTrackerStore>(),
            soloDoc: i<SoloDocCoordinatorStore>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase4CoordinatorStore>(
          (i) => P2PPurposePhase4CoordinatorStore(
            fadingText: i<SmartFadingAnimatedTextTrackerStore>(),
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            soloDoc: i<SoloDocCoordinatorStore>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase5CoordinatorStore>(
          (i) => P2PPurposePhase5CoordinatorStore(
            swipe: Modular.get<SwipeDetector>(),
            collaborativeDocDB: Modular.get<CollaborativeDocCoordinatorStore>(),
            gesturePillStore: Modular.get<GesturePillStore>(),
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            collaborativeTextUI: i<CollaborativeTextEditorTrackerStore>(),
            agoraCallbacksStore: i<AgoraCallbacksStore>(),
            fetchAgoraTokenStore: i<FetchAgoraTokenStore>(),
            fetchChannelIdStore: i<FetchChannelIdStore>(),
            voiceCallActionsStore: i<VoiceCallActionsStore>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase6CoordinatorStore>(
          (i) => P2PPurposePhase6CoordinatorStore(
            swipe: Modular.get<SwipeDetector>(),
            scheduling: i<SchedulingCoordinatorStore>(),
            widgets: i<SchedulingWidgetsCoordinatorStore>(),
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
            coordinator: Modular.get<P2PPurposePhase1CoordinatorStore>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/phase-2/',
          child: (context, args) => P2PPurpose2ConsultationScreen(
            coordinator: Modular.get<P2PPurposePhase2CoordinatorStore>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          // '/',
          '/phase-3/',
          child: (context, args) => P2PPurpose3IndividualRefletionScreen(
            coordinator: Modular.get<P2PPurposePhase3CoordinatorStore>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/phase-4/',
          child: (context, args) => P2PPurpose4ReciprocateAttentionScreen(
            coordinator: Modular.get<P2PPurposePhase4CoordinatorStore>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/phase-5/',
          child: (context, args) => P2PPurpose5CollectiveCreation(
            coordinator: Modular.get<P2PPurposePhase5CoordinatorStore>(),
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
