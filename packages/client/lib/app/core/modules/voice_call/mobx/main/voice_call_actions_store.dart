// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/error/failure.dart';
// * Equatable Import
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/core/modules/voice_call/domain/domain.dart';
import 'package:primala/app/core/modules/voice_call/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'voice_call_actions_store.g.dart';

class VoiceCallActionsStore = _VoiceCallActionsStoreBase
    with _$VoiceCallActionsStore;

abstract class _VoiceCallActionsStoreBase extends BaseMobxDBStore with Store {
  final JoinCallGetterStore joinCallGetterStore;
  final LeaveCallGetterStore leaveCallGetterStore;
  final MuteLocalAudioStreamGetterStore muteAudioGetterStore;
  final UnmuteLocalAudioStreamGetterStore unmuteAudioGetterStore;

  _VoiceCallActionsStoreBase({
    required this.joinCallGetterStore,
    required this.leaveCallGetterStore,
    required this.muteAudioGetterStore,
    required this.unmuteAudioGetterStore,
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
      isMuted = localAudioStreamStatusEntity.isSent;
    });
    //
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
      final res = await muteAudioGetterStore();
      audioStateOrErrorUpdater(res);
    } else {
      final res = await unmuteAudioGetterStore();
      audioStateOrErrorUpdater(res);
    }
  }

  @action
  Future<void> enterOrLeaveCall(Either<NoParams, JoinCallParams> params) async {
    params.fold((NoParams leaveCallParams) async {
      final res = await leaveCallGetterStore();
      callStateOrErrorUpdater(res);
    }, (JoinCallParams joinCallParams) async {
      final res = await joinCallGetterStore(
        channelId: joinCallParams.channelId,
        token: joinCallParams.token,
      );
      callStateOrErrorUpdater(res);
    });
  }

  @override
  List<Object> get props => [];
}
