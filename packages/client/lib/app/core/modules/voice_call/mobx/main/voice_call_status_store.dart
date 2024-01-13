// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
part 'voice_call_status_store.g.dart';

class VoiceCallStatusStore = _VoiceCallStatusStoreBase
    with _$VoiceCallStatusStore;

abstract class _VoiceCallStatusStoreBase extends Equatable with Store {
  @action
  registerCallbacks(RtcEngine agoraEngine) {
    agoraEngine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (connection, elapsed) => onCallJoined(),
        onLeaveChannel: (connection, elapsed) => onCallLeft(),
        onUserJoined: (connection, remoteUid, elapsed) =>
            collaboratorHasJoined(),
        onUserOffline: (connection, remoteUid, reason) => collaboratorHasLeft(),
      ),
    );
  }

  @observable
  CallStatus inCall = CallStatus.initial;

  @observable
  bool hasCollaboratorJoined = false;

  @action
  onCallJoined() {
    inCall = CallStatus.joined;
  }

  @action
  collaboratorHasJoined() {
    hasCollaboratorJoined = true;
  }

  @action
  collaboratorHasLeft() {
    hasCollaboratorJoined = false;
  }

  @action
  onCallLeft() {
    inCall = CallStatus.left;
  }

  @override
  List<Object> get props => [];
}
