import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/core/widgets/widget_constants.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/p2p_purpose_session/data/data.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/getters/mute_local_audio_stream_getter_store.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/getters/unmute_local_audio_stream_getter_store.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class P2PCollaboratorSessionModule extends Module {
  @override
  List<Bind> get binds => [
        // & Agora RTC Engine Instance
        Bind.singleton<RtcEngine>(
          (i) => createAgoraRtcEngine(),
        ),

        /// % Agora Callback Stores START
        Bind.singleton<AgoraCallbacksStore>(
          (i) => AgoraCallbacksStore(),
        ),

        /// % Agora Callback Stores END
        // & Remote Source
        Bind.singleton<P2PPurposeSessionRemoteSourceImpl>(
          (i) => P2PPurposeSessionRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
            agoraCallbacksStore: i<AgoraCallbacksStore>(),
            agoraEngine: i<RtcEngine>(),
          ),
        ),
        // & Contract Implementation
        Bind.singleton<P2PPurposeSessionContractImpl>(
          (i) => P2PPurposeSessionContractImpl(
            networkInfo: Modular.get<NetworkInfo>(),
            remoteSource: i<P2PPurposeSessionRemoteSource>(),
          ),
        ),
        // & Logic
        Bind.singleton<FetchAgoraToken>(
          (i) => FetchAgoraToken(
            contract: i<P2PPurposeSessionContract>(),
          ),
        ),
        Bind.singleton<FetchChannelId>(
          (i) => FetchChannelId(
            contract: i<P2PPurposeSessionContract>(),
          ),
        ),
        Bind.singleton<InstantiateAgoraSdk>(
          (i) => InstantiateAgoraSdk(
            contract: i<P2PPurposeSessionContract>(),
          ),
        ),
        Bind.singleton<JoinCall>(
          (i) => JoinCall(
            contract: i<P2PPurposeSessionContract>(),
          ),
        ),
        Bind.singleton<LeaveCall>(
          (i) => LeaveCall(
            contract: i<P2PPurposeSessionContract>(),
          ),
        ),
        Bind.singleton<MuteLocalAudioStream>(
          (i) => MuteLocalAudioStream(
            contract: i<P2PPurposeSessionContract>(),
          ),
        ),
        Bind.singleton<UnmuteLocalAudioStream>(
          (i) => UnmuteLocalAudioStream(
            contract: i<P2PPurposeSessionContract>(),
          ),
        ),
        // & MobX Getter Stores
        Bind.singleton<FetchAgoraTokenGetterStore>(
          (i) => FetchAgoraTokenGetterStore(
            logic: i<FetchAgoraToken>(),
          ),
        ),
        Bind.singleton<FetchChannelIdGetterStore>(
          (i) => FetchChannelIdGetterStore(
            logic: i<FetchChannelId>(),
          ),
        ),
        Bind.singleton<InstantiateAgoraSdkGetterStore>(
          (i) => InstantiateAgoraSdkGetterStore(
            logic: i<InstantiateAgoraSdk>(),
          ),
        ),
        Bind.singleton<JoinCallGetterStore>(
          (i) => JoinCallGetterStore(
            logic: i<JoinCall>(),
          ),
        ),
        Bind.singleton<LeaveCallGetterStore>(
          (i) => LeaveCallGetterStore(
            logic: i<LeaveCall>(),
          ),
        ),
        Bind.singleton<MuteLocalAudioStreamGetterStore>(
          (i) => MuteLocalAudioStreamGetterStore(
            logic: i<MuteLocalAudioStream>(),
          ),
        ),
        Bind.singleton<UnmuteLocalAudioStreamGetterStore>(
          (i) => UnmuteLocalAudioStreamGetterStore(
            logic: i<UnmuteLocalAudioStream>(),
          ),
        ),
        // & Mobx Sub Stores
        Bind.singleton<FetchAgoraTokenStore>(
          (i) => FetchAgoraTokenStore(
            getterStore: i<FetchAgoraTokenGetterStore>(),
          ),
        ),
        Bind.singleton<FetchChannelIdStore>(
          (i) => FetchChannelIdStore(
            getterStore: i<FetchChannelIdGetterStore>(),
          ),
        ),
        Bind.singleton<InstantiateAgoraSdkStore>(
          (i) => InstantiateAgoraSdkStore(
            getterStore: i<InstantiateAgoraSdkGetterStore>(),
          ),
        ),
        Bind.singleton<VoiceCallActionsStore>(
          (i) => VoiceCallActionsStore(
            joinCallGetterStore: i<JoinCallGetterStore>(),
            leaveCallGetterStore: i<LeaveCallGetterStore>(),
            muteAudioGetterStore: i<MuteLocalAudioStreamGetterStore>(),
            unmuteAudioGetterStore: i<UnmuteLocalAudioStreamGetterStore>(),
          ),
        ),
        // & Widget State Management Stores
        Bind.factory<BeachWavesTrackerStore>(
          (i) => BeachWavesTrackerStore(),
        ),
        Bind.factory<BreathingPentagonsStateTrackerStore>(
          (i) => BreathingPentagonsStateTrackerStore(),
        ),
        Bind.factory<SmartFadingAnimatedTextTrackerStore>(
          (i) => SmartFadingAnimatedTextTrackerStore(
            isInfinite: false,
            messagesData: MessagesData.p2pPurposeSession,
          ),
        ),

        Bind.factory<FadeInAndChangeColorTextStore>(
          (i) => FadeInAndChangeColorTextStore(
            messageData: const FadeInMessageData(
              fontSize: 25.0,
              message: "swipe up to start call",
            ),
            chosenMovie: FadeInText.movie,
          ),
        ),
        // & Coordinator Stores
        Bind.singleton<P2PPurposePhase1CoordinatorStore>(
          (i) => P2PPurposePhase1CoordinatorStore(
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
            fadeInColorText: Modular.get<FadeInAndChangeColorTextStore>(),
            fadingText: Modular.get<SmartFadingAnimatedTextTrackerStore>(),
            instantiateAgoraSdkStore: i<InstantiateAgoraSdkStore>(),
            fetchAgoraTokenStore: i<FetchAgoraTokenStore>(),
            fetchChannelIdStore: i<FetchChannelIdStore>(),
            voiceCallActionsStore: i<VoiceCallActionsStore>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase2CoordinatorStore>((i) =>
            P2PPurposePhase2CoordinatorStore(
              beachWaves: Modular.get<BeachWavesTrackerStore>(),
              fadingText: Modular.get<SmartFadingAnimatedTextTrackerStore>(),
              breathingPentagons:
                  Modular.get<BreathingPentagonsStateTrackerStore>(),
              voiceCallActionsStore: i<VoiceCallActionsStore>(),
              agoraCallbacksStore: i<AgoraCallbacksStore>(),
            )),
        Bind.singleton<P2PPurposePhase3CoordinatorStore>(
          (i) => P2PPurposePhase3CoordinatorStore(
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase4CoordinatorStore>(
          (i) => P2PPurposePhase4CoordinatorStore(
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
          ),
        ),
        Bind.singleton<P2PPurposePhase5CoordinatorStore>(
          (i) => P2PPurposePhase5CoordinatorStore(
            beachWaves: Modular.get<BeachWavesTrackerStore>(),
          ),
        ),
      ];
  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => P2PPurpose1GreeterScreen(
            coordinator: Modular.get<P2PPurposePhase1CoordinatorStore>(),
            // agoraEngine: Modular.get<RtcEngine>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/phase-2/',
          child: (context, args) => P2PPurpose2ConsultationScreen(
            coordinator: Modular.get<P2PPurposePhase2CoordinatorStore>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/phase-3/',
          child: (context, args) => P2PPurpose3IndividualRefletionScreen(
            coordinator: Modular.get<P2PPurposePhase3CoordinatorStore>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/phase-4/',
          child: (context, args) => P2PPurpose4ReciprocateAttentionScreen(
            coordinator: Modular.get<P2PPurposePhase4CoordinatorStore>(),
          ),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/phase-5/',
          child: (context, args) => P2PPurpose5CollectiveCreation(
            coordinator: Modular.get<P2PPurposePhase5CoordinatorStore>(),
          ),
          transition: TransitionType.noTransition,
        ),
      ];
}
