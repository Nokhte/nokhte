// ignore_for_file: prefer_const_constructors

import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/core/widgets/widget_constants.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/presentation.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/domain.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/data.dart';
import 'package:primala_backend/streams.dart';
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
            existingCollaborationsStream: ExistingCollaborationsStream(),
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
        Bind.singleton<GetCollaboratorSearchStatus>(
          (i) => GetCollaboratorSearchStatus(
            contract: i<P2PCollaboratorPoolContract>(),
          ),
        ),
        Bind.singleton<CancelCollaboratorStream>(
          (i) => CancelCollaboratorStream(
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
        Bind.singleton<GetCollaboratorSearchStatusGetterStore>(
          (i) => GetCollaboratorSearchStatusGetterStore(
            collaboratorSearchStatusLogic: i<GetCollaboratorSearchStatus>(),
          ),
        ),
        Bind.singleton<CancelCollaboratorStreamGetterStore>(
          (i) => CancelCollaboratorStreamGetterStore(
            cancelStreamLogic: i<CancelCollaboratorStream>(),
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
        Bind.singleton<GetCollaboratorSearchStatusStore>(
          (i) => GetCollaboratorSearchStatusStore(
            collaboratorSearchStatusGetter:
                i<GetCollaboratorSearchStatusGetterStore>(),
          ),
        ),
        Bind.singleton<CancelCollaboratorStreamStore>(
          (i) => CancelCollaboratorStreamStore(
            getterStore: i<CancelCollaboratorStreamGetterStore>(),
          ),
        ),
        // & Widget State Management Stores
        Bind.factory<SmartFadingAnimatedTextTrackerStore>(
          (i) => SmartFadingAnimatedTextTrackerStore(
            isInfinite: false,
            messagesData: MessagesData.speakTheCollaboratorPhraseList,
          ),
        ),
        Bind.factory<BreathingPentagonsStateTrackerStore>(
          (i) => BreathingPentagonsStateTrackerStore(),
        ),
        Bind.factory<BeachWavesTrackerStore>(
          (i) => BeachWavesTrackerStore(),
        ),
        // & Widget Manager Store
        Bind.factory<CustomWidgetsTrackerStore>(
          (i) => CustomWidgetsTrackerStore(
            smartFadingAnimatedTextStore:
                Modular.get<SmartFadingAnimatedTextTrackerStore>(),
            breathingPentagonsStore:
                Modular.get<BreathingPentagonsStateTrackerStore>(),
            beachWavesStore: Modular.get<BeachWavesTrackerStore>(),
          ),
        ),
        // & Coordinator Stores
        Bind.singleton<SpeakTheCollaboratorPhraseCoordinatorStore>(
          (i) => SpeakTheCollaboratorPhraseCoordinatorStore(
            enterCollaboratorPoolStore: i<EnterCollaboratorPoolStore>(),
            validateQueryStore: i<ValidateQueryStore>(),
            onSpeechResultStore: i<OnSpeechResultStore>(),
            speechToTextStore: i<SpeechToTextStore>(),
            widgetStore: Modular.get<CustomWidgetsTrackerStore>(),
          ),
        ),
        Bind.singleton<CollaboratorPoolScreenCoordinatorStore>(
          (i) => CollaboratorPoolScreenCoordinatorStore(
            exitCollaboratorPoolStore: i<ExitCollaboratorPoolStore>(),
            widgetStore: Modular.get<CustomWidgetsTrackerStore>(),
            getCollaboratorSearchStatusStore:
                i<GetCollaboratorSearchStatusStore>(),
            cancelStreamStore: i<CancelCollaboratorStreamStore>(),
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
            // startingWaveMovement: args.data,
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
