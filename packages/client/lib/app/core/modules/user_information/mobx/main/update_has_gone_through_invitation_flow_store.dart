// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';
part 'update_has_gone_through_invitation_flow_store.g.dart';

class UpdateHasGoneThroughInvitationFlowStore = _UpdateHasGoneThroughInvitationFlowStoreBase
    with _$UpdateHasGoneThroughInvitationFlowStore;

abstract class _UpdateHasGoneThroughInvitationFlowStoreBase
    extends BaseMobxDBStore<bool, bool> with Store {
  @observable
  bool isUpdated = false;

  final UpdateHasGoneThroughInvitationFlow logic;
  _UpdateHasGoneThroughInvitationFlowStoreBase({required this.logic});

  @observable
  BaseFutureStore<bool> futureStore = BaseFutureStore(
    baseEntity: const Right(false),
    entityFutureParam: ObservableFuture(
      Future.value(const Right(false)),
    ),
  );

  @override
  void stateOrErrorUpdater(result) {
    result.fold((failure) {
      errorMessage = mapFailureToMessage(failure);
      state = StoreState.initial;
    }, (updateStatus) {
      isUpdated = updateStatus;
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
