// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
part 'voice_call_actions_store.g.dart';

class VoiceCallActionsStore = _VoiceCallActionsStoreBase
    with _$VoiceCallActionsStore;

abstract class _VoiceCallActionsStoreBase extends BaseMobxDBStore with Store {
  final JoinCall joinCallLogic;
  final LeaveCall leaveCallLogic;
  final MuteLocalAudio muteAudioLogic;
  final UnmuteLocalAudio unmuteAudioLogic;
  final StartRecording startRecordingLogic;
  final StopRecording stopRecordingLogic;

  _VoiceCallActionsStoreBase({
    required this.joinCallLogic,
    required this.leaveCallLogic,
    required this.muteAudioLogic,
    required this.unmuteAudioLogic,
    required this.startRecordingLogic,
    required this.stopRecordingLogic,
  });

  @observable
  CallStatus callStatus = CallStatus.initial;

  @observable
  bool isMuted = true;

  @observable
  bool isRecording = false;

  @action
  startRecording(fileName) async {
    final res = await startRecordingLogic(fileName);
    res.fold((failure) => errorUpdater(failure), (res) => isRecording = res);
  }

  @action
  stopRecording() async {
    final res = await stopRecordingLogic(NoParams());
    res.fold((failure) => errorUpdater(failure), (res) => isRecording = res);
  }

  @action
  unmute() async {
    final res = await unmuteAudioLogic(NoParams());
    res.fold((failure) => errorUpdater(failure), (res) => isMuted = res);
  }

  @action
  mute() async {
    final res = await muteAudioLogic(NoParams());
    res.fold((failure) => errorUpdater(failure), (res) => isMuted = res);
  }

  @action
  joinCall(JoinCallParams params) async {
    final res = await joinCallLogic(params);
    res.fold((failure) => errorUpdater(failure), (res) => callStatus = res);
  }

  @action
  leaveCall(NoParams params) async {
    final res = await leaveCallLogic(params);
    res.fold((failure) => errorUpdater(failure), (res) => callStatus = res);
  }

  @override
  List<Object> get props => [];
}
