// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/base_mobx_db_store.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'voice_call_actions_store.g.dart';

class VoiceCallActionsStore = _VoiceCallActionsStoreBase
    with _$VoiceCallActionsStore;

abstract class _VoiceCallActionsStoreBase
    extends BaseMobxDBStore<Either<NoParams, JoinCallParams>, CallStatusEntity>
    with Store {
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

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (callStatusEntity) {
      callStatus = callStatusEntity.callStatus;
      //
    });
  }

  @action
  Future<void> muteOrUnmuteAudio({required bool wantToMute}) async {
    if (wantToMute) {
      muteAudioGetterStore();
    } else {
      unmuteAudioGetterStore();
    }
  }

  @action
  Future<void> enterOrLeaveCall(Either<NoParams, JoinCallParams> params) async {
    params.fold((NoParams leaveCallParams) async {
      await leaveCallGetterStore();
    }, (JoinCallParams joinCallParams) async {
      await joinCallGetterStore(
        channelId: joinCallParams.channelId,
        token: joinCallParams.token,
      );
    });
  }

  @override
  List<Object> get props => [
// some items
      ];
}
