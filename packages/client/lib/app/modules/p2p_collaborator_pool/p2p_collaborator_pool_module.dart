// ignore_for_file: prefer_const_constructors

import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/core/widgets/widget_constants.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/main/collaborator_pool_screen_coordinator_store.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/presentation.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/domain.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/data.dart';
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
        Bind.singleton<EnterCollaboratorPool>(
          (i) => EnterCollaboratorPool(
            contract: i<P2PCollaboratorPoolContract>(),
          ),
        ),
        Bind.singleton<ExitCollaboratorPool>(
          (i) => ExitCollaboratorPool(
            contract: i<P2PCollaboratorPoolContract>(),
          ),
        ),
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
        Bind.singleton<ValidateQuery>(
          (i) => ValidateQuery(
            contract: i<P2PCollaboratorPoolContract>(),
          ),
        ),
        // & MobX Getter Stores
        Bind.singleton<EnterCollaboratorPoolGetterStore>(
          (i) => EnterCollaboratorPoolGetterStore(
            enterPoolLogic: i<EnterCollaboratorPool>(),
          ),
        ),
        Bind.singleton<ExitCollaboratorPoolGetterStore>(
          (i) => ExitCollaboratorPoolGetterStore(
            exitPoolLogic: i<ExitCollaboratorPool>(),
          ),
        ),
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
        Bind.singleton<ValidateQueryGetterStore>(
          (i) => ValidateQueryGetterStore(
            validateQueryLogic: i<ValidateQuery>(),
          ),
        ),

        // & Widget State Management Stores
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
        // & Widget Manager Store
        Bind.singleton<CustomWidgetsTrackerStore>(
          (i) => CustomWidgetsTrackerStore(
            smartFadingAnimatedTextStore:
                i<SmartFadingAnimatedTextTrackerStore>(),
            breathingPentagonsStore: i<BreathingPentagonsStateTrackerStore>(),
            beachWavesStore: i<BeachWavesTrackerStore>(),
          ),
        ),
        // & Mobx Mother Stores
        Bind.singleton<EnterCollaboratorPoolStore>(
          (i) => EnterCollaboratorPoolStore(
            enterCollaboratorPoolGetterStore:
                i<EnterCollaboratorPoolGetterStore>(),
          ),
        ),
        Bind.singleton<ExitCollaboratorPoolStore>(
          (i) => ExitCollaboratorPoolStore(
            exitCollaboratorPoolGetterStore:
                i<ExitCollaboratorPoolGetterStore>(),
          ),
        ),
        Bind.singleton<SpeechToTextStore>(
          (i) => SpeechToTextStore(
            initSpeechToTextGetterStore: i<InitiateSpeechToTextGetterStore>(),
            startListeningGetterStore: i<StartListeningGetterStore>(),
            stopListeningGetterStore: i<StopListeningGetterStore>(),
          ),
        ),
        Bind.singleton<ValidateQueryStore>(
          (i) => ValidateQueryStore(
            validateQueryGetterStore: i<ValidateQueryGetterStore>(),
          ),
        ),
        // & Coordinator Stores
        Bind.singleton<SpeakTheCollaboratorPhraseCoordinatorStore>(
          (i) => SpeakTheCollaboratorPhraseCoordinatorStore(
            enterCollaboratorPoolStore: i<EnterCollaboratorPoolStore>(),
            validateQueryStore: i<ValidateQueryStore>(),
            onSpeechResultStore: i<OnSpeechResultStore>(),
            speechToTextStore: i<SpeechToTextStore>(),
            widgetStore: i<CustomWidgetsTrackerStore>(),
          ),
        ),
        Bind.singleton<CollaboratorPoolScreenCoordinatorStore>(
          (i) => CollaboratorPoolScreenCoordinatorStore(
            exitCollaboratorPoolStore: i<ExitCollaboratorPoolStore>(),
            widgetStore: i<CustomWidgetsTrackerStore>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => SpeakTheCollaboratorPhraseScreen(
            coordinatorStore:
                Modular.get<SpeakTheCollaboratorPhraseCoordinatorStore>(),
            startingWaveMovement: args.data,
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          "/pool/",
          child: (context, args) => CollaboratorPoolScreen(
            coordinatorStore:
                Modular.get<CollaboratorPoolScreenCoordinatorStore>(),
          ),
          transition: TransitionType.noTransition,
        )
      ];
}
