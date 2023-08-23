import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/presentation/mobx/beach_waves_tracker_store.dart';
import 'package:primala/app/core/widgets/breathing_pentagons/stack/presentation/mobx/main/breathing_pentagons_state_tracker_store.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/constants/constants.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/presentation/mobx/smart_fading_animated_text_tracker_store.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/domain.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/data.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/views/speak_the_collaborator_phrase_screen.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class P2PCollaboratorPoolModule extends Module {
  @override
  List<Bind> get binds => [
        /// & Shared Speech To Text Instance
        Bind.singleton<SpeechToText>((i) => SpeechToText()),

        /// % Inverted Call Hierarchy START
        /// # Mobx Mother Stores
        Bind.singleton<OnSpeechResultStore>(
          (i) => OnSpeechResultStore(),
        ),

        /// # Logic
        Bind.singleton<OnSpeechResult>(
          (i) => OnSpeechResult(
            speechResultStore: i<OnSpeechResultStore>(),
          ),
        ),

        /// % Inverted Call Hierarchy END
        // & Remote Source
        Bind.singleton<P2PCollaboratorPoolRemoteSourceImpl>(
          (i) => P2PCollaboratorPoolRemoteSourceImpl(
            onSpeechResult: i<OnSpeechResult>(),
            speechToText: i<SpeechToText>(),
            supabase: Modular.get<SupabaseClient>(),
          ),
        ),
        // & Contract Implementation
        Bind.singleton<P2PCollaboratorPoolContractImpl>(
          (i) => P2PCollaboratorPoolContractImpl(
            remoteSource: i<P2PCollaboratorPoolRemoteSourceImpl>(),
            networkInfo: Modular.get<NetworkInfo>(),
          ),
        ),
        // & Logic
        Bind.singleton<InitiateSpeechToText>(
          (i) => InitiateSpeechToText(
            contract: i<P2PCollaboratorPoolContract>(),
          ),
        ),
        Bind.singleton<StartListening>(
          (i) => StartListening(
            contract: i<P2PCollaboratorPoolContract>(),
          ),
        ),
        Bind.singleton<StopListening>(
          (i) => StopListening(
            contract: i<P2PCollaboratorPoolContract>(),
          ),
        ),
        // & MobX Getter Stores
        Bind.singleton<InitiateSpeechToTextGetterStore>(
          (i) => InitiateSpeechToTextGetterStore(
            initSpeechLogic: i<InitiateSpeechToText>(),
          ),
        ),
        Bind.singleton<StartListeningGetterStore>(
          (i) => StartListeningGetterStore(
            startListeningLogic: i<StartListening>(),
          ),
        ),
        Bind.singleton<StopListeningGetterStore>(
          (i) => StopListeningGetterStore(
            stopListeningLogic: i<StopListening>(),
          ),
        ),
        // & Widget State Management Stores
        Bind.singleton<SpeechToTextStore>(
          (i) => SpeechToTextStore(
            initSpeechToTextGetterStore: i<InitiateSpeechToTextGetterStore>(),
            startListeningGetterStore: i<StartListeningGetterStore>(),
            stopListeningGetterStore: i<StopListeningGetterStore>(),
          ),
        ),
        Bind.singleton<SmartFadingAnimatedTextTrackerStore>(
          (i) => SmartFadingAnimatedTextTrackerStore(
            isInfinite: false,
            messagesData: MessagesData.speakTheCollaboratorPhraseList,
          ),
        ),
        Bind.singleton<BreathingPentagonsStateTrackerStore>(
          (i) => BreathingPentagonsStateTrackerStore(),
        ),
        Bind.singleton<BeachWavesTrackerStore>(
          (i) => BeachWavesTrackerStore(),
        ),
        // & Mobx Mother Stores
        Bind.singleton<CustomWidgetsTrackerStore>(
          (i) => CustomWidgetsTrackerStore(
            smartFadingAnimatedTextStore:
                i<SmartFadingAnimatedTextTrackerStore>(),
            breathingPentagonsStore: i<BreathingPentagonsStateTrackerStore>(),
            beachWavesStore: i<BeachWavesTrackerStore>(),
          ),
        ),
        Bind.singleton<SpeakTheCollaboratorPhraseCoordinatorStore>(
          (i) => SpeakTheCollaboratorPhraseCoordinatorStore(
            onSpeechResultStore: i<OnSpeechResultStore>(),
            speechToTextStore: i<SpeechToTextStore>(),
            widgetStore: i<CustomWidgetsTrackerStore>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        /// Ok so here is where we actually can pass it, so I think this may
        /// mean 2 separate stores or we have a store with a parameter as to which
        /// movie to start with I think that should probably be the move here so what is the first step
        ChildRoute(
          "/",
          child: (context, args) => SpeakTheCollaboratorPhraseScreen(
            coordinatorStore:
                Modular.get<SpeakTheCollaboratorPhraseCoordinatorStore>(),
            startingWaveMovement: args.data,
            supabase: Modular.get<SupabaseClient>(),
          ),
          transition: TransitionType.noTransition,
        )
      ];
}
