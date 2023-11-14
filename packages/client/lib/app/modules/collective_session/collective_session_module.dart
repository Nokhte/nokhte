import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/audio_player/audio_player_module.dart';
import 'package:nokhte/app/core/modules/audio_player/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/collaborative_doc_module.dart';
import 'package:nokhte/app/core/modules/get_current_perspectives/get_current_perspectives_module.dart';
import 'package:nokhte/app/core/modules/get_current_perspectives/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic_module.dart';
import 'package:nokhte/app/core/modules/gyroscopic/presentation/mobx/api/api.dart';
import 'package:nokhte/app/core/modules/voice_call/voice_call_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/widget_modules/perspectives_widgets_module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collective_session/data/data.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
import 'package:nokhte/app/modules/collective_session/presentation/mobx/main/add_individual_session_metadata_to_collective_session_store.dart';
import 'package:nokhte/app/modules/collective_session/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CollectiveSessionModule extends Module {
  @override
  List<Module> get imports => [
        GetCurrentPerspectivesModule(), // add in the coordinator
        PerspectivesWidgetsModule(),
        CollaborativeDocModule(),
        VoiceCallModule(),
        GyroscopicModule(),
        AudioPlayerModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.singleton<CollectiveSessionRemoteSourceImpl>(
          (i) => CollectiveSessionRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
        ),
        Bind.singleton<CollectiveSessionContractImpl>(
          (i) => CollectiveSessionContractImpl(
            networkInfo: Modular.get<NetworkInfoImpl>(),
            remoteSource: i<CollectiveSessionRemoteSource>(),
          ),
        ),
        Bind.singleton<GetCollaboratorPerspectives>(
          (i) => GetCollaboratorPerspectives(
            contract: i<CollectiveSessionContract>(),
          ),
        ),
        Bind.singleton<CreateCollectiveSession>(
          (i) => CreateCollectiveSession(
            contract: i<CollectiveSessionContract>(),
          ),
        ),
        Bind.singleton<MoveIndividualPerspectivesAudioToCollectiveSpace>(
          (i) => MoveIndividualPerspectivesAudioToCollectiveSpace(
            contract: i<CollectiveSessionContract>(),
          ),
        ),
        Bind.singleton<AddIndividualSessionMetadataToCollectiveSession>(
          (i) => AddIndividualSessionMetadataToCollectiveSession(
            contract: i<CollectiveSessionContract>(),
          ),
        ),
        Bind.singleton<GetCollaboratorPerspectivesGetterStore>(
          (i) => GetCollaboratorPerspectivesGetterStore(
            logic: i<GetCollaboratorPerspectives>(),
          ),
        ),
        Bind.singleton<CreateCollectiveSessionGetterStore>(
          (i) => CreateCollectiveSessionGetterStore(
            logic: i<CreateCollectiveSession>(),
          ),
        ),
        Bind.singleton<
            AddIndividualSessionMetadataToCollectiveSessionGetterStore>(
          (i) => AddIndividualSessionMetadataToCollectiveSessionGetterStore(
            logic: i<AddIndividualSessionMetadataToCollectiveSession>(),
          ),
        ),
        Bind.singleton<
            MoveIndividualPerspectivesAudioToCollectiveSpaceGetterStore>(
          (i) => MoveIndividualPerspectivesAudioToCollectiveSpaceGetterStore(
            logic: i<MoveIndividualPerspectivesAudioToCollectiveSpace>(),
          ),
        ),
        Bind.singleton<GetCollaboratorPerspectivesStore>(
          (i) => GetCollaboratorPerspectivesStore(
            getterStore: i<GetCollaboratorPerspectivesGetterStore>(),
          ),
        ),
        Bind.singleton<AddIndividualSessionMetadataToCollectiveSessionStore>(
          (i) => AddIndividualSessionMetadataToCollectiveSessionStore(
            getterStore:
                i<AddIndividualSessionMetadataToCollectiveSessionGetterStore>(),
          ),
        ),
        Bind.singleton<CreateCollectiveSessionStore>(
          (i) => CreateCollectiveSessionStore(
            getterStore: i<CreateCollectiveSessionGetterStore>(),
          ),
        ),
        Bind.singleton<MoveIndividualPerspectivesAudioToCollectiveSpaceStore>(
          (i) => MoveIndividualPerspectivesAudioToCollectiveSpaceStore(
            getterStore: i<
                MoveIndividualPerspectivesAudioToCollectiveSpaceGetterStore>(),
          ),
        ),
        Bind.singleton<CollectiveSessionPhase1WidgetsCoordinator>(
          (i) => CollectiveSessionPhase1WidgetsCoordinator(
            audioClipPlatform: Modular.get<AudioClipPlatformTrackerStore>(),
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            collaborativeTextEditor:
                Modular.get<CollaborativeTextEditorTrackerStore>(),
            beachHorizonWater: Modular.get<BeachHorizonWaterTrackerStore>(),
            beachSky: Modular.get<BeachSkyStore>(),
            perspectivesMap: Modular.get<PerspectivesMapStore>(),
          ),
        ),
        Bind.singleton<CollectiveSessionPhase1Coordinator>(
          (i) => CollectiveSessionPhase1Coordinator(
            addIndividualMetadata:
                i<AddIndividualSessionMetadataToCollectiveSessionStore>(),
            createCollectiveSession: i<CreateCollectiveSessionStore>(),
            getCurrentPerspectives: Modular.get<GetCurrentPerspectivesStore>(),
            audioPlayer: Modular.get<ChangeAudioPlayingStatusStore>(),
            getCollaboratorPerspectivesAudio:
                i<GetCollaboratorPerspectivesStore>(),
            moveTheAudio:
                i<MoveIndividualPerspectivesAudioToCollectiveSpaceStore>(),
            quadrantAPI: Modular.get<QuadrantAPI>(),
            swipe: Modular.get<SwipeDetector>(),
            widgets: i<CollectiveSessionPhase1WidgetsCoordinator>(),
          ),
        ),
      ];

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => CollectiveSession1StandInTheirShoesScreen(
            coordinator: Modular.get<CollectiveSessionPhase1Coordinator>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/phase-2',
          child: (context, args) => const CollectiveSession2CommitScreen(
              // coordinator: Modular.get<CollectiveSessionPhase1Coordinator>(),
              ),
          transition: TransitionType.noTransition,
        )
      ];
}
