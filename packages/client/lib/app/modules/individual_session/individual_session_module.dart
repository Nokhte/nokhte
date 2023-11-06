import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/individual_session/data/data.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte/app/modules/individual_session/presentation/mobx/coordinators/individual_session_screen_coordinator_store.dart';
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
        // % Coordinator
        Bind.singleton<IndividualSessionScreenCoordinatorStore>(
          (i) => IndividualSessionScreenCoordinatorStore(
            getCurrentPerspectives: i<GetCurrentPerspectivesStore>(),
          ),
        ),
      ];

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          '',
          child: (context, args) => IndividualSessionScreen(
            coordinator: Modular.get<IndividualSessionScreenCoordinatorStore>(),
          ),
        )
      ];
}
