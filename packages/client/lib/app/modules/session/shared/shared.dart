import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/supabase/supabase_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/session/shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
export 'presentation/presentation.dart';
export 'constants/constants.dart';
export 'data/data.dart';
export 'domain/domain.dart';
export 'shared_session_widgets_module.dart';
export 'shared.dart';
export 'types/types.dart';

class SharedSessionModule extends Module {
  @override
  List<Module> get imports => [
        LegacyConnectivityModule(),
        SupabaseModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<SharedSessionRemoteSourceImpl>(() => SharedSessionRemoteSourceImpl(
          supabase: Modular.get<SupabaseClient>(),
        ));
    i.add<SharedSessionContractImpl>(
      () => SharedSessionContractImpl(
        networkInfo: Modular.get<NetworkInfoImpl>(),
        remoteSource: Modular.get<SharedSessionRemoteSourceImpl>(),
      ),
    );
    i.add<DecidePhoneRole>(
      () => DecidePhoneRole(
        contract: i<SharedSessionContractImpl>(),
      ),
    );
  }
}
