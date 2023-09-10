import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/modules/solo_doc/data/data.dart';
import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';
import 'package:primala/app/core/modules/solo_doc/mobx/mobx.dart';
import 'package:primala/app/core/modules/voice_call/voice_call_module.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SoloDocModule extends Module {
  @override
  List<Module> get imports => [
        VoiceCallModule(),
      ];

  @override
  List<Bind> get binds => [
        // & Remotes Source
        // # Solo Doc
        Bind.singleton<SoloDocRemoteSourceImpl>(
          (i) => SoloDocRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
        ),
        // & Contract Implementation
        Bind.singleton<SoloDocContractImpl>(
          (i) => SoloDocContractImpl(
            networkInfo: i<NetworkInfo>(),
            remoteSource: i<SoloDocRemoteSourceImpl>(),
          ),
        ),
        // & Logic
        Bind.singleton<CreateSoloDoc>(
          (i) => CreateSoloDoc(
            contract: i<SoloDocContract>(),
          ),
        ),
        Bind.singleton<GetSoloDoc>(
          (i) => GetSoloDoc(
            contract: i<SoloDocContract>(),
          ),
        ),
        Bind.singleton<SealSoloDoc>(
          (i) => SealSoloDoc(
            contract: i<SoloDocContract>(),
          ),
        ),
        Bind.singleton<ShareSoloDoc>(
          (i) => ShareSoloDoc(
            contract: i<SoloDocContract>(),
          ),
        ),
        Bind.singleton<SubmitSoloDoc>(
          (i) => SubmitSoloDoc(
            contract: i<SoloDocContract>(),
          ),
        ),
        Bind.singleton<CreateSoloDocGetterStore>(
          (i) => CreateSoloDocGetterStore(
            logic: i<CreateSoloDoc>(),
          ),
        ),
        Bind.singleton<GetSoloDocGetterStore>(
          (i) => GetSoloDocGetterStore(
            logic: i<GetSoloDoc>(),
          ),
        ),
        Bind.singleton<SealSoloDocGetterStore>(
          (i) => SealSoloDocGetterStore(
            logic: i<SealSoloDoc>(),
          ),
        ),
        Bind.singleton<ShareSoloDocGetterStore>(
          (i) => ShareSoloDocGetterStore(
            logic: i<ShareSoloDoc>(),
          ),
        ),
        Bind.singleton<SubmitSoloDocGetterStore>(
          (i) => SubmitSoloDocGetterStore(
            logic: i<SubmitSoloDoc>(),
          ),
        ),
        // & Mobx Logic Stores
        Bind.singleton<CreateSoloDocStore>(
          (i) => CreateSoloDocStore(
            getterStore: i<CreateSoloDocGetterStore>(),
          ),
        ),
        Bind.singleton<GetSoloDocStore>(
          (i) => GetSoloDocStore(
            getterStore: i<GetSoloDocGetterStore>(),
          ),
        ),
        Bind.singleton<SealSoloDocStore>(
          (i) => SealSoloDocStore(
            getterStore: i<SealSoloDocGetterStore>(),
          ),
        ),
        Bind.singleton<ShareSoloDocStore>(
          (i) => ShareSoloDocStore(
            getterStore: i<ShareSoloDocGetterStore>(),
          ),
        ),
        Bind.singleton<SubmitSoloDocStore>(
          (i) => SubmitSoloDocStore(
            getterStore: i<SubmitSoloDocGetterStore>(),
          ),
        ),
      ];
}
