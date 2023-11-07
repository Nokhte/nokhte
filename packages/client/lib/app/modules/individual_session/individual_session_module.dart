import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/mobx/base_direction_decider_store.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic_module.dart';
import 'package:nokhte/app/core/modules/gyroscopic/presentation/mobx/api/api.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/audio_clip_platform/stack/presentation/presentation.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/individual_session/data/data.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
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
        Bind.singleton<GetCurrentPerspectives>(
          (i) => GetCurrentPerspectives(
              contract: i<IndividualSessionContractImpl>()),
        ),
        // % Getter Store
        Bind.singleton<GetCurrentPerspectivesGetterStore>(
          (i) => GetCurrentPerspectivesGetterStore(
            logic: i<GetCurrentPerspectives>(),
          ),
        ),
        // % Main Store
        Bind.singleton<GetCurrentPerspectivesStore>(
          (i) => GetCurrentPerspectivesStore(
            getterStore: i<GetCurrentPerspectivesGetterStore>(),
          ),
        ),
        Bind.singleton<BaseDirectionDeciderStore>(
          (i) => BaseDirectionDeciderStore(),
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
            directions: i<BaseDirectionDeciderStore>(),
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
