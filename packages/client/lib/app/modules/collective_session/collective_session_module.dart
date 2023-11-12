import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/audio_player/audio_player_module.dart';
import 'package:nokhte/app/core/modules/audio_player/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/collaborative_doc_module.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic_module.dart';
import 'package:nokhte/app/core/modules/gyroscopic/presentation/mobx/api/api.dart';
import 'package:nokhte/app/core/modules/voice_call/voice_call_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/collective_session/data/data.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
import 'package:nokhte/app/modules/collective_session/presentation/mobx/coordinators/collective_session_phase1_coordinator.dart';
import 'package:nokhte/app/modules/collective_session/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CollectiveSessionModule extends Module {
  @override
  List<Module> get imports => [
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
        Bind.singleton<MoveIndividualPerspectivesAudioToCollectiveSpace>(
          (i) => MoveIndividualPerspectivesAudioToCollectiveSpace(
            contract: i<CollectiveSessionContract>(),
          ),
        ),
        Bind.singleton<GetCollaboratorPerspectivesGetterStore>(
          (i) => GetCollaboratorPerspectivesGetterStore(
            logic: i<GetCollaboratorPerspectives>(),
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
        Bind.singleton<MoveIndividualPerspectivesAudioToCollectiveSpaceStore>(
          (i) => MoveIndividualPerspectivesAudioToCollectiveSpaceStore(
            getterStore: i<
                MoveIndividualPerspectivesAudioToCollectiveSpaceGetterStore>(),
          ),
        ),
        Bind.singleton<CollectiveSessionPhase1Coordinator>(
          (i) => CollectiveSessionPhase1Coordinator(
              audioPlayer: Modular.get<ChangeAudioPlayingStatusStore>(),
              quadrantAPI: Modular.get<QuadrantAPI>(),
              moveTheAudio:
                  i<MoveIndividualPerspectivesAudioToCollectiveSpaceStore>(),
              getCollaboratorPerspectives:
                  i<GetCollaboratorPerspectivesStore>()),
        ),
      ];

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) =>
              const CollectiveSession1StandInTheirShoesScreen(),
        )
      ];
}
