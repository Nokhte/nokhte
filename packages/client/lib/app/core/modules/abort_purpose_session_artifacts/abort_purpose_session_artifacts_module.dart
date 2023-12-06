import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/data/data.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/domain/domain.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/mobx/mobx.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AbortPurposeSessionArtifactsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<AbortPurposeSessionArtifactsRemoteSourceImpl>(
          (i) => AbortPurposeSessionArtifactsRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
          export: true,
        ),
        Bind.singleton<AbortPurposeSessionArtifactsContractImpl>(
          (i) => AbortPurposeSessionArtifactsContractImpl(
            networkInfo: i<NetworkInfoImpl>(),
            remoteSource: i<AbortPurposeSessionArtifactsRemoteSource>(),
          ),
          export: true,
        ),
        Bind.singleton<AbortPurposeSessionArtifacts>(
          (i) => AbortPurposeSessionArtifacts(
            contract: i<AbortPurposeSessionArtifactsContract>(),
          ),
          export: true,
        ),
        Bind.singleton<AbortPurposeSessionArtifactsStore>(
          (i) => AbortPurposeSessionArtifactsStore(
            logic: i<AbortPurposeSessionArtifacts>(),
          ),
          export: true,
        ),
      ];
}
