import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/modules/collaborative_doc/collaborative_doc_module.dart';
import 'package:primala/app/core/modules/collaborative_doc/presentation/presentation.dart';
import 'package:primala/app/core/modules/gyroscopic/gyroscopic_module.dart';
import 'package:primala/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:primala/app/core/modules/solo_doc/mobx/mobx.dart';
import 'package:primala/app/core/modules/solo_doc/solo_doc_module.dart';
import 'package:primala/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:primala/app/core/modules/voice_call/voice_call_module.dart';
import 'package:primala/app/core/widgets/mobx.dart';
import 'package:primala/app/core/widgets/widget_constants.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/presentation.dart';

import '../../core/widgets/widgets.dart';

class P2PCollaboratorSessionModule extends Module {
  @override
  List<Module> get imports => [
        VoiceCallModule(),
        CollaborativeDocModule(),
        SoloDocModule(),
        GyroscopicModule(),
      ];

  @override
  List<Bind> get binds => [
        // & Widget State Management Stores
        Bind.factory<BeachWavesTrackerStore>(
          (i) => BeachWavesTrackerStore(),
        ),
        Bind.singleton<MeshCircleButtonStore>(
          (i) => MeshCircleButtonStore(),
        ),
        // Bind.factory<BreathingPentagonsStateTrackerStore>(
        //   (i) => BreathingPentagonsStateTrackerStore(),
        // ),
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
        Bind.singleton<CollaboratorTextEditorTrackerStore>(
          (i) => CollaboratorTextEditorTrackerStore(),
        ),
        Bind.singleton<UserTextEditorTrackerStore>(
          (i) => UserTextEditorTrackerStore(),
        ),
        Bind.singleton<CollaborativeTextEditorTrackerStore>(
          (i) => CollaborativeTextEditorTrackerStore(
            userStore: i<UserTextEditorTrackerStore>(),
            collaboratorStore: i<CollaboratorTextEditorTrackerStore>(),
          ),
        ),
        // & Coordinator Stores
        Bind.singleton<P2PPurposePhase1CoordinatorStore>(
          (i) => P2PPurposePhase1CoordinatorStore(
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            fadeInColorText: Modular.get<FadeInAndChangeColorTextStore>(),
            fadingText: i<SmartFadingAnimatedTextTrackerStore>(),
            instantiateAgoraSdkStore: i<InstantiateAgoraSdkStore>(),
            fetchAgoraTokenStore: i<FetchAgoraTokenStore>(),
            fetchChannelIdStore: i<FetchChannelIdStore>(),
            voiceCallActionsStore: i<VoiceCallActionsStore>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase2CoordinatorStore>(
            (i) => P2PPurposePhase2CoordinatorStore(
                  beachWaves: Modular.get<BeachWavesTrackerStore>(),
                  fadingText: i<SmartFadingAnimatedTextTrackerStore>(),
                  meshCircleStore: i<MeshCircleButtonStore>(),
                  // breathingPentagons:
                  //     Modular.get<BreathingPentagonsStateTrackerStore>(),
                  voiceCallActionsStore: i<VoiceCallActionsStore>(),
                  agoraCallbacksStore: i<AgoraCallbacksStore>(),
                  questionCheckerStore: i<CheckIfUserHasTheQuestionStore>(),
                )),
        Bind.singleton<P2PPurposePhase3CoordinatorStore>(
          (i) => P2PPurposePhase3CoordinatorStore(
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
            collaborativeDocDB: Modular.get<CollaborativeDocCoordinatorStore>(),
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            collaborativeTextUI: i<CollaborativeTextEditorTrackerStore>(),
            agoraCallbacksStore: i<AgoraCallbacksStore>(),
            fetchAgoraTokenStore: i<FetchAgoraTokenStore>(),
            fetchChannelIdStore: i<FetchChannelIdStore>(),
            meshCircleStore: i<MeshCircleButtonStore>(),
            voiceCallActionsStore: i<VoiceCallActionsStore>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase6CoordinatorStore>(
          (i) => P2PPurposePhase6CoordinatorStore(
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            gyroscopeStore: i<GetDirectionAngleStore>(),
          ),
        ),
      ];

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          // '/',
          '/phase-1',
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
          '/phase-3/',
          // '/',
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
          // '/',
          child: (context, args) => P2PPurpose5CollectiveCreation(
            coordinator: Modular.get<P2PPurposePhase5CoordinatorStore>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          // '/phase-6/',
          '/',
          child: (context, args) => P2PPupose6ScheduleNextMeeting(
            coordinator: Modular.get<P2PPurposePhase6CoordinatorStore>(),
          ),
          transition: TransitionType.noTransition,
        )
      ];
}
