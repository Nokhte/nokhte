// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/logic/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'voice_call_coordinator.g.dart';

class VoiceCallCoordinator = _VoiceCallCoordinatorBase
    with _$VoiceCallCoordinator;

abstract class _VoiceCallCoordinatorBase extends BaseMobxDBStore with Store {
  final VoiceCallStatusStore voiceCallStatusStore;
  final VoiceCallActionsStore voiceCallActionsStore;
  final GetAgoraToken getAgoraTokenLogic;
  final GetChannelId getChannelIdLogic;
  final InitAgoraSdk initAgoraSdkLogic;
  final VoiceCallIncidentsOverlayStore incidentsOverlayWidgetStore;
  final NokhteBlurStore blur;
  _VoiceCallCoordinatorBase({
    required this.voiceCallStatusStore,
    required this.voiceCallActionsStore,
    required this.getAgoraTokenLogic,
    required this.getChannelIdLogic,
    required this.initAgoraSdkLogic,
    required this.blur,
  }) : incidentsOverlayWidgetStore = VoiceCallIncidentsOverlayStore(
          voiceCallStatusStore: voiceCallStatusStore,
          blur: blur,
        );

  @action
  initReactors({required Function onBothJoinedCall}) {
    onCollaboratorCallStatusChangeReactor(onBothJoinedCall);
  }

  @observable
  bool isInitialized = false;

  @observable
  bool isInitialJoin = true;

  @observable
  String channelId = "";

  @observable
  String token = "";

  @observable
  RtcEngine rtcEngine = createAgoraRtcEngine();

  @action
  initSdk() async {
    if (!isInitialized) {
      state = StoreState.loading;
      rtcEngine = await initAgoraSdkLogic(NoParams());
      voiceCallStatusStore.registerCallbacks(rtcEngine);
      isInitialized = true;
      state = StoreState.loaded;
    }
  }

  @action
  _getChannelId(GetChannelIdParams callType) async {
    state = StoreState.loading;
    final res = await getChannelIdLogic(callType);
    res.fold(
      (failure) => errorUpdater(failure),
      (newChannelId) => channelId = newChannelId,
    );
  }

  @action
  _getToken() async {
    state = StoreState.loading;
    final res =
        await getAgoraTokenLogic(GetAgoraTokenParams(channelName: channelId));
    res.fold(
      (failure) => errorUpdater(failure),
      (newToken) => token = newToken,
    );
  }

  @action
  joinCall({
    required bool shouldEnterTheCallMuted,
    GetChannelIdParams callType = GetChannelIdParams.forCollaboration,
  }) async {
    incidentsOverlayWidgetStore.constructor();
    await initSdk();
    await _getChannelId(callType);
    await _getToken();
    await voiceCallActionsStore.joinCall(
      JoinCallParams(
        token: token,
        channelId: channelId,
      ),
    );
    if (shouldEnterTheCallMuted) {
      await voiceCallActionsStore.mute();
    }
  }

  @action
  unmute() async => await voiceCallActionsStore.unmute();

  @action
  mute() async => await voiceCallActionsStore.mute();

  @action
  startRecording(String fileName) async =>
      await voiceCallActionsStore.startRecording(fileName);

  @action
  stopRecording() async => await voiceCallActionsStore.stopRecording();

  @action
  leaveCall() async => await voiceCallActionsStore.leaveCall(NoParams());

  onCollaboratorCallStatusChangeReactor(
    Function onBothJoinedCall,
  ) =>
      reaction((p0) => voiceCallStatusStore.hasCollaboratorJoined, (p0) async {
        if (p0 && isInitialJoin) {
          onBothJoinedCall();
          incidentsOverlayWidgetStore.setShowJoiningCall(false);
          blur.reverse();
          isInitialJoin = false;
        }
      });

  @override
  List<Object> get props => [];
}
