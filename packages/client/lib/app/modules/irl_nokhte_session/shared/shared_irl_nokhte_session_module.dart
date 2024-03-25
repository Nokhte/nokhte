import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/supabase/supabase_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SharedIrlNokhteSessionModule extends Module {
  @override
  List<Module> get imports => [
        LegacyConnectivityModule(),
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
  }
}
