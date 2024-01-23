import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/solo_docs/data/data.dart';
import 'package:nokhte/app/core/modules/solo_docs/domain/domain.dart';
import 'package:nokhte/app/core/modules/solo_docs/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/supabase/supabase_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SoloDocsModule extends Module {
  @override
  List<Module> get imports => [
        SupabaseModule(),
        LegacyConnectivityModule(),
      ];

  @override
  exportedBinds(i) {
    i.add<SoloDocsRemoteSourceImpl>(
      () => SoloDocsRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<SoloDocsContractImpl>(
      () => SoloDocsContractImpl(
        networkInfo: Modular.get<NetworkInfoImpl>(),
        remoteSource: i<SoloDocsRemoteSourceImpl>(),
      ),
    );
    i.add<CreateSoloDoc>(
      () => CreateSoloDoc(
        contract: i<SoloDocsContractImpl>(),
      ),
    );
    i.add<GetSoloDoc>(
      () => GetSoloDoc(
        contract: i<SoloDocsContractImpl>(),
      ),
    );
    i.add<SealSoloDoc>(
      () => SealSoloDoc(
        contract: i<SoloDocsContractImpl>(),
      ),
    );
    i.add<ShareSoloDoc>(
      () => ShareSoloDoc(
        contract: i<SoloDocsContractImpl>(),
      ),
    );
    i.add<SubmitSoloDoc>(
      () => SubmitSoloDoc(
        contract: i<SoloDocsContractImpl>(),
      ),
    );
    i.add<SoloDocsCoordinator>(
      () => SoloDocsCoordinator(
        getSoloDocLogic: i<GetSoloDoc>(),
        createSoloDocLogic: i<CreateSoloDoc>(),
        sealSoloDocLogic: i<SealSoloDoc>(),
        shareSoloDocLogic: i<ShareSoloDoc>(),
        submitSoloDocLogic: i<SubmitSoloDoc>(),
      ),
    );
  }
}
