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
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/getters/join_call_getter_store.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/getters/leave_call_getter_store.dart';
// * Mobx Codegen Inclusion
part 'voice_call_actions_store.g.dart';

class VoiceCallActionsStore = _VoiceCallActionsStoreBase
    with _$VoiceCallActionsStore;

abstract class _VoiceCallActionsStoreBase
    extends BaseMobxDBStore<Either<NoParams, JoinCallParams>, CallStatusEntity>
    with Store {
  final JoinCallGetterStore joinCallGetterStore;
  final LeaveCallGetterStore leaveCallGetterStore;

  _VoiceCallActionsStoreBase({
    required this.joinCallGetterStore,
    required this.leaveCallGetterStore,
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

  @override
  @action
  Future<void> call(params) async {
    params.fold((NoParams leaveCallParams) {
      leaveCallGetterStore();
    }, (JoinCallParams joinCallParams) {
      joinCallGetterStore(
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
