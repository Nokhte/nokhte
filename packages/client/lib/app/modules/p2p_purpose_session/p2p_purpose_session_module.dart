import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/modules/collaborative_doc/collaborative_doc_module.dart';
import 'package:primala/app/core/modules/solo_doc/solo_doc_module.dart';
import 'package:primala/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:primala/app/core/modules/voice_call/voice_call_module.dart';
import 'package:primala/app/core/widgets/text_editors/solo_text_editor/stack/mobx/solo_text_editor_tracker_store.dart';
import 'package:primala/app/core/widgets/widget_constants.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/presentation.dart';

import '../../core/widgets/widgets.dart';

class P2PCollaboratorSessionModule extends Module {
  @override
  List<Module> get imports => [
        VoiceCallModule(),
        CollaborativeDocModule(),
        SoloDocModule(),
      ];

  @override
  List<Bind> get binds => [
        // & Widget State Management Stores
        Bind.factory<BeachWavesTrackerStore>(
          (i) => BeachWavesTrackerStore(),
        ),
        Bind.factory<BreathingPentagonsStateTrackerStore>(
          (i) => BreathingPentagonsStateTrackerStore(),
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
                  breathingPentagons:
                      Modular.get<BreathingPentagonsStateTrackerStore>(),
                  voiceCallActionsStore: i<VoiceCallActionsStore>(),
                  agoraCallbacksStore: i<AgoraCallbacksStore>(),
                  questionCheckerStore: i<CheckIfUserHasTheQuestionStore>(),
                )),
        Bind.singleton<P2PPurposePhase3CoordinatorStore>(
          (i) => P2PPurposePhase3CoordinatorStore(
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            textEditor: Modular.get<SoloTextEditorTrackerStore>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase4CoordinatorStore>(
          (i) => P2PPurposePhase4CoordinatorStore(
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase5CoordinatorStore>(
          (i) => P2PPurposePhase5CoordinatorStore(
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
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
            // agoraEngine: Modular.get<RtcEngine>(),
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
          // '/phase-3/',
          '/',
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
      ];
}
