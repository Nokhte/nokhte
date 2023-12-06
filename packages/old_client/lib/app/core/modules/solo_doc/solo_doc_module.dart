import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/solo_doc/data/data.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/voice_call_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SoloDocModule extends Module {
  @override
  List<Module> get imports => [
        VoiceCallModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind.singleton<SoloDocRemoteSourceImpl>(
          (i) => SoloDocRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
          export: true,
        ),
        Bind.singleton<SoloDocContractImpl>(
          (i) => SoloDocContractImpl(
            networkInfo: i<NetworkInfo>(),
            remoteSource: i<SoloDocRemoteSourceImpl>(),
          ),
          export: true,
        ),
        Bind.singleton<CreateSoloDoc>(
          (i) => CreateSoloDoc(
            contract: i<SoloDocContract>(),
          ),
          export: true,
        ),
        Bind.singleton<GetSoloDoc>(
          (i) => GetSoloDoc(
            contract: i<SoloDocContract>(),
          ),
          export: true,
        ),
        Bind.singleton<SealSoloDoc>(
          (i) => SealSoloDoc(
            contract: i<SoloDocContract>(),
          ),
          export: true,
        ),
        Bind.singleton<ShareSoloDoc>(
          (i) => ShareSoloDoc(
            contract: i<SoloDocContract>(),
          ),
          export: true,
        ),
        Bind.singleton<SubmitSoloDoc>(
          (i) => SubmitSoloDoc(
            contract: i<SoloDocContract>(),
          ),
          export: true,
        ),
        Bind.singleton<GetSoloDocStore>(
          (i) => GetSoloDocStore(
            logic: i<GetSoloDoc>(),
          ),
          export: true,
        ),
        Bind.singleton<SoloDocCoordinator>(
          (i) => SoloDocCoordinator(
            getSoloDoc: i<GetSoloDocStore>(),
            createSoloDoc: i<CreateSoloDoc>(),
            sealSoloDoc: i<SealSoloDoc>(),
            shareSoloDoc: i<ShareSoloDoc>(),
            submitSoloDoc: i<SubmitSoloDoc>(),
          ),
          export: true,
        ),
      ];
}
