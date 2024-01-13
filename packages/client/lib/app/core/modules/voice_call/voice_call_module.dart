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
    i.add<GetAgoraToken>(
      () => GetAgoraToken(
        contract: i<VoiceCallContractImpl>(),
      ),
    );
    i.add<GetChannelId>(
      () => GetChannelId(
        contract: i<VoiceCallContractImpl>(),
      ),
    );
    i.add<JoinCall>(
      () => JoinCall(
        contract: i<VoiceCallContractImpl>(),
      ),
    );
    i.add<InitAgoraSdk>(
      () => InitAgoraSdk(
        contract: i<VoiceCallContractImpl>(),
      ),
    );
    i.add<LeaveCall>(
      () => LeaveCall(
        contract: i<VoiceCallContractImpl>(),
      ),
    );
    i.add<MuteLocalAudio>(
      () => MuteLocalAudio(
        contract: i<VoiceCallContractImpl>(),
      ),
    );
    i.add<UnmuteLocalAudio>(
      () => UnmuteLocalAudio(
        contract: i<VoiceCallContractImpl>(),
      ),
    );
    i.add<InitAgoraSdkStore>(
      () => InitAgoraSdkStore(
        logic: i<InitAgoraSdk>(),
      ),
    );
    i.add<GetAgoraTokenStore>(
      () => GetAgoraTokenStore(
        logic: i<GetAgoraToken>(),
      ),
    );
    i.add<GetChannelIdStore>(
      () => GetChannelIdStore(
        logic: i<GetChannelId>(),
      ),
    );
    i.add<VoiceCallStatusStore>(
      () => VoiceCallStatusStore(),
    );
    i.add<VoiceCallActionsStore>(
      () => VoiceCallActionsStore(
        joinCall: i<JoinCall>(),
        leaveCall: i<LeaveCall>(),
        muteAudio: i<MuteLocalAudio>(),
        unmuteAudio: i<UnmuteLocalAudio>(),
      ),
    );
    i.add<VoiceCallCoordinator>(
      () => VoiceCallCoordinator(
        initAgoraSdk: i<InitAgoraSdkStore>(),
        voiceCallActions: i<VoiceCallActionsStore>(),
        voiceCallStatus: i<VoiceCallStatusStore>(),
        getAgoraToken: i<GetAgoraTokenStore>(),
        getChannelId: i<GetChannelIdStore>(),
      ),
    );
  }
}
