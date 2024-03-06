import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/modules/posthog/posthog_module.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/modules/supabase/supabase_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SharedIrlNokhteSessionModule extends Module {
  @override
  List<Module> get imports => [
        LegacyConnectivityModule(),
        PosthogModule(),
        SharedIrlNokhteSessionWidgetsModule(),
        IrlNokhteSessionPresenceModule(),
        GesturesModule(),
        SupabaseModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<SharedIrlNokhteSessionRemoteSourceImpl>(
        () => SharedIrlNokhteSessionRemoteSourceImpl(
              supabase: Modular.get<SupabaseClient>(),
            ));
    i.add<SharedIrlNokhteSessionContractImpl>(
      () => SharedIrlNokhteSessionContractImpl(
        networkInfo: Modular.get<NetworkInfoImpl>(),
        remoteSource: Modular.get<SharedIrlNokhteSessionRemoteSourceImpl>(),
      ),
    );
    i.add<DecidePhoneRole>(
      () => DecidePhoneRole(
        contract: i<SharedIrlNokhteSessionContractImpl>(),
      ),
    );
    i.add<IrlNokhteSessionPhase0Coordinator>(
      () => IrlNokhteSessionPhase0Coordinator(
        decidePhoneRoleLogic: Modular.get<DecidePhoneRole>(),
        presence: Modular.get<IrlNokhteSessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<IrlNokhteSessionPhase0WidgetsCoordinator>(),
        tap: Modular.get<TapDetector>(),
      ),
    );
  }
}
