// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_mobx_db_store.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
part 'voice_call_actions_store.g.dart';

class VoiceCallActionsStore = _VoiceCallActionsStoreBase
    with _$VoiceCallActionsStore;

abstract class _VoiceCallActionsStoreBase extends BaseMobxDBStore with Store {
  final JoinCall joinCall;
  final LeaveCall leaveCall;
  final MuteLocalAudio muteAudio;
  final UnmuteLocalAudio unmuteAudio;

  _VoiceCallActionsStoreBase({
    required this.joinCall,
    required this.leaveCall,
    required this.muteAudio,
    required this.unmuteAudio,
  });

  @observable
  CallStatus callStatus = CallStatus.initial;

  @observable
  bool isMuted = true;

  audioStateOrErrorUpdater(
      Either<Failure, LocalAudioStreamStatusEntity> result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
      isMuted = true;
    }, (localAudioStreamStatusEntity) {
      isMuted = localAudioStreamStatusEntity.isTrue;
    });
  }

  callStateOrErrorUpdater(Either<Failure, CallStatusEntity> result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
      callStatus = CallStatus.initial;
    }, (callStatusEntity) {
      callStatus = callStatusEntity.callStatus;
    });
  }

  @action
  Future<void> muteOrUnmuteAudio({required bool wantToMute}) async {
    if (wantToMute) {
      final res = await muteAudio(NoParams());
      audioStateOrErrorUpdater(res);
    } else {
      final res = await unmuteAudio(NoParams());
      audioStateOrErrorUpdater(res);
    }
  }

  @action
  Future<void> enterOrLeaveCall(Either<NoParams, JoinCallParams> params) async {
    params.fold((NoParams leaveCallParams) async {
      final res = await leaveCall(NoParams());
      callStateOrErrorUpdater(res);
    }, (JoinCallParams joinCallParams) async {
      final res = await joinCall(
        JoinCallParams(
          token: joinCallParams.token,
          channelId: joinCallParams.channelId,
        ),
      );
      callStateOrErrorUpdater(res);
    });
  }

  @override
  List<Object> get props => [];
}
