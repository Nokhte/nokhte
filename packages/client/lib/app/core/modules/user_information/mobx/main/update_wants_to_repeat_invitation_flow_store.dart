// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';
part 'update_wants_to_repeat_invitation_flow_store.g.dart';

class UpdateWantsToRepeatInvitationFlowStore = _UpdateWantsToRepeatInvitationFlowStoreBase
    with _$UpdateWantsToRepeatInvitationFlowStore;

abstract class _UpdateWantsToRepeatInvitationFlowStoreBase
    extends BaseMobxDBStore<bool, WantsToRepeatInvitationFlowUpdateStatusEntity>
    with Store {
  @observable
  bool isUpdated = false;

  final UpdateWantsToRepeatInvitationFlow logic;
  _UpdateWantsToRepeatInvitationFlowStoreBase({required this.logic});

  @observable
  BaseFutureStore<WantsToRepeatInvitationFlowUpdateStatusEntity> futureStore =
      BaseFutureStore(
    baseEntity: Right(WantsToRepeatInvitationFlowUpdateStatusEntity.initial),
    entityFutureParam: ObservableFuture(
      Future.value(
          Right(WantsToRepeatInvitationFlowUpdateStatusEntity.initial)),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (updateStatusEntity) {
      isUpdated = updateStatusEntity.isTrue;
    });
  }

  @override
  @action
  Future<void> call(params) async {
    state = StoreState.loading;
    futureStore.entityOrFailureFuture = ObservableFuture(logic(params));
    futureStore.unwrappedEntityOrFailure =
        await futureStore.entityOrFailureFuture;
    stateOrErrorUpdater(futureStore.unwrappedEntityOrFailure);
    state = StoreState.loaded;
  }
}
