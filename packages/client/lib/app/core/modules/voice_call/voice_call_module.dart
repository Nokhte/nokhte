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
    i.add<StartRecording>(
      () => StartRecording(
        contract: i<VoiceCallContractImpl>(),
      ),
    );
    i.add<StopRecording>(
      () => StopRecording(
        contract: i<VoiceCallContractImpl>(),
      ),
    );

    i.add<UnmuteLocalAudio>(
      () => UnmuteLocalAudio(
        contract: i<VoiceCallContractImpl>(),
      ),
    );
    i.add<VoiceCallStatusStore>(
      () => VoiceCallStatusStore(),
    );
    i.add<VoiceCallActionsStore>(
      () => VoiceCallActionsStore(
        startRecordingLogic: i<StartRecording>(),
        stopRecordingLogic: i<StopRecording>(),
        joinCallLogic: i<JoinCall>(),
        leaveCallLogic: i<LeaveCall>(),
        muteAudioLogic: i<MuteLocalAudio>(),
        unmuteAudioLogic: i<UnmuteLocalAudio>(),
      ),
    );
    i.add<VoiceCallCoordinator>(
      () => VoiceCallCoordinator(
        initAgoraSdkLogic: i<InitAgoraSdk>(),
        voiceCallActionsStore: i<VoiceCallActionsStore>(),
        voiceCallStatusStore: i<VoiceCallStatusStore>(),
        getAgoraTokenLogic: i<GetAgoraToken>(),
        getChannelIdLogic: i<GetChannelId>(),
      ),
    );
  }
}
