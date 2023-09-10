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
        Bind.singleton<P2PPurposeSessionSoloDocRemoteSourceImpl>(
          (i) => P2PPurposeSessionSoloDocRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
        ),
        // & Contract Implementation
        Bind.singleton<P2PPurposeSessionSoloDocContractImpl>(
          (i) => P2PPurposeSessionSoloDocContractImpl(
            networkInfo: i<NetworkInfo>(),
            remoteSource: i<P2PPurposeSessionSoloDocRemoteSourceImpl>(),
          ),
        ),
        // & Logic
        Bind.singleton<CreateSoloDoc>(
          (i) => CreateSoloDoc(
            contract: i<P2PPurposeSessionSoloDocContract>(),
          ),
        ),
        Bind.singleton<GetSoloDoc>(
          (i) => GetSoloDoc(
            contract: i<P2PPurposeSessionSoloDocContract>(),
          ),
        ),
        Bind.singleton<SealSoloDoc>(
          (i) => SealSoloDoc(
            contract: i<P2PPurposeSessionSoloDocContract>(),
          ),
        ),
        Bind.singleton<ShareSoloDoc>(
          (i) => ShareSoloDoc(
            contract: i<P2PPurposeSessionSoloDocContract>(),
          ),
        ),
        Bind.singleton<SubmitSoloDoc>(
          (i) => SubmitSoloDoc(
            contract: i<P2PPurposeSessionSoloDocContract>(),
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
