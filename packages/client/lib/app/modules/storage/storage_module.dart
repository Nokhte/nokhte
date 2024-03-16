import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/modules/posthog/posthog_module.dart';
import 'package:nokhte/app/core/modules/supabase/supabase_module.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/user_information_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/storage/data/data.dart';
import 'package:nokhte/app/modules/storage/domain/domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'presentation/presentation.dart';
import 'storage_widgets_module.dart';

class StorageModule extends Module {
  @override
  List<Module> get imports => [
        LegacyConnectivityModule(),
        StorageWidgetsModule(),
        PosthogModule(),
        UserInformationModule(),
        SupabaseModule(),
      ];
  @override
  void binds(i) {
    i.add<StorageRemoteSourceImpl>(
      () => StorageRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<StorageContractImpl>(
      () => StorageContractImpl(
        networkInfo: Modular.get<NetworkInfoImpl>(),
        remoteSource: Modular.get<StorageRemoteSourceImpl>(),
      ),
    );

    i.add<GetNokhteSessionArtifacts>(
      () => GetNokhteSessionArtifacts(
        contract: Modular.get<StorageContractImpl>(),
      ),
    );
    i.add<UpdateSessionAlias>(
      () => UpdateSessionAlias(
        contract: Modular.get<StorageContractImpl>(),
      ),
    );
    i.add<StorageHomeCoordinator>(
      () => StorageHomeCoordinator(
        getNokhteSessionArtifactsLogic:
            Modular.get<GetNokhteSessionArtifacts>(),
        updateSessionAliasLogic: Modular.get<UpdateSessionAlias>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<StorageHomeWidgetsCoordinator>(),
        swipe: SwipeDetector(),
        getUserInfo: Modular.get<GetUserInfoStore>(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      '/',
      transition: TransitionType.noTransition,
      child: (context) => StorageHomeScreen(
        coordinator: Modular.get<StorageHomeCoordinator>(),
      ),
    );
  }
}
