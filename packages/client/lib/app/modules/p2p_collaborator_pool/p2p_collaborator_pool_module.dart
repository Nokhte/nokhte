// ignore_for_file: prefer_const_constructors
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/local_speech_to_text_module.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/mobx/coordinator/update_existing_collaborations_coordinator.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/update_existing_collaborations_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/presentation/presentation.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/domain.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/data/data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class P2PCollaboratorPoolModule extends Module {
  @override
  List<Module> get imports => [
        LocalSpeechToTextModule(),
        GesturesModule(),
        UpdateExistingCollaborationsModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind.singleton<P2PCollaboratorPoolRemoteSourceImpl>(
          (i) => P2PCollaboratorPoolRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
        ),
        Bind.singleton<P2PCollaboratorPoolContractImpl>(
          (i) => P2PCollaboratorPoolContractImpl(
            remoteSource: i<P2PCollaboratorPoolRemoteSourceImpl>(),
            networkInfo: Modular.get<NetworkInfo>(),
          ),
        ),
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
        Bind.factory<SmartFadingAnimatedTextTrackerStore>(
          (i) => SmartFadingAnimatedTextTrackerStore(
            isInfinite: false,
            // messagesDataParam: MessagesData.speakTheCollaboratorPhraseList,
          ),
        ),
        Bind.singleton<ExplanationTextStore>(
          (i) => ExplanationTextStore(),
        ),
        Bind.factory<FadeInAndChangeColorTextStore>(
          (i) => FadeInAndChangeColorTextStore(
            chosenMovie: TimesUpText.movie,
            messageData: FadeInMessageData(
              fontSize: 50.0,
              message: "Waiting On Collaborator",
            ),
          ),
        ),
        Bind.factory<BeachWavesTrackerStore>(
          (i) => BeachWavesTrackerStore(),
        ),
        Bind.singleton<MeshCircleButtonStore>(
          (i) => MeshCircleButtonStore(),
        ),
        Bind.factory<WidgetCoordinatorStore>(
          (i) => WidgetCoordinatorStore(
            meshCircleButtonStore: i<MeshCircleButtonStore>(),
            fadeInAndChangeColorTextStore:
                Modular.get<FadeInAndChangeColorTextStore>(),
            fadingText: Modular.get<SmartFadingAnimatedTextTrackerStore>(),
            beachWavesStore: Modular.get<BeachWavesTrackerStore>(),
            explanationText: i<ExplanationTextStore>(),
          ),
        ),
        Bind.singleton<SpeakTheCollaboratorPhraseCoordinatorStore>(
          (i) => SpeakTheCollaboratorPhraseCoordinatorStore(
            hold: Modular.get<HoldDetector>(),
            swipe: Modular.get<SwipeDetector>(),
            enterCollaboratorPoolStore: i<EnterCollaboratorPoolStore>(),
            validateQueryStore: i<ValidateQueryStore>(),
            onSpeechResultStore: i<OnSpeechResultStore>(),
            localSpeechToText: i<LocalSpeechToTextCoordinator>(),
            widgetStore: Modular.get<WidgetCoordinatorStore>(),
          ),
        ),
        Bind.singleton<CollaboratorPoolScreenCoordinatorStore>(
          (i) => CollaboratorPoolScreenCoordinatorStore(
            updateExistingCollaborations:
                Modular.get<UpdateExistingCollaborationsCoordinator>(),
            exitCollaboratorPoolStore: i<ExitCollaboratorPoolStore>(),
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            fadeInAndColorTextStore:
                Modular.get<FadeInAndChangeColorTextStore>(),
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
            coordinator:
                Modular.get<SpeakTheCollaboratorPhraseCoordinatorStore>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          "/pool/",
          child: (context, args) => CollaboratorPoolScreen(
            coordinator: Modular.get<CollaboratorPoolScreenCoordinatorStore>(),
          ),
          transition: TransitionType.noTransition,
        )
      ];
}
