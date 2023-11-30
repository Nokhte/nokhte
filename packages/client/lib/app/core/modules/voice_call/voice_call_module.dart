import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/coordinator/voice_call_coordinator.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/modules/voice_call/data/data.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VoiceCallModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<RtcEngine>(
          (i) => createAgoraRtcEngine(),
          export: true,
        ),
        Bind.singleton<AgoraCallbacksStore>(
          (i) => AgoraCallbacksStore(),
          export: true,
        ),
        Bind.singleton<VoiceCallRemoteSourceImpl>(
          (i) => VoiceCallRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
            agoraCallbacksStore: i<AgoraCallbacksStore>(),
            agoraEngine: i<RtcEngine>(),
          ),
          export: true,
        ),
        Bind.singleton<VoiceCallContractImpl>(
          (i) => VoiceCallContractImpl(
            networkInfo: Modular.get<NetworkInfo>(),
            remoteSource: i<VoiceCallRemoteSource>(),
          ),
          export: true,
        ),
        Bind.singleton<CheckIfUserHasTheQuestion>(
          (i) => CheckIfUserHasTheQuestion(
            contract: i<VoiceCallContract>(),
          ),
          export: true,
        ),
        Bind.singleton<GetAgoraToken>(
          (i) => GetAgoraToken(
            contract: i<VoiceCallContract>(),
          ),
          export: true,
        ),
        Bind.singleton<GetChannelId>(
          (i) => GetChannelId(
            contract: i<VoiceCallContract>(),
          ),
          export: true,
        ),
        Bind.singleton<InstantiateAgoraSdk>(
          (i) => InstantiateAgoraSdk(
            contract: i<VoiceCallContract>(),
          ),
          export: true,
        ),
        Bind.singleton<JoinCall>(
          (i) => JoinCall(
            contract: i<VoiceCallContract>(),
          ),
          export: true,
        ),
        Bind.singleton<LeaveCall>(
          (i) => LeaveCall(
            contract: i<VoiceCallContract>(),
          ),
          export: true,
        ),
        Bind.singleton<MuteLocalAudio>(
          (i) => MuteLocalAudio(
            contract: i<VoiceCallContract>(),
          ),
          export: true,
        ),
        Bind.singleton<UnmuteLocalAudio>(
          (i) => UnmuteLocalAudio(
            contract: i<VoiceCallContract>(),
          ),
          export: true,
        ),
        Bind.singleton<CheckIfUserHasTheQuestionStore>(
          (i) => CheckIfUserHasTheQuestionStore(
            logic: i<CheckIfUserHasTheQuestion>(),
          ),
          export: true,
        ),
        Bind.singleton<GetAgoraTokenStore>(
          (i) => GetAgoraTokenStore(
            logic: i<GetAgoraToken>(),
          ),
          export: true,
        ),
        Bind.singleton<GetChannelIdStore>(
          (i) => GetChannelIdStore(
            logic: i<GetChannelId>(),
          ),
          export: true,
        ),
        Bind.singleton<InstantiateAgoraSdkStore>(
          (i) => InstantiateAgoraSdkStore(
            logic: i<InstantiateAgoraSdk>(),
          ),
          export: true,
        ),
        Bind.singleton<VoiceCallActionsStore>(
          (i) => VoiceCallActionsStore(
            joinCall: i<JoinCall>(),
            leaveCall: i<LeaveCall>(),
            muteAudio: i<MuteLocalAudio>(),
            unmuteAudio: i<UnmuteLocalAudio>(),
          ),
          export: true,
        ),
        Bind.singleton<VoiceCallCoordinator>(
          (i) => VoiceCallCoordinator(
            voiceCallActionsStore: i<VoiceCallActionsStore>(),
            instantiateAgoraSdkStore: i<InstantiateAgoraSdkStore>(),
            getAgoraTokenStore: i<GetAgoraTokenStore>(),
            getChannelIdStore: i<GetChannelIdStore>(),
          ),
          export: true,
        ),
      ];
}
