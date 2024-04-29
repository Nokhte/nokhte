import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity.dart';
import 'package:nokhte/app/core/modules/supabase/supabase.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/storage/storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageLogicModule extends Module {
  @override
  List<Module> get imports => [
        LegacyConnectivityModule(),
        SupabaseModule(),
      ];
  @override
  void exportedBinds(i) {
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
  }
}
