import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic_module.dart';
import 'package:nokhte/app/core/modules/gyroscopic/presentation/mobx/api/api.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/audio_clip_platform/stack/presentation/presentation.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/individual_session/data/data.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte/app/modules/individual_session/domain/logic/upload_individual_perspectives_audio.dart';
import 'package:nokhte/app/modules/individual_session/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class IndividualSessionModule extends Module {
  @override
  List<Module> get imports => [
        GyroscopicModule(),
      ];

  @override
  List<Bind> get binds => [
        // % Remote Source
        Bind.singleton<IndividualSessionRemoteSourceImpl>(
          (i) => IndividualSessionRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
        ),
        // % Contract
        Bind.singleton<IndividualSessionContractImpl>(
          (i) => IndividualSessionContractImpl(
              remoteSource: i<IndividualSessionRemoteSource>(),
              networkInfo: Modular.get<NetworkInfoImpl>()),
        ),
        // % Logic
        Bind.singleton<ChangePerspectivesAudioRecordingStatus>(
          (i) => ChangePerspectivesAudioRecordingStatus(
            contract: i<IndividualSessionContractImpl>(),
          ),
        ),
        Bind.singleton<CreateIndividualSession>(
          (i) => CreateIndividualSession(
            contract: i<IndividualSessionContractImpl>(),
          ),
        ),
        Bind.singleton<GetCurrentPerspectives>(
          (i) => GetCurrentPerspectives(
              contract: i<IndividualSessionContractImpl>()),
        ),
        Bind.singleton<UpdateSessionMetadata>(
          (i) => UpdateSessionMetadata(
            contract: i<IndividualSessionContractImpl>(),
          ),
        ),
        Bind.singleton<UploadIndividualPerspectivesAudio>(
          (i) => UploadIndividualPerspectivesAudio(
            contract: i<IndividualSessionContractImpl>(),
          ),
        ),
        // % Getter Store
        Bind.singleton<ChangePerspectivesAudioRecordingStatusGetterStore>(
          (i) => ChangePerspectivesAudioRecordingStatusGetterStore(
            logic: i<ChangePerspectivesAudioRecordingStatus>(),
          ),
        ),
        Bind.singleton<CreateIndividualSessionGetterStore>(
          (i) => CreateIndividualSessionGetterStore(
            logic: i<CreateIndividualSession>(),
          ),
        ),
        Bind.singleton<GetCurrentPerspectivesGetterStore>(
          (i) => GetCurrentPerspectivesGetterStore(
            logic: i<GetCurrentPerspectives>(),
          ),
        ),
        Bind.singleton<UpdateSessionMetadataGetterStore>(
          (i) => UpdateSessionMetadataGetterStore(
            logic: i<UpdateSessionMetadata>(),
          ),
        ),
        Bind.singleton<UploadIndividualPerspectivesAudioGetterStore>(
          (i) => UploadIndividualPerspectivesAudioGetterStore(
            logic: i<UploadIndividualPerspectivesAudio>(),
          ),
        ),
        // % Main Store
        Bind.singleton<ChangePerspectivesAudioRecordingStatusStore>(
          (i) => ChangePerspectivesAudioRecordingStatusStore(
            getterStore: i<ChangePerspectivesAudioRecordingStatusGetterStore>(),
          ),
        ),
        Bind.singleton<CreateIndividualSessionStore>(
          (i) => CreateIndividualSessionStore(
            getterStore: i<CreateIndividualSessionGetterStore>(),
          ),
        ),
        Bind.singleton<GetCurrentPerspectivesStore>(
          (i) => GetCurrentPerspectivesStore(
            getterStore: i<GetCurrentPerspectivesGetterStore>(),
          ),
        ),
        Bind.singleton<SwipeDetector>(
          (i) => SwipeDetector(),
        ),
        Bind.singleton<UpdateSessionMetadataStore>(
          (i) => UpdateSessionMetadataStore(
            getterStore: i<UpdateSessionMetadataGetterStore>(),
          ),
        ),
        Bind.singleton<UploadIndividualPerspectivesAudioStore>(
          (i) => UploadIndividualPerspectivesAudioStore(
            getterStore: i<UploadIndividualPerspectivesAudioGetterStore>(),
          ),
        ),
        // % Widgets
        Bind.singleton<AudioClipPlatformTrackerStore>(
          (i) => AudioClipPlatformTrackerStore(),
        ),
        Bind.singleton<BeachHorizonWaterTrackerStore>(
          (i) => BeachHorizonWaterTrackerStore(
            isGoingToFullSky: true,
          ),
        ),
        Bind.singleton<BeachWavesTrackerStore>(
          (i) => BeachWavesTrackerStore(),
        ),
        Bind.singleton<BeachSkyStore>(
          (i) => BeachSkyStore(
            isGoingToFullSky: true,
          ),
        ),
        Bind.singleton<PerspectivesMapStore>(
          (i) => PerspectivesMapStore(),
        ),
        Bind.singleton<CollaborativeTextEditorTrackerStore>(
          (i) => CollaborativeTextEditorTrackerStore(
            isReadOnly: true,
          ),
        ),
        // % Coordinators
        Bind.singleton<IndividualSessionScreenWidgetsCoordinator>(
          (i) => IndividualSessionScreenWidgetsCoordinator(
            audioClipPlatform: i<AudioClipPlatformTrackerStore>(),
            beachWaves: i<BeachWavesTrackerStore>(),
            collaborativeTextEditor: i<CollaborativeTextEditorTrackerStore>(),
            beachHorizonWater: i<BeachHorizonWaterTrackerStore>(),
            beachSky: i<BeachSkyStore>(),
            perspectivesMap: i<PerspectivesMapStore>(),
          ),
        ),
        Bind.singleton<IndividualSessionScreenCoordinatorStore>(
          (i) => IndividualSessionScreenCoordinatorStore(
            setRecordingStatus:
                i<ChangePerspectivesAudioRecordingStatusStore>(),
            createIndividualSession: i<CreateIndividualSessionStore>(),
            updateSessionMetadata: i<UpdateSessionMetadataStore>(),
            uploadIndividualPerspectivesAudio:
                i<UploadIndividualPerspectivesAudioStore>(),
            swipe: i<SwipeDetector>(),
            quadrantAPI: i<QuadrantAPI>(),
            widgets: i<IndividualSessionScreenWidgetsCoordinator>(),
            getCurrentPerspectives: i<GetCurrentPerspectivesStore>(),
          ),
        ),
      ];

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => IndividualSessionScreen(
            coordinator: Modular.get<IndividualSessionScreenCoordinatorStore>(),
          ),
        )
      ];
}
