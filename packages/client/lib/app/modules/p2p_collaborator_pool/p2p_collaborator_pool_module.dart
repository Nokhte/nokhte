// ignore_for_file: prefer_const_constructors
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/local_speech_to_text_module.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/existing_collaborations_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/module.dart';
import 'package:nokhte/app/core/widgets/widget_modules/beach_waves_module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/presentation/presentation.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/domain.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/data/data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class P2PCollaboratorPoolModule extends Module {
  @override
  List<Module> get imports => [
        LocalSpeechToTextModule(),
        BeachWavesModule(),
        GesturesModule(),
        ExistingCollaborationsModule(),
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
        Bind.singleton<EnterCollaboratorPoolStore>(
          (i) => EnterCollaboratorPoolStore(
            logic: i<EnterCollaboratorPool>(),
          ),
        ),
        Bind.singleton<ExitCollaboratorPoolStore>(
          (i) => ExitCollaboratorPoolStore(
            logic: i<ExitCollaboratorPool>(),
          ),
        ),
        Bind.singleton<ValidateQueryStore>(
          (i) => ValidateQueryStore(
            logic: i<ValidateQuery>(),
          ),
        ),
        Bind.singleton<GetCollaboratorSearchStatusStore>(
          (i) => GetCollaboratorSearchStatusStore(
            logic: i<GetCollaboratorSearchStatus>(),
          ),
        ),
        Bind.singleton<CancelCollaboratorStreamStore>(
          (i) => CancelCollaboratorStreamStore(
            logic: i<CancelCollaboratorStream>(),
          ),
        ),
        Bind.factory<SmartFadingAnimatedTextTrackerStore>(
          (i) => SmartFadingAnimatedTextTrackerStore(
            isInfinite: false,
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
            newBeachWaves: Modular.get<NewBeachWavesStore>(),
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
            existingCollaborations:
                Modular.get<ExistingCollaborationsCoordinator>(),
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
