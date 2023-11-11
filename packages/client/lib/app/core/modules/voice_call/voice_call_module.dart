import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
        Bind.singleton<FetchAgoraToken>(
          (i) => FetchAgoraToken(
            contract: i<VoiceCallContract>(),
          ),
          export: true,
        ),
        Bind.singleton<FetchChannelId>(
          (i) => FetchChannelId(
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
        Bind.singleton<MuteLocalAudioStream>(
          (i) => MuteLocalAudioStream(
            contract: i<VoiceCallContract>(),
          ),
          export: true,
        ),
        Bind.singleton<UnmuteLocalAudioStream>(
          (i) => UnmuteLocalAudioStream(
            contract: i<VoiceCallContract>(),
          ),
          export: true,
        ),
        Bind.singleton<CheckIfUserHasTheQuestionGetterStore>(
          (i) => CheckIfUserHasTheQuestionGetterStore(
            logic: i<CheckIfUserHasTheQuestion>(),
          ),
          export: true,
        ),
        Bind.singleton<FetchAgoraTokenGetterStore>(
          (i) => FetchAgoraTokenGetterStore(
            logic: i<FetchAgoraToken>(),
          ),
          export: true,
        ),
        Bind.singleton<FetchChannelIdGetterStore>(
          (i) => FetchChannelIdGetterStore(
            logic: i<FetchChannelId>(),
          ),
          export: true,
        ),
        Bind.singleton<InstantiateAgoraSdkGetterStore>(
          (i) => InstantiateAgoraSdkGetterStore(
            logic: i<InstantiateAgoraSdk>(),
          ),
          export: true,
        ),
        Bind.singleton<JoinCallGetterStore>(
          (i) => JoinCallGetterStore(
            logic: i<JoinCall>(),
          ),
          export: true,
        ),
        Bind.singleton<LeaveCallGetterStore>(
          (i) => LeaveCallGetterStore(
            logic: i<LeaveCall>(),
          ),
          export: true,
        ),
        Bind.singleton<MuteLocalAudioStreamGetterStore>(
          (i) => MuteLocalAudioStreamGetterStore(
            logic: i<MuteLocalAudioStream>(),
          ),
          export: true,
        ),
        Bind.singleton<UnmuteLocalAudioStreamGetterStore>(
          (i) => UnmuteLocalAudioStreamGetterStore(
            logic: i<UnmuteLocalAudioStream>(),
          ),
          export: true,
        ),
        Bind.singleton<CheckIfUserHasTheQuestionStore>(
          (i) => CheckIfUserHasTheQuestionStore(
            getterStore: i<CheckIfUserHasTheQuestionGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<FetchAgoraTokenStore>(
          (i) => FetchAgoraTokenStore(
            getterStore: i<FetchAgoraTokenGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<FetchChannelIdStore>(
          (i) => FetchChannelIdStore(
            getterStore: i<FetchChannelIdGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<InstantiateAgoraSdkStore>(
          (i) => InstantiateAgoraSdkStore(
            getterStore: i<InstantiateAgoraSdkGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<VoiceCallActionsStore>(
          (i) => VoiceCallActionsStore(
            joinCallGetterStore: i<JoinCallGetterStore>(),
            leaveCallGetterStore: i<LeaveCallGetterStore>(),
            muteAudioGetterStore: i<MuteLocalAudioStreamGetterStore>(),
            unmuteAudioGetterStore: i<UnmuteLocalAudioStreamGetterStore>(),
          ),
          export: true,
        ),
      ];
}
