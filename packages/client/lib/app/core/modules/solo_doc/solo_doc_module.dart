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
        Bind.singleton<CreateSoloDocGetterStore>(
          (i) => CreateSoloDocGetterStore(
            logic: i<CreateSoloDoc>(),
          ),
          export: true,
        ),
        Bind.singleton<GetSoloDocGetterStore>(
          (i) => GetSoloDocGetterStore(
            logic: i<GetSoloDoc>(),
          ),
          export: true,
        ),
        Bind.singleton<SealSoloDocGetterStore>(
          (i) => SealSoloDocGetterStore(
            logic: i<SealSoloDoc>(),
          ),
          export: true,
        ),
        Bind.singleton<ShareSoloDocGetterStore>(
          (i) => ShareSoloDocGetterStore(
            logic: i<ShareSoloDoc>(),
          ),
          export: true,
        ),
        Bind.singleton<SubmitSoloDocGetterStore>(
          (i) => SubmitSoloDocGetterStore(
            logic: i<SubmitSoloDoc>(),
          ),
          export: true,
        ),
        Bind.singleton<CreateSoloDocStore>(
          (i) => CreateSoloDocStore(
            getterStore: i<CreateSoloDocGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<GetSoloDocStore>(
          (i) => GetSoloDocStore(
            getterStore: i<GetSoloDocGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<SealSoloDocStore>(
          (i) => SealSoloDocStore(
            getterStore: i<SealSoloDocGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<ShareSoloDocStore>(
          (i) => ShareSoloDocStore(
            getterStore: i<ShareSoloDocGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<SubmitSoloDocStore>(
          (i) => SubmitSoloDocStore(
            getterStore: i<SubmitSoloDocGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<SoloDocCoordinatorStore>(
          (i) => SoloDocCoordinatorStore(
            createSoloDoc: i<CreateSoloDocStore>(),
            getSoloDoc: i<GetSoloDocStore>(),
            sealSoloDoc: i<SealSoloDocStore>(),
            shareSoloDoc: i<ShareSoloDocStore>(),
            submitSoloDoc: i<SubmitSoloDocStore>(),
          ),
          export: true,
        ),
      ];
}
