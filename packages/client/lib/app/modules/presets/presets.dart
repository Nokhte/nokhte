import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/supabase/supabase.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'presets.dart';
export 'data/data.dart';
export 'constants/constants.dart';
export 'domain/domain.dart';

class PresetsModule extends Module {
  @override
  List<Module> get imports => [
        UserInformationModule(),
        LegacyConnectivityModule(),
        PosthogModule(),
        SupabaseModule(),
      ];

  @override
  void exportedBinds(i) {
    i.add<PresetsRemoteSourceImpl>(
      () => PresetsRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );

    i.add<PresetsContractImpl>(
      () => PresetsContractImpl(
        remoteSource: i<PresetsRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<GetCompanyPresets>(
      () => GetCompanyPresets(
        contract: Modular.get<PresetsContractImpl>(),
      ),
    );
    i.add<PresetsLogicCoordinator>(
      () => PresetsLogicCoordinator(
        getCompanyPresetsLogic: Modular.get<GetCompanyPresets>(),
      ),
    );
  }
}
