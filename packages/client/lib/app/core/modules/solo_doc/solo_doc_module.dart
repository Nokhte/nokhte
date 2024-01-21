import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/solo_doc/data/data.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SoloDocModule extends Module {
  @override
  exportedBinds(i) {
    i.add<SoloDocRemoteSourceImpl>(
      (i) => SoloDocRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<SoloDocContractImpl>(
      (i) => SoloDocContractImpl(
        networkInfo: i<NetworkInfo>(),
        remoteSource: i<SoloDocRemoteSourceImpl>(),
      ),
    );
    i.add<CreateSoloDoc>(
      (i) => CreateSoloDoc(
        contract: i<SoloDocContract>(),
      ),
    );
    i.add<GetSoloDoc>(
      (i) => GetSoloDoc(
        contract: i<SoloDocContract>(),
      ),
    );
    i.add<SealSoloDoc>(
      (i) => SealSoloDoc(
        contract: i<SoloDocContract>(),
      ),
    );
    i.add<ShareSoloDoc>(
      (i) => ShareSoloDoc(
        contract: i<SoloDocContract>(),
      ),
    );
    i.add<SubmitSoloDoc>(
      (i) => SubmitSoloDoc(
        contract: i<SoloDocContract>(),
      ),
    );
    i.add<SoloDocCoordinator>(
      (i) => SoloDocCoordinator(
        getSoloDoc: i<GetSoloDoc>(),
        createSoloDoc: i<CreateSoloDoc>(),
        sealSoloDoc: i<SealSoloDoc>(),
        shareSoloDoc: i<ShareSoloDoc>(),
        submitSoloDoc: i<SubmitSoloDoc>(),
      ),
    );
  }
}
