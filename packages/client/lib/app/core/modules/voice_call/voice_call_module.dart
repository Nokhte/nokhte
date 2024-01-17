import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/modules/voice_call/data/data.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VoiceCallModule extends Module {
  @override
  List<Module> get imports => [
        LegacyConnectivityModule(),
      ];

  @override
  void exportedBinds(Injector i) {
    i.add<VoiceCallRemoteSourceImpl>(
      () => VoiceCallRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<VoiceCallContractImpl>(
      () => VoiceCallContractImpl(
        networkInfo: Modular.get<NetworkInfoImpl>(),
        remoteSource: i<VoiceCallRemoteSourceImpl>(),
      ),
    );
    i.add<GetRoomInformation>(
      () => GetRoomInformation(
        contract: i<VoiceCallContractImpl>(),
      ),
    );
    i.add<VoiceCallCoordinator>(
      () => VoiceCallCoordinator(
        logic: i<GetRoomInformation>(),
      ),
    );
  }
}
